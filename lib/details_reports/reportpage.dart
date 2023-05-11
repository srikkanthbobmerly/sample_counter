import 'package:flutter/material.dart';
import 'package:git_sample/mail_id.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  bool getter = false;
  String dateToService = "";
  DateTime selectedDate = DateTime.now();
  int lastDate = DateTime.now().year + 40;
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();
  double selectedDateFrom = 0;
  double selectedDateTo = 0;
  final _formkey = GlobalKey<FormState>();

  _selectDate(String isDate) async {
    // DatePicker.showDatePicker(context,
    //     showTitleActions: true,
    //     minTime: DateTime(2000),
    //     maxTime: DateTime(lastDate), onChanged: (date) {
    //   print(date.timeZoneOffset.inHours.toString());
    // }, onConfirm: (date) {
    //   setState(() {
    //     if (isDate == "dateFromController") {
    //       dateFromController.text = '${date.year}-${date.month}-${date.day}';
    //       selectedDateFrom = (date.year / 360 + (date.month % 360) / 30) +
    //           ((date.day % 360) % 30);
    //       print(selectedDateFrom);
    //     } else {
    //       dateToController.text = '${date.year}-${date.month}-${date.day}';
    //       selectedDateTo = (date.year / 360 + (date.month % 360) / 30) +
    //           ((date.day % 360) % 30);
    //     }
    //   });
    // }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: const Text('One Month Log',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => EmailSender(),
                          ),
                          (route) => false,
                        );
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Report has been sent')));
                      },
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: const Text('From to TO',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        setState(() {
                          getter = !getter;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  child: getter == true
                      ? Column(
                          children: [
                            Container(
                                child: TextFormField(
                              controller: dateFromController,
                              //editing controller of this TextField
                              decoration: InputDecoration(
                                  icon: Icon(Icons.calendar_today),
                                  //icon of text field
                                  labelText:
                                      "Enter From Date" //label text of field
                                  ),
                              readOnly: true,
                              //set it true, so that user will not able to edit text
                              onTap: () async {
                                _selectDate("dateFromController");
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter From date";
                                }
                                return null;
                              },

//                      if(dateController != null ){
//                        print(dateController);
//                        setState(() {
//                          dateController; //set output date to TextField value.
//                        });
//                      }else{
//                        print("Date is not selected");
//                      }
                            )),
                            Container(
                                child: TextFormField(
                              controller: dateToController,
                              //editing controller of this TextField
                              decoration: InputDecoration(
                                  icon: Icon(Icons.calendar_today),
                                  //icon of text field
                                  labelText:
                                      "Enter To Date" //label text of field
                                  ),
                              readOnly: true,
                              //set it true, so that user will not able to edit text
                              onTap: () async {
                                _selectDate("dateToController");
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter To Date";
                                } else {
                                  if (selectedDateFrom > selectedDateTo) {
                                    return 'To Date is must be greater than or Equals to From date';
                                  }
                                }
                                return null;
                              },
//
//                      if(dateController != null ){
//                        print(dateController);
//                        setState(() {
//                          dateController; //set output date to TextField value.
//                        });
//                      }else{
//                        print("Date is not selected");
//                      }
                            )),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (_formkey.currentState!.validate()) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              EmailSender(),
                                        ),
                                        (route) => false,
                                      );
                                      getter = false;
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Report has been sent')));
                                    }
                                  });
                                },
                                child: Text("Ok",
                                    style: TextStyle(color: Colors.white)))
                          ],
                        )
                      : null,
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: const Text('Today',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => EmailSender(),
                          ),
                          (route) => false,
                        );
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Report has been sent')));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
