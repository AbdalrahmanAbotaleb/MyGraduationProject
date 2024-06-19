import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../ScanningHome/presentation/widgets/ScanAppBar.dart';

class ContactForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String subject = _subjectController.text;
    final String message = _messageController.text;

    final url = Uri.parse('https://plantdiseasexapi.runasp.net/api/contactus');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'subject': subject,
        'message': message,
      }),
    );

    if (response.statusCode == 200) {
      Get.snackbar(
        'Success',
        'Message sent successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 101, 247, 162),
        colorText: Colors.white,
      );
      _clearTextFields();
    } else {
      Get.snackbar(
        'Success',
        'Message sent successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 101, 247, 162),
        colorText: Colors.white,
      );
    }
  }

  void _clearTextFields() {
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height *0.1),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: SafeArea(
              child: Scanappabr(
                'Contact Us',
                () {
                  Navigator.of(context).pop();
                },
                height,
                width,
              ),
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Your Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Your Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _subjectController,
                  decoration: InputDecoration(labelText: 'Subject'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a subject';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _messageController,
                  decoration: InputDecoration(labelText: 'Message'),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a message';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _sendMessage();
                      _clearTextFields();
                    }
                  },
                  child: Text('SEND MESSAGE'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
