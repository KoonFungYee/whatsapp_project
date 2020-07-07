import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:whatsapp_project/HomePage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _countryCodeController;
  TextEditingController _phoneNumberController;
  String verificationId;

  @override
  void initState() {
    _countryCodeController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Verify your phone number",
                  style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontSize: new ScreenUtil().setSp(35.0),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(40.0)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "WhatsApp will send an SMS message (carrier charges may apply) to verify your phone number , Enter your country code and phone number.",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(20.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: _countryCodeController,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            prefix: Icon(
                              Icons.add,
                              size: ScreenUtil().setHeight(20.0),
                            ),
                            hintText: "Code",
                            border: new OutlineInputBorder(gapPadding: 1)),
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(20.0)),
                    Expanded(
                      flex: 5,
                      child: TextField(
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Phone Number",
                            border: new OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              RaisedButton(
                color: Theme.of(context).secondaryHeaderColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TwoStepVerificationPage('')));
                },
                child: Text(
                  "NEXT",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(20.0),
              ),
              Text(
                  "You must be at least 16 years old to register . Learn how WhatsApp works with the Facebook Companies."),
            ],
          ),
        ),
      ),
    );
  }
}

class TwoStepVerificationPage extends StatefulWidget {
  String veificationId;
  TwoStepVerificationPage(this.veificationId);

  @override
  _TwoStepVerificationPageState createState() =>
      _TwoStepVerificationPageState();
}

class _TwoStepVerificationPageState extends State<TwoStepVerificationPage> {
  TextEditingController _smsCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Align(
                  alignment: Alignment.center,
                  child: new Text(
                    "Two-step Verification",
                    style: new TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontSize: ScreenUtil().setSp(35.0),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                new SizedBox(height: ScreenUtil().setHeight(40.0)),
                new Align(
                  alignment: Alignment.center,
                  child: new Text(
                    "This account is protected by two-step verification. Enter your passcode to complete registration.",
                  ),
                ),
                new SizedBox(height: ScreenUtil().setHeight(50.0)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: new TextField(
                    controller: _smsCodeController,
                    maxLength: 7,
                    autofocus: true,
                    cursorColor: Theme.of(context).primaryColor,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(),
                        helperText: "Enter a 6-digit passcode"),
                  ),
                ),
                new SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                new RaisedButton(
                  color: Theme.of(context).secondaryHeaderColor,
                  onPressed: () {
                    // Send the new phone number to the b=databse and wait for the dummy passcode to be given by the User .
                    Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: new Text("VERIFY",
                      style: new TextStyle(
                        color: Colors.white,
                      )),
                ),
                new SizedBox(
                  height: ScreenUtil().setHeight(20.0),
                ),
                new Text(
                  "You must be at least 16 years old to register . Learn how WhatsApp works with the Facebook Companies.",
                  style: new TextStyle(color: Colors.grey),
                )
              ]),
        ),
      ),
    );
  }
}
