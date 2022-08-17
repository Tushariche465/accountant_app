import 'dart:async';
import 'package:accountant_app/src/homescreen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SplashScreen2())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            height: (MediaQuery.of(context).size.height) * 0.8,
            margin:
            EdgeInsets.only(top: (MediaQuery.of(context).size.height) * 0.08),
            child: Center(
              child: Image.asset(
                'assets/images/splash-removebg-preview.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          )),
    );
  }
}

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            height: (MediaQuery.of(context).size.height) * 0.8,
            margin:
            EdgeInsets.only(top: (MediaQuery.of(context).size.height) * 0.08),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.48,
                  //color: Colors.white,
                  child: Image.asset(
                    'assets/images/splash-removebg-preview.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),

                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()));
                              },
                              child: Container(
                                alignment: Alignment.bottomRight,
                                width: MediaQuery.of(context).size.width * 0.75,
                                height: MediaQuery.of(context).size.height * 0.048,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.orangeAccent),
                                child: Center(
                                    child: Text(
                                      'Get Started',
                                      style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.height * 0.025,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                )
              ],
            ),
          )
        ),
    );
  }
}
