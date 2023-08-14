import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ownerapp/FIRSTPART/paymentpage.dart';
import 'package:ownerapp/FIRSTPART/purchasepage.dart';
import 'package:ownerapp/FIRSTPART/salespage.dart';
import 'Settingspage.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text(
                    'VINTECH',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("SOFT SOLUTIONs")
                ],
              ),
            ),
          ),
        Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(bottom: 10, left: 180, right: 20, top: 10),
              child: Text(
                "DATE :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: 20, left: 20, right: 170, top: 20),
                child: Text(
                  "OPENING BALANCE :          ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => purchasepg(),));
              },
              child: Card(
                elevation: 10,
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: 20, left: 20, right: 10, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "PURCHASE DEPARTMENT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Icon(Icons.shopping_bag)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => salespg(),));
              },
              child: Card(
                elevation: 10,
                child: Padding(
                  padding:
                  EdgeInsets.only(bottom: 20, left: 20, right: 10, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "SALES DEPARTMENT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Icon(Icons.point_of_sale)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => paymentpage(),));
              },
              child: Card(
                elevation: 10,
                child: Padding(
                  padding:
                  EdgeInsets.only(bottom: 20, left: 20, right: 10, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "PAYMENT DEPARTMENT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Icon(Icons.payment)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Card(
              elevation: 10,
              child: Padding(
                padding:
                EdgeInsets.only(bottom: 20, left: 20, right: 10, top: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("      SALARY PAID     :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),),
                        SizedBox(
                          height: 10,
                        ),
                        Text("     NEW SUPPLIER :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),),
                        SizedBox(
                          height: 10,
                        ),
                        Text("   ROOM RENT      :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),

            Text("TOTAL : ",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15),),
            SizedBox(
              height: 50,
            ),

          ],
        ),
          ]),
      ),
    );
  }
}
