import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/car_list_screen.dart';
import 'package:pinput/pinput.dart';
class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key,required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController=TextEditingController();
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon (Icons.arrow_back),
            ),
          ),
        Container(
        width: 200,
        height: 200,
        padding: const EdgeInsets.all(20.0 ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff2C2B34),
        ),
        child: Image.asset("assets/image2.png",
        ),
      ),
      const SizedBox(height: 20),
      const Text(
        "Verification",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      const Text(
        "Enter the OTP send to your phone number",
        style: TextStyle(
          fontSize: 14,
          color: Colors.black38,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 20),
          Pinput(
            controller: otpController,
            length: 6,
            showCursor: true,
            defaultPinTheme: PinTheme(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff2C2B34),
                )
              ),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
            ),
            ),
            onCompleted: (value){
              setState(() {
                otpCode = value;
              });
            },
          ),
              const SizedBox(height: 25),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async{
                      try{
                        PhoneAuthCredential credential=
                        await PhoneAuthProvider.credential(
                            verificationId: widget.verificationId,
                            smsCode: otpController.text.toString());
                            FirebaseAuth.instance.signInWithCredential(credential).then((value){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  CarListScreen()));
                        });
                      }
                    catch(ex){
                        log(ex.toString() as num);
                    }
                    },
                    child: Text ("Submit"),
                    ),
                    ),
        const SizedBox(height: 20),
        const Text("Didn't receive and code?",
          style: TextStyle(
              fontSize: 14,
              fontWeight:FontWeight.bold,
              color: Colors.black38,
        ),
        ),
        const SizedBox(height: 15),
        const Text("Resend New code",
          style: TextStyle(
            fontSize: 16,
            fontWeight:FontWeight.bold,
            color: Colors.black38,
          ),
        )
    ],
      ),
          ),
          ),
      ),
    );
  }
}
