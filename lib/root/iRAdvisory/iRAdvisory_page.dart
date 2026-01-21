// import 'package:flutter/material.dart';
// import 'package:plum_tiger/root/appbarTop/appBar_page.dart';
// import 'package:plum_tiger/root/bottomPitch/bottomPitch_page.dart';
//
// class InvestorRelationsPage extends StatelessWidget {
//   const InvestorRelationsPage({Key? key}) : super(key: key);
//
//   final Color primaryColor = const Color(0xFF0A3D62); // Deep Navy Blue
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: HomeAppbar(name: '',),
//       bottomNavigationBar: BottomBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Center(
//               child: RichText(
//                         textAlign: TextAlign.center,
//                         text: TextSpan(
//                           style: const TextStyle(
//                             fontSize: 36,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: 'IR ',
//                               style: TextStyle(color: Colors.orange[800]),
//                             ),
//                             const TextSpan(
//                               text: 'ADVISORY',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       ),
//             ),
//             const SizedBox(height: 20),
//
//             // Description Card
//             Container(
//               padding: const EdgeInsets.all(18),
//               decoration: BoxDecoration(
//                 color: Colors.blue.shade50,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: const Text(
//                 "Investor Relations is a long-term, ongoing responsibility that should be a regular and consistent process of investor engagement by corporates, rather than an activity that many companies undertake just occasionally.\n\n"
//                 "We at Marathon help companies to establish, develop and maintain relationships with its current investors as well as aim towards building up a connect with potentially new investor set across a diverse group of Institutional as well as HNI Investors.\n\n"
//                 "With thousands of companies listed on the Indian Stock exchanges, competition for gauging investor, analyst and media attention is strong.\n\n"
//                 "On the back of years of investment banking experience across diverse group of Companies, we are able to carve out right communication strategies to corporates making the investor relations more effective.\n\n"
//                 "With a knack of working closely with our clients with in-depth domain knowledge and analysis, helps us to effectively represent our clients in the investor interactions leading to substantial saving in management time.\n\n"
//                 "As part of our Investor Relations advisory we assist our clients in:",
//                 style: TextStyle(fontSize: 15.5, height: 1.6),
//               ),
//             ),
//
//             const SizedBox(height: 30),
//
//             // Bullet Boxes in Grid
//             LayoutBuilder(
//               builder: (context, constraints) {
//                 bool isMobile = constraints.maxWidth < 600;
//                 double cardWidth = isMobile ? double.infinity : (constraints.maxWidth / 2) - 24;
//
//                 return Wrap(
//                   spacing: 20,
//                   runSpacing: 20,
//                   children: [
//                     _infoCard("Assist in building the 'Investment Idea’ and Positioning of the Company", cardWidth),
//                     _infoCard("Help in identifying client’s key differentiators and building the communication strategy", cardWidth),
//                     _infoCard("Track and collate feedback with regard to Perception Management", cardWidth),
//                     _infoCard("Marketing the idea through Research Coverage", cardWidth),
//                     _infoCard("Assist in enhancing visibility through Road-shows and Investors meetings", cardWidth),
//                     _infoCard("Disseminating timely information", cardWidth),
//                     _infoCard("Assist to effectively respond to investor queries", cardWidth),
//                     _infoCard("Strategy review and advising on appropriate funding options and timing", cardWidth),
//                   ],
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _infoCard(String text, double width) {
//     return Container(
//       width: width,
//       height: 100, // Fixed height for all boxes
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           )
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Icon(Icons.arrow_circle_right_outlined, color: Colors.indigo, size: 22),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(fontSize: 15.2, height: 1.4),
//               maxLines: 5,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:plum_tiger/root/appbarTop/appBar_page.dart';
import 'package:plum_tiger/root/bottomPitch/bottomPitch_page.dart';

class InvestorRelationsPage extends StatelessWidget {
  const InvestorRelationsPage({super.key});

  final Color headingColor = const Color(0xFF0A3D62);
  final Color accentOrange = const Color(0xFFFF8C00);
  final Color textColor = const Color(0xFF2C3E50);
  final Color backgroundLight = const Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(name: ''),
      bottomNavigationBar: BottomBar(),
      backgroundColor: backgroundLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'IR ',
                      style: TextStyle(color: accentOrange),
                    ),
                    TextSpan(
                      text: 'ADVISORY',
                      style: TextStyle(color: headingColor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                "Investor Relations is a long-term, ongoing responsibility that should be a regular and consistent process of investor engagement by corporates, rather than an activity that many companies undertake just occasionally."
                    "We at RikCapital help companies to establish, develop and maintain relationships with its current investors as well as aim towards building up a connect with potentially new investor set across a diverse group of Institutional as well as HNI Investors."
                    "With thousands of companies listed on the Indian Stock exchanges, competition for gauging investor, analyst and media attention is strong.\n\n"
                    "On the back of years of investment banking experience across diverse group of Companies, we are able to carve out right communication strategies to corporates making the investor relations more effective."
                    "With a knack of working closely with our clients with in-depth domain knowledge and analysis, helps us to effectively represent our clients in the investor interactions leading to substantial saving in management time.\n\n"
                    "As part of our Investor Relations advisory we assist our clients in:",
                style: TextStyle(
                  fontSize: 15.5,
                  height: 1.6,
                  color: textColor,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ),

            const SizedBox(height: 30),

            LayoutBuilder(
              builder: (context, constraints) {
                bool isMobile = constraints.maxWidth < 700;
                double cardWidth =
                isMobile ? double.infinity : (constraints.maxWidth / 2) - 16;

                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildSectionCard(
                      title: "Building & Strategy",
                      points: [
                        "Assist in building the 'Investment Idea’ and Positioning of the Company",
                        "Help in identifying client’s key differentiators and building the communication strategy",
                        "Track and collate feedback with regard to Perception Management",
                        "Marketing the idea through Research Coverage",
                      ],
                      width: cardWidth,
                    ),
                    _buildSectionCard(
                      title: "Visibility & Engagement",
                      points: [
                        "Assist in enhancing visibility through Road-shows and Investors meetings",
                        "Disseminating timely information",
                        "Assist to effectively respond to investor queries",
                        "Strategy review and advising on appropriate funding options and timing",
                      ],
                      width: cardWidth,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required List<String> points,
    required double width,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: headingColor,
            ),
          ),
          const SizedBox(height: 12),

          // Bullet Points
          ...points.map(
                (point) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: headingColor,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      point,
                      style: TextStyle(
                        fontSize: 15.2,
                        height: 1.4,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
