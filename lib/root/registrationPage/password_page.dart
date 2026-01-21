import 'dart:io';
import 'package:plum_tiger/root/root.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class PasswordPage extends StatefulWidget {
  final XFile? pickedFile;
  final Uint8List? webImage;
  final String name, email, mobile, city, gender;

  const PasswordPage({
    super.key,
    required this.pickedFile,
    required this.webImage,
    required this.name,
    required this.email,
    required this.mobile,
    required this.city,
    required this.gender,
  });

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  Future<void> submitRegistration() async {
    final uri = Uri.parse("http://127.0.0.1:8000/api/users/register/");
    final request = http.MultipartRequest("POST", uri);

    request.fields['name'] = widget.name;
    request.fields['email'] = widget.email;
    request.fields['mobile'] = widget.mobile;
    request.fields['city'] = widget.city;
    request.fields['gender'] = widget.gender;
    request.fields['password'] = _passwordController.text;

    if (widget.pickedFile != null) {
      final bytes = await widget.pickedFile!.readAsBytes();
      request.files.add(
        http.MultipartFile.fromBytes('profile_image', bytes, filename: widget.pickedFile!.name),
      );
    } else if (kIsWeb && widget.webImage != null) {
      request.files.add(
        http.MultipartFile.fromBytes('profile_image', widget.webImage!, filename: 'webimage.png'),
      );
    }

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration Successful")),
        );

        ImageProvider<Object>? finalImage;

        if (kIsWeb && widget.webImage != null) {
  finalImage = MemoryImage(widget.webImage!);
          } else if (!kIsWeb && widget.pickedFile != null) {
          finalImage = FileImage(File(widget.pickedFile!.path));
          }

        Navigator.pushReplacement(
         context,
          MaterialPageRoute(
            builder: (_) => HomePageBar(
           // name: widget.name,
           // imageProvider: finalImage, // ✅ Safely typed ImageProvider<Object>?
    ),
  ),
);

      } else {
        debugPrint("Server response: $responseBody");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration Failed (${response.statusCode})"), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      debugPrint("Error during registration: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An error occurred"), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider? imageProvider = kIsWeb
        ? (widget.webImage != null ? MemoryImage(widget.webImage!) : null)
        : (widget.pickedFile != null ? FileImage(File(widget.pickedFile!.path)) : null);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF20C3AF), Color(0xFF35A8E0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 400,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text("Set The Password !", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                      const Text("Start your journey with us", style: TextStyle(fontSize: 15)),
                      const SizedBox(height: 20),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: imageProvider,
                        child: imageProvider == null
                            ? Text(
                                widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '',
                                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                              )
                            : null,
                      ),
                      const SizedBox(height: 20),
                      buildPasswordField(),
                      const SizedBox(height: 20),
                      buildConfirmPasswordField(),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            submitRegistration();
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        child: const Text("Sign Up", style: TextStyle(color: Colors.black87)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: buildInputDecoration(
        label: "New Password",
        icon: Icons.lock,
        isObscured: _obscurePassword,
        onToggle: () => setState(() => _obscurePassword = !_obscurePassword),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return "Password is required";
        if (value.length < 6) return "Password must be at least 6 characters";
        return null;
      },
    );
  }

  Widget buildConfirmPasswordField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: _obscureConfirmPassword,
      decoration: buildInputDecoration(
        label: "Confirm Password",
        icon: Icons.lock,
        isObscured: _obscureConfirmPassword,
        onToggle: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return "Please confirm your password";
        if (value != _passwordController.text) return "Passwords do not match";
        return null;
      },
    );
  }

  InputDecoration buildInputDecoration({
    required String label,
    required IconData icon,
    required bool isObscured,
    required VoidCallback onToggle,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black87, width: 1),
        borderRadius: BorderRadius.circular(50),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black87, width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      filled: true,
      fillColor: Colors.white,
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black87),
      prefixIcon: Icon(icon, color: Colors.black87),
      suffixIcon: IconButton(
        icon: Icon(
          isObscured ? Icons.visibility_off : Icons.visibility,
          color: Colors.black87,
        ),
        onPressed: onToggle,
      ),
    );
  }
}




// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:plum_tiger/main.dart';

// class PasswordPage extends StatefulWidget {
//   final XFile? pickedFile;
//   final Uint8List? webImage;
//   final String name, email, mobile, city, gender;

