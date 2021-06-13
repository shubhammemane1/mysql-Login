import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mysqldatabase/models/MyTextField.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool login = true;
  bool loading = false;

  TextEditingController username = new TextEditingController();

  TextEditingController email = new TextEditingController();

  TextEditingController pass = new TextEditingController();

// var url = Uri.parse("https://asch1.000webhostapp.com/signup.php");

  void registerUser() async {
    setState(() {
      loading = true;
    });
    var url = Uri.parse("http://192.168.0.105/flutter_login/register.php");

    var response = await http.post(url, body: {
      "userName": username.text,
      "email": email.text,
      "pass": pass.text
    });
    var data = json.decode(response.body);

    print(response.statusCode);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Registration Successfull"),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Already Exists"),
          duration: Duration(seconds: 2),
        ),
      );
    }
    setState(() {
      loading = false;
    });
  }

  loginUser() async {
    setState(() {
      loading = true;
    });
    var url = Uri.parse("http://192.168.0.105/flutter_login/login.php");

    var res = await http.post(url, body: {
      "userName": username.text,
      "pass": pass.text,
    });

    var data = json.decode(res.body);

    print(res.statusCode);

    // print("HEre " + data);

    if (data == "Success") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Successful WELCOME!  " + username.text),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.of(context).popAndPushNamed('/dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid Credential"),
          duration: Duration(seconds: 2),
        ),
      );
    }

    setState(() {
      loading = false;
    });
  }

  _login() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Login"),
        MyTextField(
          text: "user",
          icon: Icon(Icons.person),
          textEditingController: username,
          obscure: false,
          suffix: false,
        ),
        MyTextField(
          text: "Password",
          icon: Icon(Icons.vpn_key),
          textEditingController: pass,
          obscure: true,
          suffix: true,
        ),
        Container(
          padding: EdgeInsets.only(top: 20),
          child: loading == true
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    loginUser();
                  },
                  child: Text("Login"),
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't Have An Account"),
            TextButton(
                onPressed: () {
                  setState(() {
                    login = false;
                  });
                },
                child: Text("SignUp"))
          ],
        )
      ],
    );
  }

  _signup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Signup"),
        MyTextField(
          text: "user",
          icon: Icon(Icons.person),
          textEditingController: username,
          obscure: false,
          suffix: false,
        ),
        MyTextField(
          text: "Email",
          icon: Icon(Icons.alternate_email_outlined),
          textEditingController: email,
          obscure: false,
          suffix: false,
        ),
        MyTextField(
          text: "Password",
          icon: Icon(Icons.vpn_key),
          textEditingController: pass,
          obscure: true,
          suffix: true,
        ),
        Container(
          padding: EdgeInsets.only(top: 20),
          child: loading == true
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    registerUser();
                  },
                  child: Text("SignUp"),
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already Have An Account"),
            TextButton(
                onPressed: () {
                  setState(() {
                    login = true;
                  });
                },
                child: Text("Login"))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: login == true ? _login() : _signup(),
      ),
    );
  }
}
