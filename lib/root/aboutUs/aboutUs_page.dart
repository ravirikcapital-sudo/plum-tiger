import 'package:flutter/material.dart';
import 'package:plum_tiger/root/bottomPitch/bottomPitch_page.dart';
import '../appbarTop/appBar_page.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key, required this.title});
  final String title;

  final Color primaryColor = const Color(0xFF0A3D62); // Navy Blue
  final Color accentColor = const Color(0xFF74B9FF);  // Light Blue

  Widget bulletText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle_outline, size: 18, color: primaryColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14, color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(String title, List<String> bullets) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          ...bullets.map((b) => bulletText(b)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(name: '',),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200), // Max width for responsiveness
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Centered ABOUT US heading
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
                            text: 'ABOUT ',
                            style: TextStyle(color: Colors.orange[800]),
                          ),
                          const TextSpan(
                            text: 'US',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Description
                  Text(
                    "We are a values-driven and values-led investor communication consultancy. We complement Investor Relations, Public Relations, and Corporate Reporting under one roof. We help connect with stakeholders through strategic capital market insights.",
                    style: TextStyle(fontSize: 20, color: primaryColor),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 50),

                  // Side-by-side cards
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return constraints.maxWidth > 600
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: buildCard("Our Approach", [
                                    "Dynamic communication strategy",
                                    "Acting as client representatives",
                                    "24/7 availability for support",
                                    "Consistent communication methods",
                                    "Unique positioning in market",
                                  ]),
                                ),
                                const SizedBox(width: 40),
                                Expanded(
                                  child: buildCard("Value Unlocking", [
                                    "Enable fair value discovery",
                                    "Create informed ecosystem",
                                    "Identify key growth drivers",
                                    "Bridge with stakeholders",
                                    "Unlock potential strategies",
                                  ]),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                buildCard("Our Approach", [
                                  "Dynamic communication strategy",
                                  "Acting as client representatives",
                                  "24/7 availability for support",
                                  "Consistent communication methods",
                                  "Unique positioning in market",
                                ]),
                                const SizedBox(height: 20),
                                buildCard("Value Unlocking", [
                                  "Enable fair value discovery",
                                  "Create informed ecosystem",
                                  "Identify key growth drivers",
                                  "Bridge with stakeholders",
                                  "Unlock potential strategies",
                                ]),
                              ],
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
