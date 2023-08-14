import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ownerapp/FIRSTPART/purchasepage.dart';
import 'SPLASHSCREEN.dart';
import 'Settingspage.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool showTodayData = true;
  late DateTime selectedDate = DateTime.now();
  late DateTime selectedDateTo = DateTime.now();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _dateControllerTo = TextEditingController();

  Future<List<Map<String, dynamic>>> getData() async {
    try {
      final response = await http.get(Uri.parse(
          'http://api.demo-zatreport.vintechsoftsolutions.com/api/Company/CompanyList/'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final data1 = jsonData['Data']['ResponseData']['Data1'];
        return List<Map<String, dynamic>>.from(data1);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the API');
    }
  }

  //API ADDING THE OVERAL TRANSATION
  Future<List<Map<String, dynamic>>> getSecondData() async {
    try {
      final response = await http.get(Uri.parse(
          'http://api.demo-zatreport.vintechsoftsolutions.com/api/Company/GetOverallTrans?viewmode=full&today=2021-10-23&compid=0'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final data = jsonData['Data']['ResponseData'];
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the API');
    }
  }

  List<List<T>> chunkList<T>(List<T> list, int chunkSize) {
    List<List<T>> chunks = [];
    for (var i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(
          i, i + chunkSize > list.length ? list.length : i + chunkSize));
    }
    return chunks;
  }

  @override
  void initState() {
    super.initState();
    _dateController.text = _dateFormat.format(selectedDate);
    _dateControllerTo.text = _dateFormat.format(selectedDateTo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 2000,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/white.jpg'), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 300, top: 10),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => settingspae1(),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        Text(
                          'VINTECH',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("SOFT SOLUTIONs"),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: FutureBuilder(
                        future: getData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else {
                            final dataList =
                                snapshot.data as List<Map<String, dynamic>>;

                            final chunkedData = chunkList(
                                dataList, 2); // Split data into chunks of 2
                            return Column(
                              children: [
                                for (final chunk in chunkedData)
                                  Row(
                                    children: [
                                      for (final companyData in chunk)
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: 250,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                elevation: 40,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network(
                                                        'https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c2hvcHBpbmclMjBtYWxsJTIwaW50ZXJpb3J8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    ListTile(
                                                      title: Text(companyData[
                                                          'CompanyName']),
                                                      subtitle: Text(
                                                        companyData['Address'],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  purchasepg(),
                                                            ));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                    FutureBuilder(
                      future: getSecondData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final secondDataList =
                              snapshot.data as List<Map<String, dynamic>>;
                          double totalCash = 0;
                          double totalCredit = 0;
                          double totalAmount = 0;
                          double totalCard = 0;

                          for (final secondData in secondDataList) {
                            totalCash += secondData['Cash'];
                            totalCredit += secondData['Credit'];
                            totalAmount += secondData['TotalAmount'];
                            totalCard += secondData['Card'];
                          }

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          showTodayData = true; // Set showTodayData to true to show Today's data
                                        });
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 50,
                                        child: Card(
                                          elevation: 5,
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                //color: Colors.grey,
                                                border: Border(
                                                  left: BorderSide(width: 3, color: Colors.blueGrey),
                                                ),
                                              ),
                                              child: Center(child: Text("Today"))),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showTodayData = true;
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 50,
                                        child: Card(
                                          elevation: 5,
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                //color: Colors.grey,
                                                border: Border(
                                                  left: BorderSide(width: 3, color: Colors.black54),
                                                ),
                                              ),
                                              child: Center(child: Text("Weekly"))),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showTodayData = true;
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 50,
                                        child: Card(
                                          elevation: 5,
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                //color: Colors.grey,
                                                border: Border(
                                                  left: BorderSide(width: 3, color: Colors.brown),
                                                ),
                                              ),
                                              child: Center(child: Text("Monthly"))),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 350,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                    ),
                                    side: BorderSide(
                                        width: 0, color: Colors.brown),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text('Cash: ${showTodayData ? totalCash.toStringAsFixed(2) : "Month data"}'),
                                      ),
                                      Divider(
                                        color: Colors.blueGrey,
                                        endIndent: 10,
                                        indent: 10,
                                      ),
                                      ListTile(
                                        title: Text('Credit: ${showTodayData ? totalCredit.toStringAsFixed(2) : "Month data"}'),
                                      ),
                                      Divider(
                                        color: Colors.blueGrey,
                                        endIndent: 10,
                                        indent: 10,
                                      ),
                                      ListTile(
                                        title: Text('Card: ${showTodayData ? totalCard.toStringAsFixed(2) : "Month data"}'),
                                      ),
                                      Divider(
                                        color: Colors.blueGrey,
                                        endIndent: 10,
                                        indent: 10,
                                      ),
                                      ListTile(
                                        title: Text('Total Amount: ${showTodayData ? totalAmount.toStringAsFixed(2) : "Month data"}'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