//   const PasswordPage({
//     super.key,
//     required this.pickedFile,
//     required this.webImage,
//     required this.name,
//     required this.email,
//     required this.mobile,
//     required this.city,
//     required this.gender,
//   });

//   @override
//   State<PasswordPage> createState() => _PasswordPageState();
// }

// class _PasswordPageState extends State<PasswordPage> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();

//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;

//   Future<void> submitRegistration() async {
//     final uri = Uri.parse("http://127.0.0.1:8000/api/users/register/");
//     final request = http.MultipartRequest("POST", uri);

//     request.fields['name'] = widget.name;
//     request.fields['email'] = widget.email;
//     request.fields['mobile'] = widget.mobile;
//     request.fields['city'] = widget.city;
//     request.fields['gender'] = widget.gender;
//     request.fields['password'] = _passwordController.text;

//     if (widget.pickedFile != null) {
//       final bytes = await widget.pickedFile!.readAsBytes();
//       request.files.add(
//         http.MultipartFile.fromBytes(
//           'profile_image', bytes,
//           filename: widget.pickedFile!.name,
//         ),
//       );
//     } else if (kIsWeb && widget.webImage != null) {
//       request.files.add(
//         http.MultipartFile.fromBytes(
//           'profile_image', widget.webImage!,
//           filename: 'webimage.png',
//         ),
//       );
//     }

//     try {
//       final response = await request.send();
//       final responseBody = await response.stream.bytesToString();
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Registration Successful")),
//         );

