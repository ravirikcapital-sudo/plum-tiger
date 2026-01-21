import 'package:flutter/material.dart';
import 'package:plum_tiger/root/appbarTop/appBar_page.dart';
import 'package:plum_tiger/root/bottomPitch/bottomPitch_page.dart';

class OfferingsScreen extends StatelessWidget {
  final List<Map<String, String>> offerings = [
    {
      'icon': 'assets/icons/client.png',
      'title': 'Client Induction/Briefing',
      'subtitle':
          'A detailed briefing of Rik Capital IR team on the business as well as on the ongoing efforts of the client',
    },
    {
      'icon': 'assets/icons/bank.png',
      'title': 'Resource Bank',
      'subtitle': 'Corporate factsheet, FAQs',
    },
    {
      'icon': 'assets/icons/planned.png',
      'title': 'Quarter Plans',
      'subtitle': 'A quarterly work plan/dashboard of key activities and initiatives',
    },
    {
      'icon': 'assets/icons/update.png',
      'title': 'WIP update',
      'subtitle': 'Fortnightly WIP meetings to monitor progress',
    },
    {
      'icon': 'assets/icons/montly.jpeg',
      'title': 'Monthly Report',
      'subtitle': 'Activity report, encapsulating details of initiatives carried out',
    },
    {
      'icon': 'assets/icons/review.png',
      'title': 'Quarter/Yearly review',
      'subtitle': 'Quarterly/Annual campaign review covering key activities, outcomes, and improvement areas.',
    },
  ];

  OfferingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(name: '',),
      backgroundColor: const Color(0xFFF7F8FC),
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'OUR ',
                              style: TextStyle(color: Colors.orange[800]),
                            ),
                            const TextSpan(
                              text: 'OFFERINGS',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: offerings.map((item) {
                      return _buildCard(item);
                    }).toList(),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(Map<String, String> item) {
    return Container(
      width: 320,
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(2, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          if (item['icon'] != null)
            Image.asset(
              item['icon']!,
              width: 64,
              height: 64,
              fit: BoxFit.contain,
            ),
          const SizedBox(height: 10),
          Text(
            item['title']!,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                item['subtitle']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.5,
                  color: Colors.black87,
                  height: 1.4,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
