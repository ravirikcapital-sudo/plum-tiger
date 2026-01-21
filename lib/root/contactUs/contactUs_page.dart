// import 'dart:convert';
// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:network_info_plus/network_info_plus.dart';

// // ====================== GET BASE URL =========================
// Future<String> getBaseUrl() async {
//   final info = NetworkInfo();

//   try {
//     if (kIsWeb) {
//       // Web can't reach localhost directly unless served on same origin
//       final wifiIP = await info.getWifiIP();
//       return wifiIP != null
//           ? 'http://$wifiIP:8000/api'
//           : 'http://localhost:8000/api';
//     }

//     if (Platform.isAndroid) {
//       final wifiIP = await info.getWifiIP();

//       // Detect emulator: Usually IP starts with 10.0.2. or 192.168.232.
//       final isEmulator = wifiIP == null ||
//           wifiIP.startsWith('10.0.2.') ||
//           wifiIP.startsWith('192.168.232.');

//       return isEmulator
//           ? 'http://10.0.2.2:8000/api' // Android emulator loopback
//           : 'http://$wifiIP:8000/api'; // Physical device to PC LAN IP
//     }

//     if (Platform.isIOS) {
//       final wifiIP = await info.getWifiIP();
//       // iOS simulator can use localhost
//       return (wifiIP != null && !wifiIP.startsWith('127.'))
//           ? 'http://$wifiIP:8000/api'
//           : 'http://localhost:8000/api';
//     }

//     // For desktop
//     final wifiIP = await info.getWifiIP();
//     return wifiIP != null
//         ? 'http://$wifiIP:8000/api'
//         : 'http://localhost:8000/api';
//   } catch (e) {
//     return 'http://localhost:8000/api'; // final fallback
//   }
// }

// class ContactUsPage extends StatelessWidget {
//   ContactUsPage({super.key});

//   final Color primaryColor = const Color(0xFF0A3D62); // Navy Blue
//   final Color accentColor = const Color(0xFF0C6977); // Blue-Green
//   final Color backgroundColor = const Color(0xFFF1F5F9); // Light Grey

//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _messageController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: HomeAppbar(name: '',),
//       bottomNavigationBar: BottomBar(),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           final isWide = constraints.maxWidth > 700;
//           return SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
//             child: Column(
//               children: [
//                 _buildHeader(),
//                 const SizedBox(height: 30),
//                 isWide
//                     ? Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(child: _buildContactInfoCard()),
//                           const SizedBox(width: 30),
//                           Expanded(flex: 2, child: _buildContactForm(context)),
//                         ],
//                       )
//                     : Column(
//                         children: [
//                           _buildContactInfoCard(),
//                           const SizedBox(height: 30),
//                           _buildContactForm(context),
//                         ],
//                       ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Column(
//       children: [
//         //const FaIcon(FontAwesomeIcons.addressBook, size: 48, color: Color(0xFF0A3D62)),
//         RichText(
//                         textAlign: TextAlign.center,
//                         text: TextSpan(
//                           style: const TextStyle(
//                             fontSize: 36,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: 'LETS ',
//                               style: TextStyle(color: Colors.orange[800]),
//                             ),
//                             const TextSpan(
//                               text: 'CONNECT',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       ),
//         const SizedBox(height: 10),
//         Text(
//           "Have questions or inquiries? Drop us a message.",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//         ),
//       ],
//     );
//   }

//   Widget _buildContactInfoCard() {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           )
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Contact Info",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: primaryColor,
//               )),
//           const SizedBox(height: 20),
//           _buildInfoTile(Icons.email, "support@rikcapital.com", "Email us your queries"),
//           const Divider(),
//           _buildInfoTile(Icons.phone, "+91-9876543210", "Mon-Fri | 10AM - 6PM"),
//           const Divider(),
//           _buildInfoTile(Icons.location_on, "Mumbai, India", "Corporate Office"),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoTile(IconData icon, String title, String subtitle) {
//     return ListTile(
//       leading: Icon(icon, color: primaryColor),
//       title: Text(title),
//       subtitle: Text(subtitle),
//       contentPadding: EdgeInsets.zero,
//     );
//   }

