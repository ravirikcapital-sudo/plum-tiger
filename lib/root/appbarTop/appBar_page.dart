// // // import 'package:flutter/material.dart';
// // // import 'package:plum_tiger/root/aboutUs/aboutUs.dart';
// // // import 'package:plum_tiger/root/contactUs/contactUs.dart';
// // // import 'package:plum_tiger/root/iRAdvisory/iRAdvisory.dart';
// // // import 'package:plum_tiger/root/ourOffering/ourOffering.dart';
// // // import 'package:plum_tiger/root/ourStrength/ourStrength.dart';
// // // import 'package:plum_tiger/root/userData/userData_page.dart';
// // // import 'package:image_picker/image_picker.dart';
// // // import 'dart:typed_data';
// // // import 'dart:io';
// // // import 'package:flutter/foundation.dart';
// // //
// // // class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
// // //   final XFile? pickedFile;
// // //   final Uint8List? webImage;
// // //   final String? name;
// // //
// // //   const HomeAppbar({
// // //     Key? key,
// // //     this.pickedFile,
// // //     this.webImage,
// // //     this.name,
// // //   }) : super(key: key);
// // //
// // //   @override
// // //   Size get preferredSize => const Size.fromHeight(60.0);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     ImageProvider? imageProvider;
// // //
// // //     if (kIsWeb && webImage != null) {
// // //       imageProvider = MemoryImage(webImage!);
// // //     } else if (!kIsWeb && pickedFile != null) {
// // //       imageProvider = FileImage(File(pickedFile!.path));
// // //     }
// // //
// // //     return AppBar(
// // //       backgroundColor: Colors.white,
// // //       elevation: 0,
// // //       title: Row(
// // //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //         children: [
// // //           /// LEFT: Logo
// // //           InkWell(
// // //             onTap: () {},
// // //             child: Image.asset(
// // //               'assets/images/rikcapital.jpg',
// // //               fit: BoxFit.contain,
// // //               height: 200,
// // //               width: 230,
// // //             ),
// // //           ),
// // //
// // //           /// MIDDLE: Navigation Items
// // //           Expanded(
// // //             child: Center(
// // //               child: SingleChildScrollView(
// // //                 scrollDirection: Axis.horizontal,
// // //                 child: Row(
// // //                   mainAxisSize: MainAxisSize.min,
// // //                   children: [
// // //                     _buildHoverMenuItem(Icons.home, 'Home', context, onTap: () {}),
// // //                     _buildHoverMenuItem(Icons.info, 'About us', context, onTap: () {
// // //                       Navigator.push(context, MaterialPageRoute(builder: (_) => AboutUs(title: "")));
// // //                     }),
// // //                     _buildHoverMenuItem(Icons.settings, 'Service', context, onTap: () {}),
// // //                     _buildHoverMenuItem(Icons.reviews, 'IRAdvisory', context, onTap: () {
// // //                       Navigator.push(context, MaterialPageRoute(builder: (_) => InvestorRelationsPage()));
// // //                     }),
// // //                     _buildHoverMenuItem(Icons.computer, 'Contact us', context, onTap: () {
// // //                       Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUsPage()));
// // //                     }),
// // //                     _buildHoverMenuItem(Icons.card_giftcard, 'Our Offering', context, onTap: () {
// // //                       Navigator.push(context, MaterialPageRoute(builder: (_) => OfferingsScreen()));
// // //                     }),
// // //                     _buildHoverMenuItem(Icons.group, 'Our Strength', context, onTap: () {
// // //                       Navigator.push(context, MaterialPageRoute(builder: (_) => OurStrength()));
// // //                     }),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //
// // //           /// RIGHT: User Profile & Menu
// // //           Row(
// // //             children: [
// // //               _buildUserMenu(context, imageProvider),
// // //               const SizedBox(width: 10),
// // //               Builder(
// // //                 builder: (context) => IconButton(
// // //                   icon: const Icon(Icons.menu, color: Colors.blueAccent, size: 25),
// // //                   onPressed: () {
// // //                     Scaffold.of(context).openDrawer();
// // //                   },
// // //                 ),
// // //               ),
// // //             ],
// // //           )
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   /// 🔹 Reusable Hover Navigation Item
// // //   Widget _buildHoverMenuItem(IconData icon, String label, BuildContext context, {VoidCallback? onTap}) {
// // //     return InkWell(
// // //       onTap: onTap,
// // //       child: Padding(
// // //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
// // //         child: Row(
// // //           children: [
// // //             Icon(icon, size: 18, color: Colors.black54),
// // //             const SizedBox(width: 4),
// // //             Text(
// // //               label,
// // //               style: const TextStyle(fontSize: 14, color: Colors.black87),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   /// 🔹 User Profile Menu with First Letter or Image
// // //   Widget _buildUserMenu(BuildContext context, ImageProvider? imageProvider) {
// // //     final email = LoginState.loggedInEmail;
// // //     final bool isLoggedIn = email != null && email.isNotEmpty;
// // //
// // //     return PopupMenuButton<String>(
// // //       icon: isLoggedIn
// // //           ? CircleAvatar(
// // //         backgroundColor: Colors.blue[300],
// // //         backgroundImage: imageProvider,
// // //         child: imageProvider == null
// // //             ? Text(
// // //           (name?.isNotEmpty ?? false) ? name![0].toUpperCase() : " ",
// // //           style: const TextStyle(
// // //             color: Colors.black87,
// // //             fontWeight: FontWeight.bold,
// // //           ),
// // //         )
// // //             : null,
// // //       )
// // //           : const Icon(Icons.person, color: Colors.blue, size: 25),
// // //       onSelected: (value) {
// // //         switch (value) {
// // //           case 'User':
// // //             Navigator.push(context, MaterialPageRoute(builder: (_) => const SignInPage()));
// // //             break;
// // //           case 'Settings':
// // //           // Add settings logic here
// // //             break;
// // //           case 'Logout':
// // //             LoginState.loggedInEmail = null;
// // //             Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignInPage()));
// // //             break;
// // //         }
// // //       },
// // //       itemBuilder: (BuildContext context) => const [
// // //         PopupMenuItem<String>(
// // //           value: 'User',
// // //           child: Text('User'),
// // //         ),
// // //         PopupMenuItem<String>(
// // //           value: 'Settings',
// // //           child: Text('Settings'),
// // //         ),
// // //         PopupMenuItem<String>(
// // //           value: 'Logout',
// // //           child: Text('Logout'),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }
// //
// // import 'package:flutter/material.dart';
// // import 'package:plum_tiger/root/aboutUs/aboutUs.dart';
// // import 'package:plum_tiger/root/contactUs/contactUs.dart';
// // import 'package:plum_tiger/root/iRAdvisory/iRAdvisory.dart';
// // import 'package:plum_tiger/root/ourOffering/ourOffering.dart';
// // import 'package:plum_tiger/root/ourStrength/ourStrength.dart';
// // import 'package:plum_tiger/root/userData/userData_page.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'dart:typed_data';
// // import 'dart:io';
// // import 'package:flutter/foundation.dart';
// //
// // class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
// //   final XFile? pickedFile;
// //   final Uint8List? webImage;
// //   final String? name;
// //
// //   const HomeAppbar({
// //     Key? key,
// //     this.pickedFile,
// //     this.webImage,
// //     this.name,
// //   }) : super(key: key);
// //
// //   @override
// //   Size get preferredSize => const Size.fromHeight(60.0);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     ImageProvider? imageProvider;
// //
// //     if (kIsWeb && webImage != null) {
// //       imageProvider = MemoryImage(webImage!);
// //     } else if (!kIsWeb && pickedFile != null) {
// //       imageProvider = FileImage(File(pickedFile!.path));
// //     }
// //
// //     return AppBar(
// //       backgroundColor: Colors.white,
// //       elevation: 0,
// //       title: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           /// LEFT: Logo
// //           InkWell(
// //             onTap: () {},
// //             child: Image.asset(
// //               'assets/images/rikcapital.jpg',
// //               fit: BoxFit.contain,
// //               height: 200,
// //               width: 230,
// //             ),
// //           ),
// //
// //           /// MIDDLE: Navigation Items
// //           Expanded(
// //             child: Center(
// //               child: SingleChildScrollView(
// //                 scrollDirection: Axis.horizontal,
// //                 child: Row(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     _buildHoverMenuItem(Icons.home, 'Home', context, onTap: () {}),
// //                     _buildHoverMenuItem(Icons.info, 'About us', context, onTap: () {
// //                       Navigator.push(context, MaterialPageRoute(builder: (_) => AboutUs(title: "")));
// //                     }),
// //                     _buildHoverMenuItem(Icons.settings, 'Service', context, onTap: () {}),
// //                     _buildHoverMenuItem(Icons.reviews, 'IRAdvisory', context, onTap: () {
// //                       Navigator.push(context, MaterialPageRoute(builder: (_) => InvestorRelationsPage()));
// //                     }),
// //                     _buildHoverMenuItem(Icons.computer, 'Contact us', context, onTap: () {
// //                       Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUsPage()));
// //                     }),
// //                     _buildHoverMenuItem(Icons.card_giftcard, 'Our Offering', context, onTap: () {
// //                       Navigator.push(context, MaterialPageRoute(builder: (_) => OfferingsScreen()));
// //                     }),
// //                     _buildHoverMenuItem(Icons.group, 'Our Strength', context, onTap: () {
// //                       Navigator.push(context, MaterialPageRoute(builder: (_) => OurStrength()));
// //                     }),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //
// //           /// RIGHT: User Profile & Menu
// //           Row(
// //             children: [
// //               _buildUserMenu(context, imageProvider),
// //               const SizedBox(width: 10),
// //               Builder(
// //                 builder: (context) => IconButton(
// //                   icon: const Icon(Icons.menu, color: Colors.blueAccent, size: 25),
// //                   onPressed: () {
// //                     Scaffold.of(context).openDrawer();
// //                   },
// //                 ),
// //               ),
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }
// //
// //   /// 🔹 Reusable Hover Navigation Item
// //   Widget _buildHoverMenuItem(IconData icon, String label, BuildContext context, {VoidCallback? onTap}) {
// //     return InkWell(
// //       onTap: onTap,
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
// //         child: Row(
// //           children: [
// //             Icon(icon, size: 18, color: Colors.black54),
// //             const SizedBox(width: 4),
// //             Text(
// //               label,
// //               style: const TextStyle(fontSize: 14, color: Colors.black87),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   /// 🔹 User Profile Avatar (Photo or First Letter)
// //   Widget _buildUserMenu(BuildContext context, ImageProvider? imageProvider) {
// //     final isLoggedIn = name != null && name!.isNotEmpty;
// //
// //     return PopupMenuButton<String>(
// //       icon: isLoggedIn
// //           ? CircleAvatar(
// //         radius: 18,
// //         backgroundColor: Colors.blue[300],
// //         backgroundImage: imageProvider,
// //         child: imageProvider == null
// //             ? Text(
// //           name![0].toUpperCase(),
// //           style: const TextStyle(
// //             color: Colors.black87,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         )
// //             : null,
// //       )
// //           : const Icon(Icons.person, color: Colors.blue, size: 25),
// //       onSelected: (value) {
// //         if (value == 'Logout') {
// //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignInPage()));
// //         }
// //       },
// //       itemBuilder: (BuildContext context) => const [
// //         PopupMenuItem<String>(
// //           value: 'Logout',
// //           child: Text('Logout'),
// //         ),
// //       ],
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:plum_tiger/main.dart';
// import 'package:plum_tiger/root/aboutUs/aboutUs.dart';
// import 'package:plum_tiger/root/contactUs/contactUs.dart';
// import 'package:plum_tiger/root/iRAdvisory/iRAdvisory.dart';
// import 'package:plum_tiger/root/ourOffering/ourOffering.dart';
// import 'package:plum_tiger/root/ourStrength/ourStrength.dart';
// import 'package:plum_tiger/root/userData/userData_page.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:typed_data';
// import 'dart:io';
// import 'package:flutter/foundation.dart';


