import 'package:flutter/material.dart';
class paymentpage extends StatefulWidget {
  const paymentpage({Key? key}) : super(key: key);

  @override
  State<paymentpage> createState() => _paymentpageState();
}

class _paymentpageState extends State<paymentpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("PAYMENT"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cash Payment :"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Bank Payment :"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Total :",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
