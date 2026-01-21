import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderUnit extends StatefulWidget {
  const SliderUnit({super.key});

  @override
  State<SliderUnit> createState() => _SliderUnitState();
}

class _SliderUnitState extends State<SliderUnit> {
  int activeIndex = 0;
  final double imageAspectRatio = 16.0 / 9.0;

  final List<String> imagePaths = [
    'assets/images/rikcapitalbanner1.png',
    'assets/images/banner1.png',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final double maxWidth = screenWidth > 1200
        ? 1000
        : screenWidth * 0.95;

    // Slightly increased heights for a bit more image space
    final double carouselHeight = screenWidth >= 1024
        ? 480      // was 450
        : screenWidth >= 600
        ? 410  // was 380
        : 280; // was 250

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: imagePaths.length,
            options: CarouselOptions(
              height: carouselHeight,
              // height: 550,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  imagePaths[index],
                  width: maxWidth,
                  fit: BoxFit.fitWidth,
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagePaths.asMap().entries.map((entry) {
              return Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: activeIndex == entry.key
                      ? Colors.orange
                      : Colors.grey.shade300,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// class SliderUnit extends StatefulWidget {
//   const SliderUnit({super.key});
//
//   @override
//   State<SliderUnit> createState() => _SliderUnitState();
// }
//
// class _SliderUnitState extends State<SliderUnit> {
//   int activeIndex = 0;
//
//   final List<String> imagePaths = [
//     'assets/images/rikcapitalbanner1.png',
//     'assets/images/banner1.png',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//
//     return SingleChildScrollView(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             CarouselSlider.builder(
//               itemCount: imagePaths.length,
//               options: CarouselOptions(
//                 height: 500,
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//                 viewportFraction: 1.0,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     activeIndex = index;
//                   });
//                 },
//               ),
//               itemBuilder: (context, index, realIndex) {
//                 return Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 16),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 8,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(11),
//                     child: Image.asset(
//                       imagePaths[index],
//                       width: screenWidth * 0.70,
//                       height: 350,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: 16),
//             buildIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildIndicator() => Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: imagePaths.asMap().entries.map((entry) {
//       return Container(
//         width: 12,
//         height: 12,
//         margin: const EdgeInsets.symmetric(horizontal: 4),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: activeIndex == entry.key
//               ? Colors.orange
//               : Colors.grey.shade300,
//         ),
//       );
//     }).toList(),
//   );
// }