//   Widget _buildContactForm(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           )
//         ],
//       ),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             Text(
//               "Send Us a Message",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: primaryColor,
//               ),
//             ),
//             const SizedBox(height: 24),
//             _buildInputField(
//               controller: _nameController,
//               label: "Full Name",
//               icon: Icons.person,
//             ),
//             const SizedBox(height: 20),
//             _buildInputField(
//               controller: _emailController,
//               label: "Email Address",
//               icon: Icons.email,
//               keyboardType: TextInputType.emailAddress,
//             ),
//             const SizedBox(height: 20),
//             _buildInputField(
//               controller: _messageController,
//               label: "Your Message",
//               icon: Icons.message,
//               maxLines: 3,
//             ),
//             const SizedBox(height: 30),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton.icon(
//                 icon: const Icon(Icons.send),
//                 label: const Text("Send Message"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: accentColor,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   textStyle: const TextStyle(fontSize: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                 ),
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Message sent successfully!')),
//                     );
//                     _nameController.clear();
//                     _emailController.clear();
//                     _messageController.clear();
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     int maxLines = 1,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return TextFormField(
//       controller: controller,
//       maxLines: maxLines,
//       keyboardType: keyboardType,
//       validator: (value) =>
//           value == null || value.trim().isEmpty ? 'Please enter $label' : null,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: accentColor),
//         labelText: label,
//         filled: true,
//         fillColor: Colors.grey.shade100,
//         contentPadding: const EdgeInsets.all(18),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: accentColor, width: 2),
//           borderRadius: BorderRadius.circular(14),
//         ),
//       ),
//     );
//   }
// }

//   Future<void> _submitForm(BuildContext context) async {
//     final name = _nameController.text.trim();
//     final email = _emailController.text.trim();
//     final message = _messageController.text.trim();

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'name': name, 'email': email, 'message': message}),
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Message sent successfully!')),
//         );
//         _nameController.clear();
//         _emailController.clear();
//         _messageController.clear();
//       } else {
//         final responseBody = jsonDecode(response.body);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${responseBody['error'] ?? 'Unknown error'}')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to connect to server: $e')),
//       );
//     }
//   }
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:plum_tiger/root/appbarTop/appBar_page.dart';
import 'package:plum_tiger/root/bottomPitch/bottomPitch_page.dart';

/// ====================== GET BASE URL =========================
Future<String> getBaseUrl() async {
  final info = NetworkInfo();

  try {
    final wifiIP = await info.getWifiIP();

    if (kIsWeb) {
      return wifiIP != null && wifiIP.isNotEmpty
          ? 'http://$wifiIP:8000/api'
          : 'http://localhost:8000/api';
    }

    if (Platform.isAndroid) {
      final isEmulator = wifiIP == null ||
          wifiIP.startsWith('10.0.2.') ||
          wifiIP.startsWith('192.168.232.');
      return isEmulator
          ? 'http://10.0.2.2:8000/api'
          : 'http://$wifiIP:8000/api';
    }

    if (Platform.isIOS) {
      return (wifiIP != null && !wifiIP.startsWith('127.'))
          ? 'http://$wifiIP:8000/api'
          : 'http://localhost:8000/api';
    }

    return wifiIP != null
        ? 'http://$wifiIP:8000/api'
        : 'http://localhost:8000/api';
  } catch (e) {
    debugPrint('Error detecting IP: $e');
    return 'http://localhost:8000/api';
  }
}

/// ====================== CONTACT US PAGE =========================
class ContactUsPage extends StatelessWidget {
  ContactUsPage({super.key});

  final Color primaryColor = const Color(0xFF0A3D62);
  final Color accentColor = const Color(0xFF0C6977);
  final Color backgroundColor = const Color(0xFFF1F5F9);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: HomeAppbar(name: ''),
      bottomNavigationBar: BottomBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 700;
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 30),
                isWide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildContactInfoCard()),
                          const SizedBox(width: 30),
                          Expanded(flex: 2, child: _buildContactForm(context)),
                        ],
                      )
                    : Column(
                        children: [
                          _buildContactInfoCard(),
                          const SizedBox(height: 30),
                          _buildContactForm(context),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
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
                text: 'LETS ',
                style: TextStyle(color: Colors.orange[800]),
              ),
              const TextSpan(
                text: 'CONNECT',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Have questions or inquiries? Drop us a message.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _buildContactInfoCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Contact Info",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              )),
          const SizedBox(height: 20),
          _buildInfoTile(Icons.email, "ritesh.singh@rikcapital.in",
              "Email us your queries"),
          const Divider(),
          _buildInfoTile(Icons.phone, "+91-8329385762", "Mon-Fri | 9 AM - 6 PM"),
          const Divider(),
          _buildInfoTile(
              Icons.location_on, "Ghatkopar, Bharat", "Corporate Office"),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: primaryColor),
      title: Text(title),
      subtitle: Text(subtitle),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              "Send Us a Message",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 24),
            _buildInputField(
              controller: _nameController,
              label: "Full Name",
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            _buildInputField(
              controller: _emailController,
              label: "Email Address",
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            _buildInputField(
              controller: _messageController,
              label: "Your Message",
              icon: Icons.message,
              maxLines: 3,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("Send Message"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () => _submitForm(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: (value) =>
          value == null || value.trim().isEmpty ? 'Please enter $label' : null,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: accentColor),
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.all(18),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: accentColor, width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  Future<void> _submitForm(BuildContext context) async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    if (!_formKey.currentState!.validate()) return;

    try {
      final baseUrl = await getBaseUrl();
      final response = await http.post(
        Uri.parse('$baseUrl/contact/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'message': message}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent successfully!')),
        );
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      } else {
        String errorMsg = 'Unknown error';
        try {
          final responseBody = jsonDecode(response.body);
          errorMsg = responseBody['error'] ?? errorMsg;
        } catch (_) {
          errorMsg = response.body;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $errorMsg')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to connect to server: $e')),
      );
    }
  }
}
