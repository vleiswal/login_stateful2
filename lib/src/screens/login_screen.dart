import 'package:flutter/material.dart';
import 'package:login_stateful/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

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
      validator: validateEmail,
      onSaved: (String value) {
        print(value);
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      //obscureText: true,
      decoration: InputDecoration(
          hintText: 'Must be at least 5 characters long',
          labelText: 'Enter Password'),
      validator: validatePassword,
      onSaved: (String value) {
        print(value);
        password = value;
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
            print('Time to post $email and $password');
          }
        });
  }
}
