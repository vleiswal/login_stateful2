import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30.0),
      child: Form(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            emailField(),
            SizedBox(height: 20),
            passwordField(),
            SizedBox(height: 30),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'myemail@example.com',
        labelText: 'Email Address',
        errorText: 'Not a valid email address',
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Must be at least 4 characters long',
          labelText: 'Enter Password'),
    );
  }

  Widget submitButton() {
    return RaisedButton(
        color: Colors.blue, child: Text('Submit!'), onPressed: () {});
  }
}
