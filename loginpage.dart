import 'package:flutter/material.dart';
import 'package:ownerapp/FIRSTPART/purchasepage.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  var UsernameController=TextEditingController();
  var PasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Center(
                child: Text(
                  'VINTECH',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: UsernameController,
                decoration: InputDecoration(
                  hintText: 'username',
                  prefixIcon: Icon(Icons.drive_file_rename_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: PasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  login();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Login'),
              ),
            ),

            SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => homepage(),));
                },
                child: Text('Forgot Password?'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> login() async {
    String username = UsernameController.text;
    String password = PasswordController.text;

    if (password.isNotEmpty && username.isNotEmpty) {
      try {
        var response = await http.post(
          Uri.parse('http://api.demo-zatreport.vintechsoftsolutions.com/api/User/DoLogin'),
          body: {
            'Username': username,
            'Password': password,
          },
        );
         print("API Response: ${response.body}");
        if (response.statusCode == 200) {
          var responseData = jsonDecode(response.body);
          if (responseData['Status'] == "200" &&
              responseData['Data']['ResponseData'] != null &&
              responseData['Data']['ResponseData'][0]['Username'] == username &&
              responseData['Data']['ResponseData'][0]['Password'] == password) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => homepage(),));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
          }
        }
      } catch (e) {
        print("Exception: $e");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid login")));
    }
  }
}
