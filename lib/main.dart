// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// //
// // Future<void> main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //
// //   runApp(MaterialApp(
// //     home: MyApp(),
// //     debugShowCheckedModeBanner: false,
// //   ));
// // }
// //
// // //
// // // class PhoneAuthForm extends StatefulWidget {
// // //   PhoneAuthForm({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   _PhoneAuthFormState createState() => _PhoneAuthFormState();
// // // }
// // //
// // // class _PhoneAuthFormState extends State<PhoneAuthForm> {
// // //   final FirebaseAuth _auth = FirebaseAuth.instance;
// // //   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// // //   TextEditingController phoneNumber = TextEditingController();
// // //   TextEditingController otpCode = TextEditingController();
// // //
// // //   OutlineInputBorder border = OutlineInputBorder(
// // //       borderSide: BorderSide(color: Colors.grey, width: 3.0));
// // //
// // //   bool isLoading = false;
// // //
// // //   String? verificationId;
// // //
// // //
// // //   Future<void> phoneSignIn({required String phoneNumber}) async {
// // //     await _auth.verifyPhoneNumber(
// // //         phoneNumber: phoneNumber,
// // //         verificationCompleted: _onVerificationCompleted,
// // //         verificationFailed: _onVerificationFailed,
// // //         codeSent: _onCodeSent,
// // //         codeAutoRetrievalTimeout: _onCodeTimeout);
// // //   }
// // //
// // //   _onVerificationCompleted(PhoneAuthCredential authCredential) async {
// // //     print("verification completed ${authCredential.smsCode}");
// // //     User? user = FirebaseAuth.instance.currentUser;
// // //     setState(() {
// // //       this.otpCode.text = authCredential.smsCode!;
// // //     });
// // //     if (authCredential.smsCode != null) {
// // //       try {
// // //         UserCredential credential =
// // //         await user!.linkWithCredential(authCredential);
// // //       } on FirebaseAuthException catch (e) {
// // //         if (e.code == 'provider-already-linked') {
// // //           await _auth.signInWithCredential(authCredential);
// // //         }
// // //       }
// // //       setState(() {
// // //         isLoading = false;
// // //       });
// // //       // Navigator.pushNamedAndRemoveUntil(
// // //       //     context, Constants.homeNavigate, (route) => false);
// // //     }
// // //   }
// // //
// // //   _onVerificationFailed(FirebaseAuthException exception) {
// // //     if (exception.code == 'invalid-phone-number') {
// // //       showMessage("The phone number entered is invalid!");
// // //     }
// // //   }
// // //
// // //   _onCodeSent(String verificationId, int? forceResendingToken) {
// // //     this.verificationId = verificationId;
// // //     print(forceResendingToken);
// // //     print("code sent");
// // //   }
// // //
// // //   _onCodeTimeout(String timeout) {
// // //     return null;
// // //   }
// // //
// // //   void showMessage(String errorMessage) {
// // //     showDialog(
// // //         context: context,
// // //         builder: (BuildContext builderContext) {
// // //           return AlertDialog(
// // //             title: Text("Error"),
// // //             content: Text(errorMessage),
// // //             actions: [
// // //               TextButton(
// // //                 child: Text("Ok"),
// // //                 onPressed: () async {
// // //                   Navigator.of(builderContext).pop();
// // //                 },
// // //               )
// // //             ],
// // //           );
// // //         }).then((value) {
// // //       setState(() {
// // //         isLoading = false;
// // //       });
// // //     });
// // //   }
// // //
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     Size size = MediaQuery
// // //         .of(context)
// // //         .size;
// // //     return Scaffold(
// // //         appBar: AppBar(title: Text("Verify OTP"),
// // //           backwardsCompatibility: false,
// // //           systemOverlayStyle: SystemUiOverlayStyle(
// // //               statusBarColor: Colors.blue),),
// // //         backgroundColor: Colors.grey,
// // //         body: Center(
// // //           child: Form(
// // //             key: _formKey,
// // //             child: Column(
// // //               mainAxisAlignment: MainAxisAlignment.center,
// // //               children: [
// // //                 SizedBox(
// // //                   width: size.width * 0.8,
// // //                   child: TextFormField(
// // //                       keyboardType: TextInputType.phone,
// // //                       controller: phoneNumber,
// // //                       decoration: InputDecoration(
// // //                         labelText: "Enter Phone",
// // //                         contentPadding: EdgeInsets.symmetric(
// // //                             vertical: 15.0, horizontal: 10.0),
// // //                         border: border,
// // //                       )),
// // //                 ),
// // //                 SizedBox(
// // //                   height: size.height * 0.01,
// // //                 ),
// // //                 SizedBox(
// // //                   width: size.width * 0.8,
// // //                   child: TextFormField(
// // //                     keyboardType: TextInputType.number,
// // //                     controller: otpCode,
// // //                     obscureText: true,
// // //                     decoration: InputDecoration(
// // //                       labelText: "Enter Otp",
// // //                       contentPadding: EdgeInsets.symmetric(
// // //                           vertical: 15.0, horizontal: 10.0),
// // //                       border: border,
// // //                       suffixIcon: Padding(
// // //                         child: FaIcon(
// // //                           FontAwesomeIcons.eye,
// // //                           size: 15,
// // //                         ),
// // //                         padding: EdgeInsets.only(top: 15, left: 15),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 Padding(padding: EdgeInsets.only(bottom: size.height * 0.05)),
// // //                 !isLoading
// // //                     ? SizedBox(
// // //                   width: size.width * 0.8,
// // //                   child: OutlinedButton(
// // //                     onPressed: () async {
// // //                       FirebaseService service = new FirebaseService();
// // //                       if (_formKey.currentState!.validate()) {
// // //                         setState(() {
// // //                           isLoading = true;
// // //                         });
// // //                         await phoneSignIn(phoneNumber: phoneNumber.text);
// // //                       }
// // //                     },
// // //                     child: Text("textSignIn"),
// // //                     style: ButtonStyle(
// // //                         foregroundColor: MaterialStateProperty.all<Color>(
// // //                           Colors.grey,
// // //                         ),
// // //                         side: MaterialStateProperty.all<BorderSide>(
// // //                             BorderSide.none)),
// // //                   ),
// // //                 )
// // //                     : CircularProgressIndicator(),
// // //               ],
// // //             ),
// // //           ),
// // //         ));
// // //   }
// // // }
// // //
// //
// //
// // class MyApp extends StatefulWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> {
// //   TextEditingController tphone = TextEditingController();
// //   String phoneerror = "";
// //   bool phonestatus = false;
// //
// //   FirebaseAuth auth = FirebaseAuth.instance;
// //
// //   otp() async {
// //     await auth.verifyPhoneNumber(
// //       phoneNumber:"91"+ tphone.text,
// //       timeout: Duration(seconds: 60),
// //       verificationCompleted: (PhoneAuthCredential credential) async {
// //         await auth.signInWithCredential(credential);
// //       },
// //       verificationFailed: (FirebaseAuthException e) {
// //
// //         if (e.code == 'invalid-phone-number') {
// //           print('The provided phone number is not valid.');
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(
// //               backgroundColor: Colors.black,
// //               content: Text(
// //                 "Invalid Phone Number",
// //                 style: TextStyle(fontSize: 18.0, color: Colors.white60),
// //               ),
// //             ),
// //           );
// //           tphone.clear();
// //         }
// //       },
// //       codeSent: (String verificationId, int? resendToken) async {
// //         String smsCode = 'xxxx';
// //
// //         // Create a PhoneAuthCredential with the code
// //         PhoneAuthCredential credential = PhoneAuthProvider.credential(
// //             verificationId: verificationId, smsCode: smsCode);
// //
// //         // Sign the user in (or link) with the credential
// //         await auth.signInWithCredential(credential);
// //       },
// //       codeAutoRetrievalTimeout: (String verificationId) {},
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(title: Text("Phone Auth")),
// //         body: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.all(10),
// //               child: TextField(
// //                 controller: tphone,
// //                 maxLength: 10,
// //                 maxLines: 1,
// //                 keyboardType: TextInputType.number,
// //                 decoration: InputDecoration(
// //                   label: Text("Phone number"),
// //                   hintText: "Phone number",
// //                   errorText: phonestatus ? phoneerror : null,
// //                 ),
// //                 onChanged: (value) {
// //                   setState(() {});
// //                 },
// //               ),
// //             ),
// //             ElevatedButton.icon(
// //                 onPressed: () {
// //                   // setState(() {
// //                   //   // RegExp regex = RegExp(r'^.{10,}$');
// //                   //   //
// //                   //   // if (!regex.hasMatc) {
// //                   //   //   regex = Text("Mobile must be 10 character") as RegExp;
// //                   //   // }
// //                   //   if (tphone.text.isEmpty) {
// //                   //     phonestatus = true;
// //                   //     phoneerror = "Enter phone number";
// //                   //   } else {}
// //                   // });
// //                   otp();
// //                   setState(() {});
// //                 },
// //                 icon: Icon(Icons.send_rounded),
// //                 label: Text("Send OTP"))
// //           ],
// //         ));
// //   }
// //
// // }
// //
// //
// // // MD5: DD:13:52:24:AE:87:79:16:F8:59:90:6B:02:95:BA:61
// // // SHA1: 4D:50:14:84:2C:31:E5:50:65:AE:E2:1B:AB:72:49:46:18:47:47:8C
// // // SHA-256: E9:95:D8:E2:44:71:F3:11:41:A0:EF:C6:2A:C4:92:29:55:A2:BA:57:EA:76:24:6D:A8:2B:C3:21:11:67:EA:44
//
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// import 'loginscreen.dart';
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp();
//   runApp(MaterialApp(
//     home: MyApp(),
//     debugShowCheckedModeBanner: false,
//   ));
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return LoginScreen();
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/screen/splash%20screen.dart';
import 'package:phone_auth/utils/app%20theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const _MainApp());
}

class _MainApp extends StatelessWidget {
  const _MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FirebasePhoneAuthHandler Demo',
        scaffoldMessengerKey: Globals.scaffoldMessengerKey,
        // theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: SplashScreen.id,
      ),
    );
  }
}