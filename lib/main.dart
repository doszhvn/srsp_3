
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const RegisterFormPage());
}

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidepass = true;

  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('asdasd'),
          centerTitle: true,
        ),
        body: Form(
            child: ListView(
          padding: EdgeInsets.all(16.0),
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Write your full name.',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.delete_outline, color: Colors.red),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0)),
                )),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Where can we reach you?',
                helperText: 'Phone format: (XXX)XXX-XXXX',
                prefixIcon: Icon(Icons.call),
                suffixIcon: Icon(Icons.delete_outline, color: Colors.red),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email Address'),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Life Story'),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: _hidepass,
              maxLength: 8,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter the password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _hidepass ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _hidepass = !_hidepass;
                      });
                    },
                  ),
                  icon: Icon(Icons.security)),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Confirm password',
                  hintText: 'Confirm the password',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {},
                  ),
                  icon: Icon(Icons.border_color)),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text(
                'Submit Form',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )));
  }

  void _submitForm() {
    print('Name: ${_nameController.text}');
  }
}
