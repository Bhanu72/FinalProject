import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  bool _validate = false;
  String groupValue = "";
  TextEditingController name = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController address = new TextEditingController();

  @override
  void dispose() {
    name.dispose();
    mobile.dispose();
    address.dispose();
    groupValue = null;

    super.dispose();
  }

  void uncheck() {
    name.clear();
    mobile.clear();
    address.clear();
    groupValue = null;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Repair Details',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                // border: InputBorder.none,
                labelText: "Your Name",
                errorText: _validate ? 'Enter Your Name' : null,
              ),
            ),
            TextField(
              controller: mobile,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // border: InputBorder.none,
                labelText: "Mobile Number",
                errorText: _validate ? 'Enter Your Mobile Number' : null,
              ),
            ),
            TextField(
              controller: address,
              maxLines: 3,
              decoration: InputDecoration(
                // border: InputBorder.none,
                labelText: "Enter Your Address",
                errorText: _validate ? 'Enter Your Address' : null,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Inverter Repair'),
                Radio(
                    value: 'Inverter Repair',
                    groupValue: groupValue,
                    onChanged: (val) {
                      setState(() {
                        groupValue = val;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Panel Repair'),
                Radio(
                    value: 'Panel Repair',
                    groupValue: groupValue,
                    onChanged: (val) {
                      setState(() {
                        groupValue = val;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('System Repair'),
                Radio(
                    value: 'System Repair',
                    groupValue: groupValue,
                    onChanged: (val) {
                      setState(() {
                        groupValue = val;
                      });
                    }),
              ],
            ),

            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Container(
            //       padding: EdgeInsets.only(left: 16, right: 16),
            //       decoration: BoxDecoration(
            //         border: Border.all(color: Colors.grey, width: 1),
            //         borderRadius: BorderRadius.circular(16),
            //       ),
            //       child: DropdownButton(
            //         hint: Text('Repair Type'),
            //         dropdownColor: Colors.grey,
            //         icon: Icon(Icons.arrow_drop_down),
            //         iconSize: 30,
            //         isExpanded: true,
            //         underline: SizedBox(),
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 20,
            //         ),
            //         value: valueChoose,
            //         onChanged: (newValue) {
            //           setState(() {
            //             valueChoose = newValue;
            //           });
            //         },
            //         items: listitem.map((valueItem) {
            //           return DropdownMenuItem(
            //             value: valueItem,
            //             child: Text(valueItem),
            //           );
            //         }),
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              child: ElevatedButton(
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 5,
                ),
                onPressed: () {
                  setState(() {
                    name.text.isEmpty ? _validate = true : _validate = false;
                    mobile.text.isEmpty ? _validate = true : _validate = false;
                    address.text.isEmpty ? _validate = true : _validate = false;
                    groupValue.isEmpty ? _validate = true : _validate = false;
                    if (_validate == false) {
                      Fluttertoast.showToast(
                          msg: "Our Team Will Contact You Soon...",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 8,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      print('Fail');
                    }
                  });
                  if (_validate == false) {
                    Map<String, dynamic> data = {
                      "Name": name.text,
                      "Mobile Number": mobile.text,
                      "Address": address.text,
                      "Repair": groupValue,
                    };
                    FirebaseFirestore.instance.collection("Repair").add(data);

                    uncheck();
                  } else {
                    print('Firebase Fail');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
