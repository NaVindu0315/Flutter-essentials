import 'package:flutter/material.dart';
import 'package:lets_vote/Colors/colors.dart';
import 'package:lets_vote/cam.dart';
import 'package:lets_vote/pages/comparing_page.dart';
import 'package:lets_vote/pages/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Voting_home.dart';

late User loggedinuser;
late String client;

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  TextEditingController loggedinusercontroller = TextEditingController();
  TextEditingController imageurlcontroller = TextEditingController();

  ///to get the current user
  @override
  void initState() {
    super.initState();
    getcurrentuser();
  }

  void getcurrentuser() async {
    try {
      // final user = await _auth.currentUser();
      ///yata line eka chatgpt code ekk meka gatte uda line eke error ekk ena hinda hrytama scene eka terenne na
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggedinuser = user;
        client = loggedinuser.email!;

        ///i have to call the getdatafrm the function here and parse client as a parameter

        print(loggedinuser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(client)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return Scaffold(
                resizeToAvoidBottomInset: false,

                ///navigation bar eka iwrii
                ///drawer
                drawer: Drawer(
                  width: 300,
                  child: Container(
                    color: AppColors.backgroundcolor, //color of list tiles
                    // Add a ListView to ensures the user can scroll
                    child: ListView(
                      // Remove if there are any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        UserAccountsDrawerHeader(
                          decoration: BoxDecoration(
                            color:
                                AppColors.buttoncolor, //color of drawer header
                          ),
                          accountName: Text(
                            '${data!['username']}',
                            style: TextStyle(
                              color: AppColors.backgroundcolor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          accountEmail: Text(
                            client,
                            style: TextStyle(
                                color: AppColors.backgroundcolor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          currentAccountPicture: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage('${data!['url']}'),
                          ),
                        ),

                        //Home
                        Builder(builder: (context) {
                          return ListTile(
                            leading: Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            title: const Text('Home',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)),
                            onTap: () {
                              /*   Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashBoard()),
                              );*/
                            },
                          );
                        }),
                        //Cam page
                        Builder(builder: (context) {
                          return ListTile(
                            leading: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            title: const Text('Image Testing Page',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => myapp()),
                              );
                            },
                          );
                        }),
                        //Announcement
                        Builder(builder: (context) {
                          return ListTile(
                            leading: Icon(
                              Icons.face,
                              color: Colors.white,
                            ),
                            title: const Text('Face Comparing Test',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Compare_page()),
                              );
                            },
                          );
                        }),

                        ///voting home
                        Builder(builder: (context) {
                          return ListTile(
                            leading: Icon(
                              Icons.how_to_vote,
                              color: Colors.white,
                            ),
                            title: const Text('Voting Home',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => voting_home()),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),

                ///drawwe end
                appBar: AppBar(
                  // preferredSize: Size.fromHeight(kToolbarHeight + 20),
                  backgroundColor: AppColors.backgroundcolor,

                  title: Text(
                    'Welcome To Lets Vote',
                    style: TextStyle(color: Colors.white),
                  ),
                  iconTheme: IconThemeData(color: Colors.white),

                  //centerTitle: true,
                ),
                body: Stack(children: [
                  // Background image container
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/bg_image.jpg'), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 32.0,
                        ),
                        CircleAvatar(
                            backgroundColor: AppColors.backgroundcolor,
                            minRadius: 70.5,
                            child: CircleAvatar(
                                radius: 70,
                                backgroundImage:
                                    //AssetImage('images/g.png'),
                                    NetworkImage('${data!['url']}'))),

                        ///main
                        Column(
                          //first row
                          children: [
                            ///Row for the text field
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  '${data!['username']}',
                                  style: TextStyle(
                                      color: AppColors.backgroundcolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                Spacer()
                              ],
                            ),

                            ///row for the designation
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  'Designation',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                Spacer()
                              ],
                            ),

                            ///row for the designation end
                            SizedBox(
                              height: 40.0,
                            ),

                            ///row end
                            Row(
                              children: [
                                //first box
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    print('fuck');
                                  },
                                  child: Container(
                                      height: 120.0,
                                      child: Card(
                                        color: AppColors.backgroundcolor,
                                        child: Image.asset('assets/empmg.png'),
                                      ),
                                      margin: EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        //color: Color(0xFF101E33),
                                        color: AppColors.backgroundcolor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                )),
                                //second box
                                Expanded(
                                    child: GestureDetector(
                                  onTap: null,
                                  child: Container(
                                      height: 120.0,
                                      child: Card(
                                        color: AppColors.backgroundcolor,
                                        child: Image.asset('assets/msg.png'),
                                      ),
                                      margin: EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        //color: Color(0xFF101E33),
                                        color: AppColors.backgroundcolor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                )),
                              ],
                            ),

                            ///second row
                            Row(
                              children: [
                                //first box
                                Expanded(
                                    child: GestureDetector(
                                  onTap: null,
                                  child: Container(
                                      height: 120.0,
                                      child: Card(
                                        color: AppColors.backgroundcolor,
                                        child: Image.asset('assets/vote.png'),
                                      ),
                                      margin: EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        //color: Color(0xFF101E33),
                                        color: AppColors.backgroundcolor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                )),
                              ],
                            ),

                            ///third row
                            Row(
                              children: [
                                //first box
                                Expanded(
                                    child: GestureDetector(
                                  onTap: null,
                                  child: Container(
                                      height: 120.0,
                                      child: Card(
                                        color: AppColors.backgroundcolor,
                                        child: Image.asset('assets/create.png'),
                                      ),
                                      margin: EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        //color: Color(0xFF101E33),
                                        color: AppColors.backgroundcolor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                )),
                                //second box
                                Expanded(
                                    child: GestureDetector(
                                  onTap: null,
                                  child: Container(
                                      height: 120.0,
                                      child: Card(
                                        color: AppColors.backgroundcolor,
                                        child: Image.asset('assets/post.png'),
                                      ),
                                      margin: EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        //color: Color(0xFF101E33),
                                        color: AppColors.backgroundcolor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                )),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ]),
              );
            }
            return CircularProgressIndicator();
          }),
    ));
  }
}