// class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
//   final XFile? pickedFile;
//   final Uint8List? webImage;
//   final String? name;

//   const HomeAppbar({
//     Key? key,
//     this.pickedFile,
//     this.webImage,
//     this.name, ImageProvider<Object>? imageProvider,
//   }) : super(key: key);

//   @override
//   Size get preferredSize => const Size.fromHeight(60.0);

//   @override
//   Widget build(BuildContext context) {
//     ImageProvider? imageProvider;

//     if (kIsWeb && webImage != null) {
//       imageProvider = MemoryImage(webImage!);
//     } else if (!kIsWeb && pickedFile != null) {
//       imageProvider = FileImage(File(pickedFile!.path));
//     }

//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0,
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           /// LEFT: Logo
//           InkWell(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage(name: '',)));
//             },
//             child: Image.asset(
//               'assets/images/rikcapital.jpg',
//               fit: BoxFit.contain,
//               height: 200,
//               width: 230,
//             ),
//           ),

//           /// MIDDLE: Navigation Items
//           Expanded(
//             child: Center(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     _buildHoverMenuItem(Icons.home, 'Home', context, onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage(name: '',)));
//                     }),
//                     _buildHoverMenuItem(Icons.info, 'About us', context, onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => AboutUs(title: "")));
//                     }),
//                     _buildHoverMenuItem(Icons.settings, 'Service', context, onTap: () {}),
//                     _buildHoverMenuItem(Icons.reviews, 'IRAdvisory', context, onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => InvestorRelationsPage()));
//                     }),
//                     _buildHoverMenuItem(Icons.email, 'Contact us', context, onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUsPage()));
//                     }),
//                     _buildHoverMenuItem(Icons.card_giftcard, 'Our Offering', context, onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => OfferingsScreen()));
//                     }),
//                     _buildHoverMenuItem(Icons.group, 'Our Strength', context, onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => OurStrength()));
//                     }),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           /// RIGHT: User Profile & Menu
//           Row(
//             children: [
//               _buildUserMenu(context, imageProvider),
//               const SizedBox(width: 10),
//               Builder(
//                 builder: (context) => IconButton(
//                   icon: const Icon(Icons.menu, color: Colors.blueAccent, size: 25),
//                   onPressed: () {
//                     Scaffold.of(context).openDrawer();
//                   },
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   /// 🔹 Reusable Hover Navigation Item
//   Widget _buildHoverMenuItem(IconData icon, String label, BuildContext context, {VoidCallback? onTap}) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//         child: Row(
//           children: [
//             Icon(icon, size: 18, color: Colors.black54),
//             const SizedBox(width: 4),
//             Text(
//               label,
//               style: const TextStyle(fontSize: 14, color: Colors.black87),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// 🔹 User Profile Avatar (Photo or First Letter of Name/Email)
//   Widget _buildUserMenu(BuildContext context, ImageProvider? imageProvider) {
//     final String? email = LoginState.loggedInEmail;
//     final bool isLoggedIn = email != null && email.isNotEmpty;

