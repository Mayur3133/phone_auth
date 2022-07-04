// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'otp.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Phone Auth'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 20),
//             child: Center(
//               child: Text(
//                 'Phone Authentication',
//                 style: TextStyle( fontSize: 25),
//               ),
//             ),
//           ),
//          SizedBox(height: 50),
//           Container(
//             margin: EdgeInsets.only(top: 80, right: 20, left: 20),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Phone Number',
//                 prefix: Padding(
//                   padding: EdgeInsets.all(4),
//                   child: Text('+91'),
//                 ),
//               ),
//               maxLength: 10,
//               keyboardType: TextInputType.number,
//               controller: _controller,
//             ),
//           ),
//           Container(
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => OTPScreen(_controller.text)));
//               },
//               child: Text(
//                 'Next',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }