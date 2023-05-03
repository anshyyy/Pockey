import 'package:flutter/material.dart';
import 'package:pockey/view/profileForm.dart';

import '../constants/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhite,
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.9,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CircleAvatar(
                      radius: 40.0,
                      child: ClipRRect(
                        child: Image.asset('assets/images/avatar.jpg'),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    Text(
                      "Anshyyy",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "anshuman9998@gmail.com",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileFormPage()));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            "Edit Profile ",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.black, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 0,
                              offset: Offset(4, 4),
                            ),
                          ],
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3, top: 3),
                              child: Row(
                                children: [
                                  Icon(Icons.settings),
                                  const SizedBox(width: 10),
                                  Text(
                                    " Preferences ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            width: MediaQuery.of(context).size.width - 43,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.black, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 0,
                                  offset: Offset(4, 4),
                                ),
                              ],
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    "App Mangagement",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Colors.black, width: 2),
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: () {},
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3, top: 3),
                    child: Row(
                      children: [
                        Icon(Icons.backup),
                        const SizedBox(width: 10),
                        Text(
                          " Backup Data ",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 0,
                        offset: Offset(4, 4),
                      ),
                    ],
                    color: Colors.lightGreen,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3, top: 3),
                    child: Row(
                      children: [
                        Icon(Icons.import_export),
                        const SizedBox(width: 10),
                        Text(
                          " Export Data ",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 43,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 0,
                        offset: Offset(4, 4),
                      ),
                    ],
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3, top: 3),
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        const SizedBox(width: 10),
                        Text(
                          " Delete Data ",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 43,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 0,
                        offset: Offset(4, 4),
                      ),
                    ],
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
