import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30.0),
      child: Form(
        key: formKey,
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
        //errorText: 'Not a valid email address',
      ),
      validator: (String value) {
        //return null if valid, else error to user
        if (!value.contains('@')) {
          return 'Not a valid email address!!!';
        }
        return null;
      },
      onSaved: (String value) {
        print(value);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      //obscureText: true,
      decoration: InputDecoration(
          hintText: 'Must be at least 5 characters long',
          labelText: 'Enter Password'),
      validator: (String value) {
        if (value.length < 5) {
          return 'Must be at least 5 characters';
        }
        return null;
      },
      onSaved: (String value) {
        print(value);
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
        color: Colors.blue,
        child: Text('Submit!'),
        onPressed: () {
          print('Reset....');
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
          }
        });
  }
}
