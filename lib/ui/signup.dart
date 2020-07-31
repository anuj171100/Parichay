import 'package:flutter/material.dart';
import 'package:prichay/services/facebook_provider.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'details.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
  }



  Future<void> signInFacebook() async {
    var result = await facebookProvider.signIn();
    print(result.accessToken.token);
    facebookProvider.token = result.accessToken;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Profile(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 1.0,
          title: Text("Prichay"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FacebookSignInButton(
                onPressed: signInFacebook,
              ),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