//     return PopupMenuButton<String>(
//       icon: isLoggedIn
//           ? CircleAvatar(
//         radius: 18,
//         backgroundColor: Colors.blue[300],
//         backgroundImage: imageProvider,
//         child: imageProvider == null
//             ? Text(
//           name?.isNotEmpty == true
//               ? name![0].toUpperCase()
//               : email[0].toUpperCase(),
//           style: const TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.bold,
//           ),
//         )
//             : null,
//       )
//           : const Icon(Icons.person, color: Colors.blue, size: 25),
//       onSelected: (value) {
//         switch (value) {
//           case 'User':
//             Navigator.push(context, MaterialPageRoute(builder: (_) => const SignInPage()));
//             break;
//           case 'Settings':
//           // Add settings logic here
//             break;
//           case 'Logout':
//             LoginState.loggedInEmail = null;
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignInPage()));
//             break;
//         }
//       },
//       itemBuilder: (BuildContext context) => const [
//         PopupMenuItem<String>(
//           value: 'User',
//           child: Text('User'),
//         ),
//         PopupMenuItem<String>(
//           value: 'Settings',
//           child: Text('Settings'),
//         ),
//         PopupMenuItem<String>(
//           value: 'Logout',
//           child: Text('Logout'),
//         ),
//       ],
//     );
//   }
// }

