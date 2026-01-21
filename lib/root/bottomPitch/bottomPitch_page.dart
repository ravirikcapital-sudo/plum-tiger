// G. Roshan



// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class BottomBar extends StatelessWidget {
//   const BottomBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Colors.brown,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             InkWell(
//               onTap: () => launchURL('https://google.com'),
//               child: Row(
//                 children: const [
//                   Icon(Icons.copyright, size: 16, color: Colors.black),
//                   SizedBox(width: 2),
//                   Text(
//                     'RIK Consultancy & Advisory Services LLP.',
//                     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             InkWell(
//               onTap: () => launchURL('https://www.linkedin.com/company/rikcapital/posts/?feedView=all&viewAsMember=true'),
//               child: Row(
//                 children: const [
//                   FaIcon(FontAwesomeIcons.linkedin, size: 16, color: Colors.blueAccent),
//                   SizedBox(width: 5),
//                   Text(
//                     'LinkedIn',
//                     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//             InkWell(
//               onTap: () => launchURL('https://google.com'),
//               child: const Text(
//                 'Designed By RIK CAPITAL TEAM',
//                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// // 'Future' is used because launching a URL takes time (like opening a browser),
// // so we wait for it to complete using 'await'.
// Future<void> launchURL(String urlString) async {
//   final Uri url = Uri.parse(urlString);
//   if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
//     throw 'Could not launch $url';
//   }
// }


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 50,
      color: const Color(0xFF1E1E2C), // Dark background for professional look
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0),
        child: Wrap(
          spacing: 20.0,
          runSpacing: 10.0,
          alignment: WrapAlignment.spaceAround,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            InkWell(
              onTap: () => launchURL('https://google.com'),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.copyright, size: 16, color: Colors.grey.shade400),
                  const SizedBox(width: 6),
                  const Text(
                    'Rik Consultancy & Advisory Services LLP',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => launchURL('https://www.linkedin.com/company/rikcapital/posts/?feedView=all'),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  FaIcon(FontAwesomeIcons.linkedin, size: 16, color: Color(0xFF0A66C2)),
                  SizedBox(width: 5),
                  Text(
                    'LinkedIn',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => launchURL('https://google.com'),
              child:
              const Text(
                'Designed By Rik Software Team',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyanAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> launchURL(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}