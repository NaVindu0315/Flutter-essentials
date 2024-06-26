import 'package:flutter/material.dart';

class Realtime extends StatelessWidget {
  const Realtime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RealData(),
    );
  }
}

class RealData extends StatefulWidget {
  const RealData({Key? key}) : super(key: key);

  @override
  State<RealData> createState() => _RealDataState();
}

class _RealDataState extends State<RealData> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController studentcontroller = new TextEditingController();

  int stnum = 0;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // preferredSize: Size.fromHeight(kToolbarHeight + 20),
          backgroundColor: Colors.orange,
          title: Center(
            child: Text(
              'Real Time Data',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SafeArea(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text(
                  'Name - ',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '$name',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Text(
                  'Student Number - ',
                  style: TextStyle(fontSize: 25.0, color: Colors.black),
                ),
                Text(
                  '$stnum',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 300, // Set the width of the SizedBox to 300 pixels
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: namecontroller,
                      onChanged: (value) {
                        //email = value;
                        name = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.summarize_outlined,
                        ),
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),

            ///student numer
            Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 300, // Set the width of the SizedBox to 300 pixels
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: studentcontroller,
                      onChanged: (value) {
                        //email = value;
                        stnum = int.parse(value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.summarize_outlined,
                        ),
                        labelText: 'Student Number ',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // border radius
                    ),
                  ),
                  onPressed: () {
                    // button press action
                  },
                  child: Text(
                    'Add Data',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
              ],
            ),
          ]),
        ));
  }
}
