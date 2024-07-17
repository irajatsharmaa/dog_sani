import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class demoform extends StatefulWidget {
  demoform({super.key});

  @override
  State<demoform> createState() => _demoformState();
}

class _demoformState extends State<demoform> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _userEmailEditingController =
      TextEditingController();
  final TextEditingController _userPhonenumEditingController =
      TextEditingController();
  final TextEditingController _userAddressEditingController =
      TextEditingController();
  final TextEditingController _userDogEditingController =
      TextEditingController();
  String? _validateName(value) {
    if (value!.isEmpty) {
      return 'Please enter name';
    }
    return null;
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter your mail';
    }

    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? _validatePhone(value) {
    if (value!.isEmpty) {
      return 'Please enter phone number';
    }
    if (value.length != 10) {
      return 'Enter a valid Phone Number';
    }
    return null;
  }

  String? _validateAddress(value) {
    if (value!.isEmpty) {
      return 'Please enter address';
    }
    return null;
  }

  String? _validateDogNo(value) {
    if (value!.isEmpty) {
      return 'Please enter number of dogs for vaccination';
    } else if (int.parse(value) < 1) {
      return 'Please Enter a valid number';
    }
    return null;
  }

  void _submitform() {
    print('Hello');
    CollectionReference collRef =
        FirebaseFirestore.instance.collection('RajatSourav');

    collRef.add({
      'Address': _userAddressEditingController.text,
      'Dogs': _userDogEditingController.text,
      'Email': _userEmailEditingController.text,
      'Phone': _userPhonenumEditingController.text,
      'Username': _userNameEditingController.text,
    });

    final snackbar = SnackBar(
      content: Text(
        'Form Submitted Successfully',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Row(
            children: [
              Icon(Icons.pets, color: Colors.white, size: 35),
              Text('DOG REGISTRATION'),
            ],
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _userNameEditingController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: _validateName,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _userEmailEditingController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: _validateEmail,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _userPhonenumEditingController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: _validatePhone,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _userAddressEditingController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: '  Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: _validateAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _userDogEditingController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'No of Dogs',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: _validateDogNo,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp("^(1[0-0]|[1-9])\$")),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _submitform();
                        }
                      },
                      child: Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
