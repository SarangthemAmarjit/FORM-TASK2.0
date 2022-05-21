import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'personal.dart';
import 'package:marquee/marquee.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> with TickerProviderStateMixin {
  gender? _character = gender.Male;
  List listitem = [
    'App Developer',
    'Website developer',
    'Graphic Designer',
    'Video Editing',
    'Other'
  ];
  String? itemvalue;
  List listitem2 = ['BCA', 'B.TECH', 'MCA', 'MSC IT', 'M.TECH', 'OTHER'];
  String? itemvalue2;

  var _currentItemSelected = 'App Developer';
  var _name = '';
  var _email = '';
  var _password = '';
  var _phoneNumber = '';
  var _address = '';
  var _qualification = '';
  var _age = '';
  var format = DateFormat("yyyy-MM-dd");
  String? birthDateInString;
  DateTime? birthDate;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Widget _buildNameField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: TextFormField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.black),
              icon: Icon(
                Icons.person,
                color: Colors.blue,
              )),
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Name is required';
            }
          },
          onSaved: (value) {
            _name = 'value';
          }),
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.black),
              icon: Icon(
                Icons.mail,
                color: Colors.red,
              )),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            }
            if (!RegExp(
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                .hasMatch(value)) {
              return "Please Enter a Valid Email Address";
            }
          },
          onSaved: (value) {
            _name = 'value';
          }),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.black),
              icon: Icon(
                Icons.lock,
                color: Colors.black,
              )),
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            }
          },
          onSaved: (value) {
            _name = 'value';
          }),
    );
  }

  Widget _buildPhoneNumber() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              labelText: 'Phone Number',
              labelStyle: TextStyle(color: Colors.black),
              icon: Icon(
                Icons.phone,
                color: Colors.green,
              )),
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Phone number is required';
            }
            if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
              return "Please Enter a Valid Phone Number";
            }
          },
          onSaved: (value) {
            _name = 'value';
          }),
    );
  }

  Widget _buildAddress() {
    return TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            labelText: 'Address',
            labelStyle: TextStyle(color: Colors.black),
            icon: Icon(
              Icons.place,
              color: Colors.pink[900],
            )),
        keyboardType: TextInputType.streetAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Address is required';
          }
        },
        onSaved: (value) {
          _name = 'value';
        });
  }

  Widget _buildQualification() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Icon(
            Icons.cast_for_education_outlined,
            color: Colors.blueAccent,
          ),
        ),
        Text(
          "Qualification",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: DropdownButton(
              value: itemvalue2,
              hint: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Select"),
              ),
              items: listitem2.map((item2) {
                return DropdownMenuItem(
                  value: item2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(item2),
                  ),
                );
              }).toList(),
              onChanged: (newchange1) {
                setState(() {
                  itemvalue2 = newchange1 as String?;
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAge() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month_rounded,
                  color: Colors.deepPurpleAccent,
                  size: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text("Date of Birth ",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 42, bottom: 10),
            child: DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    initialDate: currentValue ?? DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2025),
                    helpText: "SELECT DATE OF BIRTH",
                    cancelText: "CANCEL",
                    confirmText: "OK",
                    fieldHintText: "DATE/MONTH/YEAR",
                    fieldLabelText: "ENTER YOUR DATE OF BIRTH",
                    errorFormatText: "Enter a Valid Date",
                    errorInvalidText: "Date Out of Range");
              },
            ),
          ),
        ]);
  }

  Widget _buildGender() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.male_sharp,
              color: Colors.deepOrange,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text(
                "Gender",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
        RadioListTile(
            toggleable: true,
            title: Text("Male"),
            value: gender.Male,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value as gender?;
              });
            }),
        RadioListTile(
            title: Text("Female"),
            value: gender.Female,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value as gender?;
              });
            }),
        RadioListTile(
            title: Text("Other"),
            value: gender.Other,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value as gender?;
              });
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 3, vsync: this);
    return Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Marquee(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),

                    blankSpace: 200,

                    velocity: 150,
                    textScaleFactor: 1.11,
                    pauseAfterRound: Duration(seconds: 1),
                    showFadingOnlyWhenScrolling: true,
                    //fadingEdgeStartFraction: 0.1,
                    //fadingEdgeEndFraction: 0.1,
                    startPadding: 10,
                    accelerationDuration: Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: Duration(milliseconds: 600),
                    decelerationCurve: Curves.easeOut,

                    text: 'Last date of Registration is 25th May 2022',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "APPLICATION FORM",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("POST APPLIED FOR :",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      margin: EdgeInsets.all(16),
                      child: DropdownButtonHideUnderline(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: DropdownButton(
                            value: itemvalue,
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Select Your Post"),
                            ),
                            items: listitem.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(item),
                                ),
                              );
                            }).toList(),
                            onChanged: (newchange) {
                              setState(() {
                                itemvalue = newchange as String?;
                              });
                            },
                          ),
                        ),
                      ))
                ],
              ),
              Container(
                child: TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black87,
                    controller: _tabcontroller,
                    tabs: [
                      Tab(
                        text: "Personal Detail",
                      ),
                      Tab(
                        text: "Doc upload",
                      ),
                      Tab(
                        text: "Preview Form",
                      )
                    ]),
              ),
              Container(
                width: double.maxFinite,
                height: 950,
                child: TabBarView(controller: _tabcontroller, children: [
                  Container(
                    margin: EdgeInsets.all(24),
                    child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildNameField(),
                            _buildEmail(),
                            _buildPassword(),
                            _buildPhoneNumber(),
                            _buildAddress(),
                            _buildQualification(),
                            _buildAge(),
                            _buildGender(),
                            SizedBox(
                              height: 100,
                            ),
                            ElevatedButton(
                                onPressed: () => {
                                      if (_formkey.currentState!.validate())
                                        {}
                                      else
                                        _formkey.currentState!.save(),
                                      print("Saved Succesfully")
                                    },
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ))
                          ],
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text(
                          "UPLOAD DOCUMENTS",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: null,
                          child: Text("Upload",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.teal))),
                    ],
                  ),
                  Center(
                    child: Text(
                      "PREVIEW DATA",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}