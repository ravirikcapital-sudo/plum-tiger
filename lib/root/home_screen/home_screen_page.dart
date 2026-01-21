import 'package:flutter/material.dart';

import 'package:plum_tiger/root/root.dart';

//import 'root/root.dart';
//import 'package:plum_tiger/root/appbarTop/appBar_page.dart';
//import 'package:plum_tiger/root/bodyMiddle/bodyMiddle.dart';
//import 'package:plum_tiger/root/bottomPitch/bottomPitch_page.dart';

class HomePageBar extends StatelessWidget {
  const HomePageBar({super.key});

  final Color primaryColor = const Color(0xFF0A3D62); // Deep Navy Blue

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(name: '',),
      bottomNavigationBar: BottomBar(),
      body: SliderUnit()
    );
  }

  Widget _infoCard(String text, double width) {
    return Container(
      width: width,
      height: 100, // Fixed height for all boxes
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.arrow_circle_right_outlined, color: Colors.indigo, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15.2, height: 1.4),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
