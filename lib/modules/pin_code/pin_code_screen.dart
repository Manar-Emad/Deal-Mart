import 'dart:async';
import 'package:deal_mart/modules/login/login_screen.dart';
import 'package:deal_mart/modules/pin_code/pass_recovery_screen.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: use_key_in_widget_constructors

class PinCodeVerificationScreen extends StatefulWidget {
  final String? phoneNumber;

  const PinCodeVerificationScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,),
      child: Scaffold(
        backgroundColor: defTextColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              navigateTo(context,  LoginScreen());
            },
            icon: const Icon(
              Icons.close,
              color: secondColor,
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
            children: [
              sizedBoxh4,
              Text(
                'Please enter the  OTP',
                style: black22bold(),
                textAlign: TextAlign.center,
              ),
              sizedBoxh2,
              Text(
                'Sent to confirm the phone number',
                style: black22bold(),
                textAlign: TextAlign.center,
              ),
              sizedBoxh2,
              RichText(
                text:const TextSpan(
                    text: "Enter the code send to me ",
                    // children: [
                    //   TextSpan(
                    //       text: "${widget.phoneNumber}",
                    //       style: black16regular()),
                    // ],
                    style:
                    TextStyle(color: Colors.black54, fontSize: 15)),
                textAlign: TextAlign.center,
              ),
              sizedBoxh2,
              GestureDetector(
                onTap:() => snackBar(context:context, message: "OTP resend!!",state:SnackBarStates.SUCCESS ,) ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.refresh,color: primaryColor,),
                    sizedBoxw1,
                    Text("Resend", style: black14bold(),),
                  ],
                ),
              ),
              sizedBoxh2,
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    // pastedTextStyle: TextStyle(
                    //   color: Colors.green.shade600,
                    //   fontWeight: FontWeight.bold,
                    // ),
                    length: 4,
                    obscureText: false,
                    //obscuringCharacter: '*',
                    // obscuringWidget: const FlutterLogo(
                    //   size: 24,
                    // ),
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 4) {
                        return "I'm from validator";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 40,
                      fieldWidth: 40,
                      activeFillColor:  primaryColor,
                      inactiveColor: disableColor,
                      inactiveFillColor: disableColor,
                      selectedFillColor: primaryColor,
                      selectedColor: primaryColor,
                      activeColor: primaryColor,
                      //activeFillColor: primaryColor,
                      // inactiveFillColor: disableColor,
                      // activeColor:  primaryColor,
                      disabledColor:disableColor,
                      // selectedFillColor: primaryColor,

                    ),

                    cursorColor: defTextColor,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    // boxShadows: const [
                    //   BoxShadow(
                    //     offset: Offset(0, 1),
                    //     color: primaryColor,
                    //     blurRadius: 10,
                    //   )
                    // ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                ),
              ),
              Text(
                hasError ? "*Please fill up all the cells properly" : "",
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              sizedBoxh2,
              defaultButton(
                  context,borderColor: primaryColor,
                  function: () {
                print('before nav');
                // formKey.currentState!.validate();
                // // conditions for validating
                // if (currentText.length != 4 || currentText != "1234") {
                //   errorController!.add(ErrorAnimationType
                //       .shake); // Triggering error shake animation
                //   setState(() => hasError = true);
                // } else {
                //   setState(
                //         () {
                //
                //       hasError = false;
                //       snackBar("OTP Verified!!");
                //       navigateTo(context,const PasswordRecoveryScreen() );
                //       print('after nav');
                //     },
                //   );
                // }
                navigateTo(context,const PasswordRecoveryScreen() );

              },
                  text: 'Verify' ,color: primaryColor,txtColor: defTextColor),
              sizedBoxh2,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                      child: TextButton(
                        child: Text(" Clear ",style: black16regular()),
                        onPressed: () {
                          textEditingController.clear();
                        },
                      )),
                  Flexible(
                      child: TextButton(
                        child:  Text("Set Text",style: black16regular(),),
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "1234";
                          });
                        },
                      )),
                ],
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}

// height: MediaQuery.of(context).size.height,
// width: MediaQuery.of(context).size.width,