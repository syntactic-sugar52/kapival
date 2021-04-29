import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kap/auth/create_profile.dart';
import 'package:kap/dashboard/dahsboard.dart';
import 'package:kap/models/user_model/user_model.dart';
import 'package:kap/services/database.dart';

class MobileScreen extends StatefulWidget {
  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String errorMessage = '';
  String smsOTP;
  String initialCountry = 'PH';
  FirebaseAuth auth = FirebaseAuth.instance;
  PhoneNumber number = PhoneNumber(isoCode: 'PH');
  String verificationId;

  Future<void> verifyPhone(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'PH');

    setState(() {
      this.number = number;
      // this.initialCountry = number.isoCode;
    });

    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsOTPDialog(context).then((value) {
        print('sign in');
      });
    };
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: number.phoneNumber, // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent:
              smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(minutes: 1),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (FirebaseAuthException exceptio) {
            print('${exceptio.message}');
          });
    } catch (e) {
      handleError(e);
    }
  }

  handleError(FirebaseAuthException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        Navigator.of(context).pop();
        smsOTPDialog(context).then((value) {
          print('sign in');
        });
        break;
      default:
        setState(() {
          errorMessage = error.message;
        });

        break;
    }
  }

  Future<bool> smsOTPDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
            title: Text('Enter SMS Code'),
            content: Container(
              height: 85,
              child: Column(children: [
                TextField(
                  onChanged: (value) {
                    this.smsOTP = value;
                  },
                ),
                (errorMessage != ''
                    ? Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                      )
                    : Container())
              ]),
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              FlatButton(
                  child: Text('Done'),
                  onPressed: () {
                    var user = auth.currentUser;

                    if (user != null) {
                      print(user);
                      Navigator.of(context).pop();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateProfileScreen()),
                          (route) => false);
                      ;
                    } else {
                      print("denied");
                      signIn();
                    }
                  })
            ]);
      },
    );
  }

  Future<String> signIn() async {
    UserModel _currentUser = UserModel();
    String retVal = 'error';
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsOTP.trim(),
      );
      final UserCredential user = await auth.signInWithCredential(credential);
      final User currentUser = await auth.currentUser;

      var userPhone = UserModel(
        mobileNumber: number.phoneNumber,
        country: initialCountry,
        uid: currentUser.uid,
      );

      String _returnString = await Database().createNewUser(userPhone);
      _currentUser = await Database().getUserInfo(currentUser.uid);
      if (_currentUser.uid == currentUser.uid) {
        if (_returnString == "success") {
          retVal = 'success';
        }

        Navigator.of(context).pop();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => CreateProfileScreen()),
            (route) => false);
      }
    } catch (e) {
      handleError(e);
    }
    return retVal;
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 400,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text("Kapival",
                      softWrap: true,
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          letterSpacing: 3,
                          fontSize: 32,
                          fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 60,
                  ),
                  Expanded(
                      child: Text("Enter mobile number to start",
                          softWrap: true,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400))),
                ],
              ),
              color: Colors.greenAccent,
              // color: Color(0XFFEFEE81)
              // Color.fromRGBO(44, 204, 211, 2),
              // color: Colors.blueGrey,
            )),

        Positioned(
          top: 350,
          child: Form(
            key: formKey,
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: InternationalPhoneNumberInput(
                  spaceBetweenSelectorAndTextField: 30,
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  inputDecoration:
                      InputDecoration.collapsed(hintText: '(416) 123-4567'),
                  selectorConfig: SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      trailingSpace: true,
                      setSelectorButtonAsPrefixIcon: true,
                      useEmoji: true),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: controller,
                  formatInput: false,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 450,
            left: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 200,
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(),
                    elevation: 5,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        verifyPhone(controller.text.trim());
                      }
                    },
                    label: Text('Validate'),
                  ),
                ),
              ],
            ))
        // ),
      ],
    ));
  }
}
