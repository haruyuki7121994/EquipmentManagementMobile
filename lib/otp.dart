import 'package:appqrcode/home.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     key: _scaffoldkey,
  //     appBar: AppBar(
  //       title: Text('OTP Verification'),
  //     ),
  //     body: Column(
  //       children: [
  //         Container(
  //           margin: EdgeInsets.only(top: 40),
  //           child: Center(
  //             child: Text(
  //               'Verify +1-${widget.phone}',
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(30.0),
  //           child: Pinput(
  //             focusNode: _pinPutFocusNode,
  //             controller: _pinPutController,
  //             pinAnimationType: PinAnimationType.fade,
  //             onSubmitted: (pin) async {
  //               try {
  //                 await FirebaseAuth.instance
  //                     .signInWithCredential(PhoneAuthProvider.credential(
  //                     verificationId: _verificationCode, smsCode: pin))
  //                     .then((value) async {
  //                   if (value.user != null) {
  //                     Navigator.pushAndRemoveUntil(
  //                         context,
  //                         MaterialPageRoute(builder: (context) => HomePage()),
  //                             (route) => false);
  //                   }
  //                 });
  //               } catch (e) {
  //                 FocusScope.of(context).unfocus();
  //                 _scaffoldkey.currentState
  //                     ?.showSnackBar(SnackBar(content: Text('invalid OTP')));
  //               }
  //             },
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // _verifyPhone() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: '+1${widget.phone}',
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await FirebaseAuth.instance
  //             .signInWithCredential(credential)
  //             .then((value) async {
  //           if (value.user != null) {
  //             Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => HomePage()),
  //                     (route) => false);
  //           }
  //         });
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         print(e.message);
  //       },
  //       // codeSent: (String verficationID, int resendToken) {
  //       //   setState(() {
  //       //     _verificationCode = verficationID;
  //       //   });
  //       // },
  //       codeAutoRetrievalTimeout: (String verificationID) {
  //         setState(() {
  //           _verificationCode = verificationID;
  //         });
  //       },
  //       timeout: Duration(seconds: 120), codeSent: (String verificationId, int? forceResendingToken) {  });
  // }


}