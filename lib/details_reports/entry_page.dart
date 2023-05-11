import 'dart:math';

import 'package:flutter/material.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  // DateTime dateOnly = selectedDate.getDateOnly();

  int lastDate = DateTime.now().year + 20;
  String slno = "";
  String dropdownValue = 'A';
  String dropdownValue1 = '101';
  String selectedSalutation = '';
  double myTimein = 0;
  double myTimeOut = 0;

  //controllers
  TextEditingController slnoController = TextEditingController();
  TextEditingController Date = TextEditingController();
  TextEditingController TimeIn = TextEditingController();
  TextEditingController TimeOut = TextEditingController();

  @override
  void initState() {
    super.initState();
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      print(rng.nextInt(100));
      slno = rng.nextInt(100).toString();
      slnoController.text = slno;
    }
  }

//Date picker
  _selectDate(String isIrDate) async {
    // DatePicker.showDatePicker(context,
    //     showTitleActions: true,
    //     minTime: DateTime(2000),
    //     maxTime: DateTime(lastDate),
    //     onChanged: (date) {}, onConfirm: (date) {
    //   Date.text = '${(date.day)} : ${(date.month)} /${(date.year)}';
    // }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

//time picker
  _selectTime(String Time) async {
    // DatePicker.showDateTimePicker(context,
    //     showTitleActions: true,
    //     locale: LocaleType.en, onChanged: (date) {
    //   AutovalidateMode.always;
    //   date = '${(date.hour)} : ${(date.minute)}' as DateTime;
    //
    // }, onConfirm: (date) {
    //   setState(() {
    //     TimeIn.text =
    //         '${(date.hour)} : ${(date.minute < 10 ? '0' : '') + date.minute.toString()}';
    //     myTimein = (date.hour * 60 + date.minute) * 60;
    //   });
    // });
  }

  _selectTime1(String Time) async {
    // DatePicker.showDateTimePicker(context,
    //     showTitleActions: true,
    //     currentTime: DateTime.now(),
    //     locale: LocaleType.en, onChanged: (date) {
    //   AutovalidateMode.always;
    //   date = '${(date.hour)} : ${(date.minute)}' as DateTime;
    //
    // }, onConfirm: (date) {
    //   setState(() {
    //     TimeOut.text =
    //         '${(date.hour)} : ${(date.minute < 10 ? '0' : '') + date.minute.toString()}';
    //     myTimeOut =(date.hour * 60 + date.minute) * 60;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Serial number : $slno",
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            "Date : ${(selectedDate.day)} / ${(selectedDate.month)} /${(selectedDate.year)}",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5.0)),
                    TextFormField(
                      style: TextStyle(fontSize: 20),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter name',
                          labelText: "Name*"),
                    ),
                    const Padding(padding: EdgeInsets.all(5.0)),
                    TextFormField(
                      style: TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Visit Person Name',
                          labelText: "Visit Person Name"),
                    ),
                    Padding(padding: EdgeInsets.all(5.0)),
                    TextFormField(
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Purpose",
                          labelText: 'purpose'),
                      minLines: 1,
                      maxLines: 5,
                      // allow user to enter 5 line in TextFormField
                      keyboardType: TextInputType
                          .multiline, // user keyboard will have a button to move cursor to next line
                    ),
                    Padding(padding: EdgeInsets.all(5.0)),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.all(2.0)),
                          Text(
                            'Block Name: ',
                            style: TextStyle(fontSize: 15),
                          ),
                          Container(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              elevation: 16,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              underline: Container(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'A',
                                'B',
                                'C',
                                'D'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Room Number:',
                            style: TextStyle(fontSize: 15),
                          ),
                          Container(
                            child: DropdownButton<String>(
                              value: dropdownValue1,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              elevation: 16,
                              underline: Container(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue1 = newValue!;
                                });
                              },
                              items: <String>[
                                '101',
                                '102',
                                '103',
                                '104',
                                '201',
                                '202',
                                '203',
                                '204',
                                '301',
                                '302',
                                '303',
                                '304'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(padding: EdgeInsets.all(5.0)),
                    // Container(decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black),
                    //   borderRadius: BorderRadius.circular(5.0),
                    // ),
                    //   child: Text(
                    //       "Date : ${(selectedDate.day)} / ${(selectedDate.month)} /${(selectedDate.year)}",
                    //       style: TextStyle(fontSize: 20),
                    //   )
                    // ),
                    Padding(padding: EdgeInsets.all(5.0)),
                    TextFormField(
                      style: TextStyle(fontSize: 20),
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please fill the date';
                        }
                        return null;
                      },
                      onTap: () {
                        _selectTime('TimeIn');
                      },
                      controller: TimeIn,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'In Time',
                          labelText: "In Time*"),
                    ),
                    Padding(padding: EdgeInsets.all(5.0)),
                    TextFormField(
                      style: TextStyle(fontSize: 20),
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please fill the date';
                        } else {
                          if (myTimein > myTimeOut) {
                            print(myTimein);
                            print(myTimeOut);
                            return 'Intime should be Grater then Outtime';
                          }
                        }
                        return null;
                      },
                      onTap: () {
                        _selectTime1('TimemOut');
                      },
                      controller: TimeOut,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Out Time',
                          labelText: "Out Time*"),
                    ),
                    Padding(padding: EdgeInsets.all(5.0)),
                    TextFormField(
                      style: TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'vehical number',
                          labelText: "Vehical number"),
                    ),
                    Padding(padding: const EdgeInsets.all(5.0)),
                    TextFormField(
                      style: TextStyle(fontSize: 20),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty &&
                            !RegExp('[0-9]{10}').hasMatch(value)) {
                          //  r'^[0-9]{10}$' pattern plain match number with length 10
                          return "Enter Correct Phone Number";
                        } else if (value.length != 10) return 'min 10 ';
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Preson Mobile number',
                          labelText: "Phone number*"),
                    ),
                    Padding(padding: EdgeInsets.all(5.0)),
                    TextFormField(
                      style: TextStyle(fontSize: 20),
                      maxLength: 100,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Address",
                          labelText: 'Address'),
                      minLines: 1,
                      maxLines: 5,
                      // allow user to enter 5 line in TextFormField
                      keyboardType: TextInputType
                          .multiline, // user keyboard will have a button to move cursor to next line
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}

extension MyDateExtension on DateTime {
  DateTime getDateOnly() {
    return DateTime(this.year, this.month, this.day);
  }
}
