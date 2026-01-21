import 'package:flutter/material.dart';
import 'package:plum_tiger/root/appbarTop/appbarTop.dart';
import 'package:plum_tiger/root/bottomPitch/bottomPitch_page.dart';

class OurStrength extends StatelessWidget {
  OurStrength({super.key});

  final List<Map<String, dynamic>> myCards = [
    {
      'icon': 'assets/icons/partners.png',
      'title': 'Well Balanced Team',
      'subtitle':
          'With a deep understanding of the financial ecosystem. we have delivered over 30 successful projects',
    },
    {
      'icon': 'assets/icons/workflow.png',
      'title': 'Workflow Transparency',
      'subtitle':
          'With regular milestone tracking, reporting, and adherence to best project management practices',
    },
    {
      'icon': 'assets/icons/portfolio.png',
      'title': 'Diverse Portfolio Of Services',
      'subtitle':
          "Firm's diverse portfolio makes it possible to target several industries across the country at the same time",
    },
  ];

  final List<Map<String, dynamic>> strength = [
    {
      'icon': 'assets/icons/Ethical.png',
      'title': 'High Ethical Values',
      'subtitle':
          "With strong ethics and respect for confidentiality, we’ve built trust with clients and stakeholders",
    },
    {
      'icon': 'assets/icons/Add value.png',
      'title': 'We Add Value',
      'subtitle':
          "We provide custom solutions to help clients across the lifecycle of their organization",
    },
    {
      'icon': 'assets/icons/Execution.png',
      'title': 'Strong Execution',
      'subtitle':
          "A clear vision that unifies the team and drives collaboration to deliver the best outcomes",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(name: '',),
      bottomNavigationBar: BottomBar(),
      backgroundColor: const Color(0xFFF6F6F6),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;
          final double cardWidth = isWide ? 320 : constraints.maxWidth * 0.9;

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
                              text: 'STRENGTH',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Top Row
                      Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        alignment: WrapAlignment.center,
                        children:
                            myCards.map((item) => _buildCard(item, cardWidth)).toList(),
                      ),

                      const SizedBox(height: 48),

                      // Bottom Row
                      Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        alignment: WrapAlignment.center,
                        children:
                            strength.map((item) => _buildCard(item, cardWidth)).toList(),
                      ),

                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard(Map<String, dynamic> item, double width) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                item['icon'],
                width: 48,
                height: 48,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  item['title'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            item['subtitle'],
            style: const TextStyle(fontSize: 15.5, color: Colors.black54, height: 1.4),
          ),
        ],
      ),
    );
  }
}