//         var finalImage;
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (_) => HomePage(
//               name: widget.name,
//               imageProvider: finalImage,
//             ),
//           ),
//         );
//       } else {
//         debugPrint("Server response: $responseBody");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("Registration Failed (${response.statusCode})"),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       debugPrint("Error during registration: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("An error occurred"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     ImageProvider? imageProvider = kIsWeb
//         ? (widget.webImage != null ? MemoryImage(widget.webImage!) : null)
//         : (widget.pickedFile != null ? FileImage(File(widget.pickedFile!.path)) : null);

//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFF20C3AF), Color(0xFF35A8E0)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//           Center(
//             child: SizedBox(
//               width: 400,
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       const Text("Set The Password !", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//                       const Text("Start your journey with us", style: TextStyle(fontSize: 15)),
//                       const SizedBox(height: 20),
//                       CircleAvatar(
//                         radius: 40,
//                         backgroundColor: Colors.grey[300],
//                         backgroundImage: imageProvider,
//                         child: imageProvider == null
//                             ? Text(
//                                 widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '',
//                                 style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                               )
//                             : null,
//                       ),
//                       const SizedBox(height: 20),
//                       buildPasswordField(),
//                       const SizedBox(height: 20),
//                       buildConfirmPasswordField(),
//                       const SizedBox(height: 40),
//                       ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             submitRegistration();
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
//                         child: const Text("Sign Up", style: TextStyle(color: Colors.black87)),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildPasswordField() {
//     return TextFormField(
//       controller: _passwordController,
//       obscureText: _obscurePassword,
//       decoration: buildInputDecoration(
//         label: "New Password",
//         icon: Icons.lock,
//         isObscured: _obscurePassword,
//         onToggle: () => setState(() => _obscurePassword = !_obscurePassword),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) return "Password is required";
//         if (value.length < 6) return "Password must be at least 6 characters";
//         return null;
//       },
//     );
//   }

//   Widget buildConfirmPasswordField() {
//     return TextFormField(
//       controller: _confirmPasswordController,
//       obscureText: _obscureConfirmPassword,
//       decoration: buildInputDecoration(
//         label: "Confirm Password",
//         icon: Icons.lock,
//         isObscured: _obscureConfirmPassword,
//         onToggle: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) return "Please confirm your password";
//         if (value != _passwordController.text) return "Passwords do not match";
//         return null;
//       },
//     );
//   }

//   InputDecoration buildInputDecoration({
//     required String label,
//     required IconData icon,
//     required bool isObscured,
//     required VoidCallback onToggle,
//   }) {
//     return InputDecoration(
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
//       enabledBorder: OutlineInputBorder(
//         borderSide: const BorderSide(color: Colors.black87, width: 1),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(color: Colors.black87, width: 2),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       filled: true,
//       fillColor: Colors.white,
//       labelText: label,
//       labelStyle: const TextStyle(color: Colors.black87),
//       prefixIcon: Icon(icon, color: Colors.black87),
//       suffixIcon: IconButton(
//         icon: Icon(
//           isObscured ? Icons.visibility_off : Icons.visibility,
//           color: Colors.black87,
//         ),
//         onPressed: onToggle,
//       ),
//     );
//   }
// }






// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:plum_tiger/main.dart';


// class PasswordPage extends StatefulWidget {
//   const PasswordPage({
//     super.key,
//     required this.pickedFile,
//     required this.webImage,
//     required this.name, required String mobile, required String gender, required String city, required String email,
//   });

//   final XFile? pickedFile;
//   final Uint8List? webImage;
//   final String name;

//   @override
//   State<PasswordPage> createState() => _PasswordPageState();
// }

// class _PasswordPageState extends State<PasswordPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;
//   ImageProvider? finalImage;

//   late XFile? pickedFile;
//   late Uint8List? webImage;
//   late String name;


//   @override
//   void initState() {
//     super.initState();
//     pickedFile = widget.pickedFile;
//     webImage = widget.webImage;
//     name = widget.name;
//   }

//   @override
//   Widget build(BuildContext context) {
//     ImageProvider? imageProvider = kIsWeb
//         ? (webImage != null ? MemoryImage(webImage!) : null)
//         : (pickedFile != null ? FileImage(File(pickedFile!.path)) : null);

//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFF20C3AF), Color(0xFF35A8E0)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//           Center(
//             child: SizedBox(
//               width: 400,
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Set The Password !",
//                         style: TextStyle(
//                           fontSize: 35,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text("Start your journey with us", style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
//                       SizedBox(height: 20,),
//                       Center(
//                         child: CircleAvatar(
//                           radius: 40,
//                           backgroundColor: Colors.grey[300],
//                           backgroundImage: imageProvider,
//                           child: imageProvider == null
//                               ? Text(
//                             name.isNotEmpty ? name[0].toUpperCase() : '',
//                             style: TextStyle(
//                                 fontSize: 30,
//                                 color: Colors.black87,
//                                 fontWeight: FontWeight.bold),
//                           )
//                               : null,
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       TextFormField(
//                         controller: _passwordController,
//                         obscureText: _obscurePassword,
//                         keyboardType: TextInputType.visiblePassword,
//                         style: TextStyle(color: Colors.black87),
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black87, width: 1),
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black87, width: 2),
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                             labelText: "New Password",
//                             labelStyle: TextStyle(color: Colors.black87),
//                             prefixIcon: Icon(Icons.lock, color: Colors.black87),
//                             suffixIcon: IconButton(
//                               icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility ,
//                                 color: Colors.black87,
//                               ), onPressed: () {
//                               setState(() {
//                                 _obscurePassword = ! _obscurePassword;
//                               });
//                             },)
//                         ),
//                         validator: (value) {
//                           if(value == null || value.isEmpty) {
//                             return "Password is required";
//                           } if(value.length < 6) {
//                             return "Password must be  atleast of 6 characters";
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller: _confirmPasswordController,
//                         obscureText: _obscureConfirmPassword,
//                         style: TextStyle(color: Colors.black87),
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.black87, width: 1),
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.black87, width: 2),
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           labelText: "Confirm Password",
//                           labelStyle: TextStyle(color: Colors.black87),
//                           prefixIcon: Icon(Icons.lock, color: Colors.black87),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
//                               color: Colors.black87,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _obscureConfirmPassword = !_obscureConfirmPassword;
//                               });
//                             },
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "Please confirm your password";
//                           }
//                           if (value != _passwordController.text) {
//                             return "Passwords do not match";
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 40,),
//                       ElevatedButton(onPressed: () {
//                         if(_formKey.currentState!.validate()) {
//                           if(_passwordController.text != _confirmPasswordController.text) {
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password do not match"),
//                                 backgroundColor: Colors.red));
//                             return;
//                           }
//                           if(_passwordController.text.length < 6) {
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The password should be atleast of 6 characters"),
//                               backgroundColor: Colors.red,
//                             ),
//                             );
//                             return;
//                           }
//                           finalImage = kIsWeb
//                               ? (webImage != null ? MemoryImage(webImage!) : null)
//                               : (pickedFile != null ? FileImage(File(pickedFile!.path)) : null);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => HomePage(
//                                 name: name,
//                                 imageProvider: finalImage,
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white
//                         ),
//                         child: Text("Sign Up", style: TextStyle(color: Colors.black87),),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }