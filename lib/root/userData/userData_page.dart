// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:plum_tiger/main.dart';
// import 'package:plum_tiger/root/appbarTop/appBar_page.dart';
// import 'package:plum_tiger/root/bottomPitch/bottomPitch_page.dart';
// import 'package:plum_tiger/root/registrationPage/registration.dart';
// import 'package:plum_tiger/root/registrationPage/registration_Page.dart';
// import 'package:flutter/material.dart';


// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});


//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }


// class _SignInPageState extends State<SignInPage> {
//   bool isExpanded = false;
//   bool animationcompleted = false;
//   final TextEditingController emailController = TextEditingController();


//   @override
//   void dispose() {
//     emailController.dispose();
//     super.dispose();
//   }


//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final screenWidth = MediaQuery.of(context).size.width;


//     return Scaffold(
//       appBar: HomeAppbar(),
//       body: Stack(
//         children: [
//           Row(
//             children: [
//               // LEFT SIDE - Login Form
//               Expanded(
//                 flex: 3,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 60.0),
//                   child: Center(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Enter your email address',
//                             style: TextStyle(
//                               fontSize: 28,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 600),
//                             child: TextField(
//                               controller: emailController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Email',
//                                 filled: true,
//                                 fillColor: Color(0xFFF5F5F5),
//                                 suffixIcon: Icon(Icons.email_rounded),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(Radius.circular(30)),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           SizedBox(
//                             width: 200,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 final email = emailController.text.trim();
//                                 if (email.isEmpty || !email.contains('@')) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(content: Text("Please enter a valid email")),
//                                   );
//                                   return;
//                                 }


//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => Login1(email: email),
//                                   ),
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(0xFF2AC5A9),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 padding: const EdgeInsets.symmetric(vertical: 14),
//                               ),
//                               child: const Text('Next'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           AnimatedPositioned(
//             duration: const Duration(milliseconds: 600),
//             curve: Curves.easeInOut,
//             top: 0,
//             bottom: 0,
//             right: 0,
//             left: isExpanded ? 0 : screenWidth * 0.6,
//             child: Container(
//               height: size.height,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF20C3AF), Color(0xFF35A8E0)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Text(
//                       'New Here?',
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 30.0),
//                       child: Text(
//                         'Sign up and raise up!',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.white70, fontSize: 14),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         if(!isExpanded) {
//                           setState(() {
//                             isExpanded = true;
//                           });
//                           Future.delayed(const Duration(milliseconds: 600), () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
//                           });
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
//                       ),
//                       child: const Text(
//                         'Sign Up',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//        bottomNavigationBar : BottomAppBar(),
//     );
//   }
// }


// // -----------------------------------------------------------------


// class Login1 extends StatefulWidget {
//   final String email;


//   const Login1({super.key, required this.email});


//   @override
//   State<Login1> createState() => Login1State();
// }


// class Login1State extends State<Login1> {
//   final TextEditingController passwordController = TextEditingController();


//   @override
//   void dispose() {
//     passwordController.dispose();
//     super.dispose();
//   }


//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;


//     return Scaffold(
//       appBar: const HomeAppbar(),
//       body: Row(
//         children: [
//           Expanded(
//             flex: 3,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 60.0),
//               child: Center(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Login to Your Account',
//                         style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 10),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 200),
//                         child: TextField(
//                           controller: passwordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             labelText: 'Password',
//                             filled: true,
//                             fillColor: Color(0xFFF5F5F5),
//                             suffixIcon: Icon(Icons.visibility_off),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.all(Radius.circular(30)),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             final password = passwordController.text;


//                             if (password.isEmpty || password.length < 6) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(content: Text("Password must be at least 6 characters")),
//                               );
//                             } else {
//                               LoginState.loggedInEmail = widget.email;
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(builder: (_) => const HomePage()), // 🔁 Change to your real Home Page
//                               );
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF2AC5A9),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                           ),
//                           child: const Text('Sign In'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Container(
//               height: size.height,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF20C3AF), Color(0xFF35A8E0)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: const Center(
//                 child: Text(
//                   'Welcome back!',
//                   style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//        bottomNavigationBar : BottomAppBar(),
//        //
//     );
//   }
// }
// // --------------------------------------------------------


// // login_state.dart
// class LoginState {
//   static String? loggedInEmail;
// }

// second one


// import 'package:flutter/material.dart';
// import 'package:plum_tiger/main.dart';
// import 'package:plum_tiger/root/appbarTop/appBar_page.dart';
//
//
//
//
// import 'package:plum_tiger/root/registrationPage/registration_Page.dart';
//
//
//
//
// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});
//
//
//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }
//
//
// class _SignInPageState extends State<SignInPage> {
//   bool isExpanded = false;
//   bool animationcompleted = false;
//   final TextEditingController emailController = TextEditingController();
//
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//
//     return Scaffold(
//       appBar: HomeAppbar(name: '',),
//       body: Stack(
//         children: [
//           Row(
//             children: [
//               // LEFT SIDE - Login Form
//               Expanded(
//                 flex: 3,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 60.0),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Enter your email address',
//                             style: TextStyle(
//                               fontSize: 28,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 600),
//                             child: SizedBox(
//                               width: 600,
//                               child: TextField(
//                                 controller: emailController,
//                                 decoration: const InputDecoration(
//                                   labelText: 'Email',
//                                   filled: true,
//                                   fillColor: Color(0xFFF5F5F5),
//                                   suffixIcon: Icon(Icons.email_rounded),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           SizedBox(
//                             width: 200,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 final email = emailController.text.trim();
//                                 if (email.isEmpty || !email.contains('@')) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(content: Text("Please enter a valid email")),
//                                   );
//                                   return;
//                                 }
//
//
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => Login1(email: email),
//                                   ),
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(0xFF2AC5A9),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 padding: const EdgeInsets.symmetric(vertical: 14),
//                               ),
//                               child: const Text('Next'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           AnimatedPositioned(
//             duration: const Duration(milliseconds: 600),
//             curve: Curves.easeInOut,
//             top: 0,
//             bottom: 0,
//             right: 0,
//             left: isExpanded ? 0 : screenWidth * 0.6,
//             child: Container(
//               height: size.height,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF20C3AF), Color(0xFF35A8E0)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Text(
//                       'New Here?',
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 30.0),
//                       child: Text(
//                         'Sign up and raise up!',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.white70, fontSize: 14),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         if(!isExpanded) {
//                           setState(() {
//                             isExpanded = true;
//                           });
//                           Future.delayed(const Duration(milliseconds: 600), () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
//                           });
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
//                       ),
//                       child: const Text(
//                         'Sign Up',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar : BottomAppBar(),
//     );
//   }
// }
//
//
// //
// class Login1 extends StatefulWidget {
//   final String email;
//
//
//   const Login1({super.key, required this.email});
//
//
//   @override
//   State<Login1> createState() => Login1State();
// }
//
//
// class Login1State extends State<Login1> {
//   final TextEditingController passwordController = TextEditingController();
//
//
//   @override
//   void dispose() {
//     passwordController.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//
//     return Scaffold(
//       appBar: const HomeAppbar(name: '',),
//       body: Row(
//         children: [
//           Expanded(
//             flex: 3,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 60.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Login to Your Account',
//                         style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 10),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 200),
//                         child: SizedBox(
//                           width: 600,
//                           child: TextField(
//                             controller: passwordController,
//                             obscureText: true,
//                             decoration: const InputDecoration(
//                               labelText: 'Password',
//                               filled: true,
//                               fillColor: Color(0xFFF5F5F5),
//                               suffixIcon: Icon(Icons.visibility_off),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(Radius.circular(30)),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             final password = passwordController.text;
//
//
//                             if (password.isEmpty || password.length < 6) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(content: Text("Password must be at least 6 characters")),
//                               );
//                             } else {
//                               LoginState.loggedInEmail = widget.email;
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(builder: (_) => const HomePage(name: '',)), // 🔁 Change to your real Home Page
//                               );
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF2AC5A9),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                           ),
//                           child: const Text('Sign In'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Container(
//               height: size.height,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF20C3AF), Color(0xFF35A8E0)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: const Center(
//                 child: Text(
//                   'Welcome back!',
//                   style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar : BottomAppBar(),
//       //
//     );
//   }
// }
//
//
//
//
// // login_state.dart
// class LoginState {
//   static String? loggedInEmail;
// }


// third one

// import 'package:flutter/material.dart';
// import 'package:plum_tiger/main.dart';
// import 'package:plum_tiger/root/appbarTop/appBar_page.dart';
// import 'package:plum_tiger/root/bodyMiddle/bodyMiddle.dart';
// import 'package:plum_tiger/root/bottomPitch/bottomPitch.dart';
// import 'package:plum_tiger/root/registrationPage/registration_Page.dart';
//
// // ================= SignInPage =================
// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});
//
//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }
//
// class _SignInPageState extends State<SignInPage> {
//   bool isExpanded = false;
//   final TextEditingController emailController = TextEditingController();
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: HomeAppbar(name: ''),
//       body: Stack(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 60.0),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Enter your email address',
//                             style: TextStyle(
//                               fontSize: 28,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 600),
//                             child: SizedBox(
//                               width: 600,
//                               child: TextField(
//                                 controller: emailController,
//                                 decoration: const InputDecoration(
//                                   labelText: 'Email',
//                                   filled: true,
//                                   fillColor: Color(0xFFF5F5F5),
//                                   suffixIcon: Icon(Icons.email_rounded),
//                                   border: OutlineInputBorder(
//                                     borderRadius:
//                                     BorderRadius.all(Radius.circular(30)),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           SizedBox(
//                             width: 200,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 final email = emailController.text.trim();
//                                 if (email.isEmpty || !email.contains('@')) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                       content: Text(
//                                           "Please enter a valid email"),
//                                       duration: Duration(seconds: 2),
//                                       backgroundColor: Colors.red,
//                                     ),
//                                   );
//                                   return;
//                                 }
//
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         Login1(email: email),
//                                   ),
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(0xFF2AC5A9),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 padding:
//                                 const EdgeInsets.symmetric(vertical: 14),
//                               ),
//                               child: const Text('Next'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           AnimatedPositioned(
//             duration: const Duration(milliseconds: 600),
//             curve: Curves.easeInOut,
//             top: 0,
//             bottom: 0,
//             right: 0,
//             left: isExpanded ? 0 : screenWidth * 0.6,
//             child: Container(
//               height: size.height,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF20C3AF), Color(0xFF35A8E0)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Text(
//                       'New Here?',
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 30.0),
//                       child: Text(
//                         'Sign up and raise up!',
//                         textAlign: TextAlign.center,
//                         style:
//                         TextStyle(color: Colors.white70, fontSize: 14),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (!isExpanded) {
//                           setState(() {
//                             isExpanded = true;
//                           });
//                           Future.delayed(const Duration(milliseconds: 600),
//                                   () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                       const RegistrationPage()),
//                                 );
//                               });
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 32, vertical: 14),
//                       ),
//                       child: const Text(
//                         'Sign Up',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(),
//     );
//   }
// }
//
// // ================= Login1 Page =================
// class Login1 extends StatefulWidget {
//   final String email;
//
//   const Login1({super.key, required this.email});
//
//   @override
//   State<Login1> createState() => Login1State();
// }
//
// class Login1State extends State<Login1> {
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   void dispose() {
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       appBar: const HomeAppbar(name: ''),
//       body: Row(
//         children: [
//           Expanded(
//             flex: 3,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 60.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Login to Your Account',
//                         style: TextStyle(
//                             fontSize: 28, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 10),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 200),
//                         child: SizedBox(
//                           width: 600,
//                           child: TextField(
//                             controller: passwordController,
//                             obscureText: true,
//                             decoration: const InputDecoration(
//                               labelText: 'Password',
//                               filled: true,
//                               fillColor: Color(0xFFF5F5F5),
//                               suffixIcon: Icon(Icons.visibility_off,
//                               ),
//
//                               border: OutlineInputBorder(
//                                 borderRadius:
//                                 BorderRadius.all(Radius.circular(30)),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             final password = passwordController.text;
//
//                             if (password.isEmpty || password.length < 6) {
//                               // ❌ Login Failed
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text("Login Failed ❌"),
//                                   duration: Duration(seconds: 2),
//                                   backgroundColor: Colors.red,
//                                 ),
//                               );
//                             } else {
//                               // ✅ Login Successful → go to HomePage
//                               LoginState.loggedInEmail = widget.email;
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) => const HomePage(
//                                       name: '', loginSuccess: true),
//                                 ),
//                               );
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF2AC5A9),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             padding:
//                             const EdgeInsets.symmetric(vertical: 14),
//                           ),
//                           child: const Text('Sign In'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Container(
//               height: size.height,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF20C3AF), Color(0xFF35A8E0)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: const Center(
//                 child: Text(
//                   'Welcome back!',
//                   style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(),
//     );
//   }
// }
//
// // ================= HomePage =================
// class HomePage extends StatefulWidget {
//   final String name;
//   final bool loginSuccess;
//
//   const HomePage({super.key, required this.name, this.loginSuccess = false});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();
//
//     // Show success popup on first build
//     if (widget.loginSuccess) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Login Successful 🎉"),
//             duration: Duration(seconds: 3),
//             backgroundColor: Colors.green,
//           ),
//         );
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: HomeAppbar(name: '',),
//         bottomNavigationBar: BottomBar(),
//         body: SliderUnit(),
//     );
//   }
// }
//
// // ================= Login State =================
// class LoginState {
//   static String? loggedInEmail;
// }