// //
// import 'package:flutter/material.dart';
// import 'package:plum_tiger/root/HomePage/home_page.dart';
// import 'package:plum_tiger/root/aboutUs/aboutUs.dart';
// import 'package:plum_tiger/root/bodyMiddle/bodyMiddle.dart';
// import 'package:plum_tiger/root/contactUs/contactUs.dart';
// import 'package:plum_tiger/root/iRAdvisory/iRAdvisory.dart';
// import 'package:plum_tiger/root/ourOffering/ourOffering.dart';
// import 'package:plum_tiger/root/ourStrength/ourStrength.dart';
// import 'package:plum_tiger/root/userData/userData_page.dart';
// import 'package:flutter/foundation.dart';
//
// class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
//   final ImageProvider? imageProvider;
//   final String? name;
//
//   const HomeAppbar({
//     Key? key,
//     required this.name,
//     this.imageProvider,
//   }) : super(key: key);
//
//   @override
//   Size get preferredSize => const Size.fromHeight(60.0);
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0,
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           /// LEFT: Logo
//           InkWell(
//             onTap: () {},
//             child: Image.asset(
//               'assets/images/rikcapital.jpg',
//               fit: BoxFit.contain,
//               height: 200,
//               width: 230,
//             ),
//           ),
//
//           /// MIDDLE: Navigation Items
//           Expanded(
//             child: Center(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     _buildHoverMenuItem(Icons.home, 'Home', context, onTap: () {
//
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => HomePageBar()));
//
//                     }),
//                     _buildHoverMenuItem(Icons.info, 'About us', context, onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => AboutUs(title: "")));
//                     }),
//                     _buildHoverMenuItem(Icons.settings, 'Service', context, onTap: () {}),
//                     _buildHoverMenuItem(Icons.reviews, 'IRAdvisory', context, onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => InvestorRelationsPage()));
//                     }),
//                     _buildHoverMenuItem(Icons.computer, 'Contact us', context, onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUsPage()));
//                     }),
//                     _buildHoverMenuItem(Icons.card_giftcard, 'Our Offering', context, onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => OfferingsScreen()));
//                     }),
//                     _buildHoverMenuItem(Icons.group, 'Our Strength', context, onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => OurStrength()));
//                     }),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//           /// RIGHT: User Profile & Menu
//           Row(
//             children: [
//               _buildUserMenu(context, imageProvider),
//               const SizedBox(width: 10),
//               Builder(
//                 builder: (context) => IconButton(
//                   icon: const Icon(Icons.menu, color: Colors.blueAccent, size: 25),
//                   onPressed: () {
//                     Scaffold.of(context).openDrawer();
//                   },
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   /// 🔹 Reusable Hover Navigation Item
//   Widget _buildHoverMenuItem(IconData icon, String label, BuildContext context, {VoidCallback? onTap}) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//         child: Row(
//           children: [
//             Icon(icon, size: 18, color: Colors.black54),
//             const SizedBox(width: 4),
//             Text(
//               label,
//               style: const TextStyle(fontSize: 14, color: Colors.black87),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// 🔹 User Profile Avatar (Photo or First Letter)
//   Widget _buildUserMenu(BuildContext context, ImageProvider? imageProvider) {
//     final isLoggedIn = name != null && name!.isNotEmpty;
//
//     return PopupMenuButton<String>(
//       icon: isLoggedIn
//           ? CircleAvatar(
//         radius: 18,
//         backgroundColor: Colors.blue[300],
//         backgroundImage: imageProvider,
//         child: imageProvider == null
//             ? Text(
//           name![0].toUpperCase(),
//           style: const TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.bold,
//           ),
//         )
//             : null,
//       )
//           : const Icon(Icons.person, color: Colors.blue, size: 25),
//       onSelected: (value) {
//         if (value == 'Logout') {
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignInPage()));
//         }
//       },
//       itemBuilder: (BuildContext context) => const [
//         PopupMenuItem<String>(
//           value: 'Logout',
//           child: Text('Logout'),
//         ),
//       ],
//     );
//   }
// }

