import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwike/Utils/utils.dart';
import 'package:kwike/classes/custom_button.dart';
import 'package:kwike/classes/custom_text.dart';
import 'package:kwike/screens/admin/home/admin_home_screen.dart';
import 'dart:async';

import 'package:pinput/pinput.dart';

class AdminOTPScreen extends StatefulWidget {
  const AdminOTPScreen({super.key});

  @override
  _AdminOTPScreenState createState() => _AdminOTPScreenState();
}

class _AdminOTPScreenState extends State<AdminOTPScreen> {
  final TextEditingController _pinController = TextEditingController();

  bool _timerInProgress = true;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          _timerInProgress = false;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter OTP',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'We have sent you the code at your email',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20.0),
              Pinput(
                controller: _pinController,
                validator: (s) {
                  return s == '2222' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) {
                  if (pin == '2222') {
                    Get.to(const AdminHomeScreen());
                    Utils().toastMessage('Login Successfull');
                  }
                  setState(() {
                    _pinController.clear();
                    _timerInProgress = false;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              _timerInProgress
                  ? Text('Resend OTP in $_start seconds')
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomTextWidget(
                          text: 'Didnt recieve OTP?',
                          textColor: Colors.black,
                          fSize: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _timerInProgress = true;
                              _start = 60;
                            });
                            _pinController.clear();
                            startTimer();
                          },
                          child: const CustomTextWidget(
                            text: 'Resend OTP',
                            fSize: 15,
                            fWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
              //

              const SizedBox(height: 20.0),
              CustomButton(
                buttonText: 'Submit',
                onTap: () {
                  // Validate OTP and perform actions
                  String enteredOTP = _pinController.text;
                  if (enteredOTP.length == 4) {
                    // Perform validation and actions here
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
