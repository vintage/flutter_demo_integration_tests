import 'package:flutter/material.dart';
import 'package:flutter_demo_integration_tests/counter_page.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _username;
  String _password;

  bool validCredentials() {
    return _username == "admin" && _password == "12345";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          key: ValueKey("username_input"),
          onChanged: (v) => setState(() => _username = v),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter username',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          key: ValueKey("password_input"),
          onChanged: (v) => setState(() => _password = v),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter password',
          ),
          obscureText: true,
        ),
        SizedBox(height: 32),
        RaisedButton(
          color: Colors.orangeAccent,
          onPressed: () {
            if (validCredentials()) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) {
                  return CounterPage();
                },
              ));
            } else {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("Wrong credentials!"),
                ),
              );
            }
          },
          child: Text("Login"),
        ),
      ],
    );
  }
}

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver demo'),
      ),
      body: ListView(
        children: [
          Container(height: 150, color: Colors.black12),
          Container(height: 150, color: Colors.black26),
          Container(height: 150, color: Colors.black38),
          Container(height: 150, color: Colors.black45),
          Container(height: 150, color: Colors.black54),
          Container(height: 150, color: Colors.black87),
          SizedBox(height: 32),
          Center(
            child: SizedBox(
              width: 250,
              child: LoginForm(),
            ),
          ),
          SizedBox(height: 32),
          Container(height: 150, color: Colors.black12),
          Container(height: 150, color: Colors.black26),
          Container(height: 150, color: Colors.black38),
          Container(height: 150, color: Colors.black45),
          Container(height: 150, color: Colors.black54),
          Container(height: 150, color: Colors.black87),
        ],
      ),
    );
  }
}