// forth one
import 'package:flutter/material.dart';
import 'package:plum_tiger/root/appbarTop/appBar_page.dart';
import 'package:plum_tiger/root/bodyMiddle/bodyMiddle.dart';
//import 'package:plum_tiger/root/forgotpassword/forgotpasswordpage.dart';
import 'package:plum_tiger/root/registrationPage/registration_Page.dart';

// ================= SignInPage =================
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isExpanded = false;
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const HomeAppbar(name: ''),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Enter your email address',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 600),
                            child: SizedBox(
                              width: 600,
                              child: TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  filled: true,
                                  fillColor: Color(0xFFF5F5F5),
                                  suffixIcon: Icon(Icons.email_rounded),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                final email = emailController.text.trim();
                                if (email.isEmpty || !email.contains('@')) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                      Text("Please enter a valid email"),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login1(email: email),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2AC5A9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding:
                                const EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: const Text('Next'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            top: 0,
            bottom: 0,
            right: 0,
            left: isExpanded ? 0 : screenWidth * 0.6,
            child: Container(
              height: size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF20C3AF), Color(0xFF35A8E0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'New Here?',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        'Sign up and raise up!',
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (!isExpanded) {
                          setState(() {
                            isExpanded = true;
                          });
                          Future.delayed(
                              const Duration(milliseconds: 600), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const RegistrationPage()),
                            );
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 14),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(),
    );
  }
}

// ================= Login1 Page =================
class Login1 extends StatefulWidget {
  final String email;

  const Login1({super.key, required this.email});

  @override
  State<Login1> createState() => Login1State();
}

class Login1State extends State<Login1> {
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const HomeAppbar(name: ''),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login to Your Account',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),

                      // ===== Password Field =====
                      Padding(
                        padding: const EdgeInsets.only(right: 200),
                        child: SizedBox(
                          width: 600,
                          child: TextField(
                            controller: passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              border: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(30)),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),

                      // ===== Forgot Password (Right-aligned) =====
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 200),
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(){}
                              //     // builder: (context) =>
                              //     // const ForgetPasswordPage(),
                              //   //),
                              // );
                            },
                            child: const Text(
                              "Forgot your password?",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 0),

                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            final password = passwordController.text;

                            if (password.isEmpty || password.length < 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Login Failed ❌"),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              LoginState.loggedInEmail = widget.email;
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomePage(
                                      name: '', loginSuccess: true),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2AC5A9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding:
                            const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text('Sign In'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              height: size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF20C3AF), Color(0xFF35A8E0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(),
    );
  }
}

// ================= Home Page =================
class HomePage extends StatefulWidget {
  final String name;
  final bool loginSuccess;

  const HomePage({super.key, required this.name, this.loginSuccess = false});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    if (widget.loginSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Successful 🎉"),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.green,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(name: ''),
      // bottomNavigationBar: BottomBar(),
      body: SliderUnit(),
    );
  }
}

// ================= Login State =================
class LoginState {
  static String? loggedInEmail;
}




