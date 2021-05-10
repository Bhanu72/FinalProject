import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Inquiries extends StatefulWidget {
  const Inquiries({Key key}) : super(key: key);

  @override
  _InquiriesState createState() => _InquiriesState();
}

class _InquiriesState extends State<Inquiries> {
  bool _validate = false;
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController req = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    number.dispose();
    area.dispose();
    req.dispose();
    super.dispose();
  }

  void uncheck() {
    name.clear();
    number.clear();
    area.clear();
    req.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Inquiries",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Column(
                children: [
                  TextField(
                    controller: name,
                    decoration: InputDecoration(
                      // border: InputBorder.none,
                      labelText: "Enter Your Name",
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextField(
                    controller: number,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // border: InputBorder.none,
                      labelText: "Enter Your Mobile Number",
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextField(
                    controller: area,
                    decoration: InputDecoration(
                      // border: InputBorder.none,
                      labelText: "Enter Your Area",
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextField(
                    controller: req,
                    maxLines: 4,
                    decoration: InputDecoration(
                      // border: InputBorder.none,
                      labelText: "Enter Your Requirments",
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    ),
                  ),
                ],
              ),
              Container(
                child: ElevatedButton(
                  child: Text('Send'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 5,
                  ),
                  onPressed: () {
                    setState(() {
                      name.text.isEmpty ? _validate = true : _validate = false;
                      number.text.isEmpty
                          ? _validate = true
                          : _validate = false;
                      area.text.isEmpty ? _validate = true : _validate = false;
                      req.text.isEmpty ? _validate = true : _validate = false;

                      if (_validate == false) {
                        Fluttertoast.showToast(
                            msg: "We Will Get Back To You Soon...",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 8,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        print('FAIL');
                      }
                    });
                    if (_validate == false) {
                      Map<String, dynamic> data = {
                        "Name": name.text,
                        "Mobile Number": number.text,
                        "Area": area.text,
                        "Customer Requirment": req.text,
                      };
                      FirebaseFirestore.instance
                          .collection("Inquiries")
                          .add(data);
                      uncheck();
                    } else {
                      print('FAIL Firebase');
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
