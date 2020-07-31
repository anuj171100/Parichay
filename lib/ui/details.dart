import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prichay/globals.dart';
import 'package:prichay/ui/location_ui.dart';
import 'package:prichay/services/facebook_provider.dart';
import 'package:prichay/services/user_details.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name;
  String photoUrl;
  String birthDay;

  @override
  void initState() {
    getUserData();
    super.initState();
  }


  Future<void> getUserData() async {
    if (facebookProvider.token != null) {
      var token = facebookProvider.token.token;
      print(token);
      var response = await getUserDetailsFacebook(token);
      setState(() {
        name = response.name;
        photoUrl = response.picture.data.url;
        birthDay = response.birthday;
      });
    }
    print(name);
    print(photoUrl);
    print(birthDay);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 1.0,
          title: Text("Welcome to Prichay"),
        ),
        body: Center(
          child: (photoUrl == null)
              ? Text("Loading")
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    photoUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(name),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(birthDay),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>Locate(),
                  ),
                  );
                },
                color: Colors.blue,
                textColor: Colors.white,
                splashColor: Colors.grey,
                child: Text("See my people"),),
            ],
          ),
        ),
      ),
    );
  }
}
