//import 'package:accoutapp/src/driverscreen.dart';
import 'package:accountant_app/src/homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _mobilenumbercontroller = TextEditingController();
  late TextEditingController _passwordcontroller = TextEditingController();
  final Stream<QuerySnapshot> credentials = FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: (MediaQuery.of(context).size.height) * 0.9,
        margin:
        EdgeInsets.only(top: (MediaQuery.of(context).size.height) * 0.09),
        child: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height ,

              child: StreamBuilder(
                stream: credentials,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  final data = snapshot.requireData;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03),

                        child:  const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),

                            )),
                      ),

                      Container(
                        //margin: const EdgeInsets.only(top: 0),
                        width: (MediaQuery.of(context).size.width) * 0.9,
                        height: (MediaQuery.of(context).size.height) * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.grey.shade100)),

                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 2),
                        child: TextField(
                          controller: _mobilenumbercontroller,
                          keyboardType: TextInputType.name,
                          onChanged: (_mobilenumbercontroller){

                          },
                          decoration: const InputDecoration(
                            //enabledBorder: ,

                            //border: InputBorder.none,

                            hintText: 'Mobile Number',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 25),
                        width: (MediaQuery.of(context).size.width) * 0.9,
                        height: (MediaQuery.of(context).size.height) * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.grey.shade100)),
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 2),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _passwordcontroller,
                          decoration: InputDecoration(
                            //enabledBorder: ,

                            //border: InputBorder.none,

                            hintText: 'Password',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: (MediaQuery.of(context).size.height) * 0.03,
                            bottom: (MediaQuery.of(context).size.height) * 0.03),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              print('mobile ${_mobilenumbercontroller.text} and password ${_passwordcontroller.text}');
                              if(_mobilenumbercontroller.text=='${data.docs[0]['number']}'&&_passwordcontroller.text=='${data.docs[0]['password']}')
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AccoutantScreen()));
                              }
                              else{
                                print('wrong password');
                              }

                            },
                            child: Container(
                              width: (MediaQuery.of(context).size.width) * 0.9,
                              height: (MediaQuery.of(context).size.height) * 0.07,
                              decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.height * 0.025,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ),
                          ),
                        ),
                      ),

                    ],
                  );
                },

              )

          ),
        ),
      ),
    );
  }
}
