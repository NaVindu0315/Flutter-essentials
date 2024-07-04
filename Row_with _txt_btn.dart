    Row(
                                children: [
                                  SizedBox(
                                    height: 70,
                                    width:
                                        230, // Set the width of the SizedBox to 300 pixels
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextFormField(
                                        controller: lmpcontroller,
                                        onChanged: (value) {
                                          user_lmp = value;
                                        },
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.info,
                                          ),
                                          labelText: 'lmp',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width:
                                        120, // Set the width of the SizedBox to 300 pixels
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        onPrimary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // border radius
                                        ),
                                      ),
                                      onPressed: () {
                                        sendPregnancyData(
                                            user_lmp,
                                            pregnancyDetailsProvider.edd,
                                            pregnancyDetailsProvider.agreedEdd,
                                            pregnancyDetailsProvider
                                                .bookingWeight,
                                            pregnancyDetailsProvider
                                                .bookingHeight,
                                            pregnancyDetailsProvider
                                                .gestationAge,
                                            pregnancyDetailsProvider
                                                .riskCategory,
                                            57,
                                            pregnancyDetailsProvider.mother);
                                        lmpcontroller.clear();
                                      },
                                      child: Text(
                                        'Submit ',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