// second one
// second one
//
import 'package:flutter/material.dart';
import 'package:plum_tiger/root/home_screen/home_screen_page.dart';
import 'package:plum_tiger/root/aboutUs/aboutUs.dart';
import 'package:plum_tiger/root/contactUs/contactUs.dart';
import 'package:plum_tiger/root/iRAdvisory/iRAdvisory.dart';
import 'package:plum_tiger/root/ourOffering/ourOffering.dart';
import 'package:plum_tiger/root/ourStrength/ourStrength.dart';
import 'package:plum_tiger/root/userData/userData_page.dart';


class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final ImageProvider? imageProvider;
  final String? name;

  const HomeAppbar({
    super.key,
    required this.name,
    this.imageProvider,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// LEFT: Logo
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/images/rikcapital.jpg',
              fit: BoxFit.contain,
              height: 200,
              width: 230,
            ),
          ),

          /// MIDDLE: Navigation Items
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildHoverMenuItem(Icons.home, 'Home', context, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePageBar()));
                    }),
                    _buildHoverMenuItem(Icons.group, 'Our Strength', context, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => OurStrength()));
                    }),
                    _buildHoverMenuItem(Icons.card_giftcard, 'Our Offering', context, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => OfferingsScreen()));
                    }),
                    _buildHoverMenuItem(Icons.reviews, 'IRAdvisory', context, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => InvestorRelationsPage()));
                    }),
                    _buildHoverMenuItem(Icons.settings, 'Service', context, onTap: () {}),
                    _buildHoverMenuItem(Icons.info, 'About us', context, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => AboutUs(title: "")));
                    }),
                    _buildHoverMenuItem(Icons.computer, 'Contact us', context, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUsPage()));
                    }),
                  ],
                ),
              ),
            ),
          ),

          /// RIGHT: User Profile & Menu
          Row(
            children: [
              _buildUserMenu(context, imageProvider),
              const SizedBox(width: 10),
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.blueAccent, size: 25),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// 🔹 Reusable Hover Navigation Item
  Widget _buildHoverMenuItem(IconData icon, String label, BuildContext context, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.black54),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 User Profile Avatar (Hover/Click → show login/logout)
  Widget _buildUserMenu(BuildContext context, ImageProvider? imageProvider) {
    final isLoggedIn = name != null && name!.isNotEmpty;

    Widget avatar = CircleAvatar(
      radius: 14,
      backgroundColor: Colors.blue[300],
      backgroundImage: isLoggedIn ? imageProvider : null,
      child: !isLoggedIn
          ? const Icon(Icons.person, color: Colors.white,size: 20,)
          : (imageProvider == null
          ? Text(
        name![0].toUpperCase(),
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      )
          : null),
    );

    void showProfileMenu(BuildContext context) {
      final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

      showMenu<String>(
        context: context,
        position: RelativeRect.fromLTRB(
          overlay.size.width - 50, // position near right edge
          kToolbarHeight,
          0,
          0,
        ),
        items: [
          PopupMenuItem<String>(
            value: isLoggedIn ? 'Logout' : 'Login',
            child: Text(isLoggedIn ? 'Logout' : 'Login'),
          ),
        ],
      ).then((value) {
        if (value == 'Logout') {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const SignInPage()),
            );
          });
        } else if (value == 'Login') {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const SignInPage()),
            );
          });
        }
      });
    }

    return MouseRegion(
      onEnter: (_) => showProfileMenu(context), // Hover → show menu
      child: GestureDetector(
        onTap: () => showProfileMenu(context), // Click → show menu
        child: avatar,
      ),
    );
  }
}
