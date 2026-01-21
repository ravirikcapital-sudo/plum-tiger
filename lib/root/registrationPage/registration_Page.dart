import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'password_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController mobilecontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();

  String? selectedGender;
  XFile? _pickedFile;
  Uint8List? _webImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (kIsWeb) {
        var f = await pickedFile.readAsBytes();
        setState(() {
          _webImage = f;
        });
      }
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  void _nextPage() {
    if (_formKey.currentState!.validate()) {
      if (selectedGender == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select gender")),
        );
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PasswordPage(
            pickedFile: _pickedFile,
            webImage: _webImage,
            name: namecontroller.text,
            email: emailcontroller.text,
            mobile: mobilecontroller.text,
            city: citycontroller.text,
            gender: selectedGender!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider? imageProvider;
    if (kIsWeb && _webImage != null) {
      imageProvider = MemoryImage(_webImage!);
    } else if (!kIsWeb && _pickedFile != null) {
      imageProvider = FileImage(File(_pickedFile!.path));
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF20C3AF), Color(0xFF35A8E0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 600,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Text("Register Here", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: imageProvider,
                            child: imageProvider == null
                                ? const Icon(Icons.add_a_photo, size: 30, color: Colors.black54)
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          _pickedFile == null ? "Upload Profile" : "Profile uploaded",
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(controller: namecontroller, label: "Name", icon: Icons.person),
                      const SizedBox(height: 16),
                      _buildTextField(controller: emailcontroller, label: "Email", icon: Icons.email, validator: _emailValidator),
                      const SizedBox(height: 16),
                      _buildTextField(controller: mobilecontroller, label: "Mobile", icon: Icons.phone, inputType: TextInputType.phone),
                      const SizedBox(height: 16),
                      _buildTextField(controller: citycontroller, label: "City", icon: Icons.location_city),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.male),
                          Radio<String>(
                            value: 'Male',
                            groupValue: selectedGender,
                            onChanged: (value) => setState(() => selectedGender = value),
                          ),
                          const Text('Male'),
                          const SizedBox(width: 20),
                          const Icon(Icons.female),
                          Radio<String>(
                            value: 'Female',
                            groupValue: selectedGender,
                            onChanged: (value) => setState(() => selectedGender = value),
                          ),
                          const Text('Female'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          height: 40,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: _nextPage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: const Text(
                              "Next",
                              style: TextStyle(fontSize: 15, color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) return "*Email is required";
    if (!value.contains("@") || !value.contains(".")) return "Enter a valid email";
    return null;
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType inputType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: validator ?? (value) => value == null || value.trim().isEmpty ? "*Required" : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
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
        labelStyle: const TextStyle(color: Colors.black87),
      ),
    );
  }
}



// import 'dart:typed_data';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'password_page.dart';

// class RegistrationPage extends StatefulWidget {
//   const RegistrationPage({super.key});

//   @override
//   State<RegistrationPage> createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController namecontroller = TextEditingController();
//   final TextEditingController emailcontroller = TextEditingController();
//   final TextEditingController mobilecontroller = TextEditingController();
//   final TextEditingController citycontroller = TextEditingController();

//   String? selectedGender;
//   XFile? _pickedFile;
//   Uint8List? _webImage;

//   Future<void> _pickImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       if (kIsWeb) {
//         var f = await pickedFile.readAsBytes();
//         setState(() {
//           _webImage = f;
//         });
//       }
//       setState(() {
//         _pickedFile = pickedFile;
//       });
//     }
//   }

//   void _nextPage() {
//     if (_formKey.currentState!.validate()) {
//       if (selectedGender == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please select gender")),
//         );
//         return;
//       }

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) => PasswordPage(
//             pickedFile: _pickedFile,
//             webImage: _webImage,
//             name: namecontroller.text,
//             email: emailcontroller.text,
//             mobile: mobilecontroller.text,
//             city: citycontroller.text,
//             gender: selectedGender!,
//           ),
//         ),
//       );
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     ImageProvider? imageProvider;

//     if (kIsWeb && _webImage != null) {
//       imageProvider = MemoryImage(_webImage!);
//     } else if (!kIsWeb && _pickedFile != null) {
//       imageProvider = FileImage(File(_pickedFile!.path));
//     }

//     return Scaffold(
//       appBar: AppBar(title: const Text("Register")),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Text("Register Here", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),

//               const SizedBox(height: 20),
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: imageProvider,
//                   child: imageProvider == null
//                       ? Icon(Icons.add_a_photo, size: 30, color: Colors.grey)
//                       : null,
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(_pickedFile == null ? "Upload Profile" : "Profile uploaded"),

//               const SizedBox(height: 20),
//               _buildTextField(controller: namecontroller, label: "Name", icon: Icons.person),
//               const SizedBox(height: 16),
//               _buildTextField(controller: emailcontroller, label: "Email", icon: Icons.email, validator: _emailValidator),
//               const SizedBox(height: 16),
//               _buildTextField(controller: mobilecontroller, label: "Mobile", icon: Icons.phone, inputType: TextInputType.phone),
//               const SizedBox(height: 16),
//               _buildTextField(controller: citycontroller, label: "City", icon: Icons.location_city),

//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   const Icon(Icons.male),
//                   Radio<String>(
//                     value: 'Male',
//                     groupValue: selectedGender,
//                     onChanged: (value) => setState(() => selectedGender = value),
//                   ),
//                   const Text('Male'),
//                   const SizedBox(width: 20),
//                   const Icon(Icons.female),
//                   Radio<String>(
//                     value: 'Female',
//                     groupValue: selectedGender,
//                     onChanged: (value) => setState(() => selectedGender = value),
//                   ),
//                   const Text('Female'),
//                 ],
//               ),

//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _nextPage,
//                 child: const Text("Next"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   String? _emailValidator(String? value) {
//     if (value == null || value.isEmpty) return "*Email is required";
//     if (!value.contains("@") || !value.contains(".")) return "Enter a valid email";
//     return null;
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     TextInputType inputType = TextInputType.text,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: inputType,
//       validator: validator ?? (value) => value == null || value.trim().isEmpty ? "*Required" : null,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// import 'package:image_picker/image_picker.dart';
// import 'dart:io' if (dart.library.html) 'dart:html' as html;
// import 'dart:typed_data';
// import 'package:flutter/foundation.dart';
// import 'package:plum_tiger/root/registrationPage/password_page.dart';

// class RegistrationPage extends StatefulWidget {
//   const RegistrationPage({super.key});

//   @override
//   State<RegistrationPage> createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   XFile? _pickedFile;
//   Uint8List? _webImage;
//   String? _gender;
//   html.File? _imageFile;
//   final _formkey = GlobalKey<FormState>();
//   final TextEditingController namecontroller = TextEditingController();
//   final TextEditingController emailcontroller = TextEditingController();
//   final TextEditingController mobilecontroller = TextEditingController();
//   final TextEditingController citycontroller = TextEditingController();
//   final ImagePicker _picker = ImagePicker();

//   Future<void> _pickimage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//     if (pickedFile != null) {
//       if (kIsWeb) {
//         final bytes = await pickedFile.readAsBytes();
//         setState(() {
//           _webImage = bytes;
//           _pickedFile = pickedFile;
//         });
//       } else {
//         setState(() {
//           _pickedFile = pickedFile;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenwidth = MediaQuery.of(context).size.width;
//     ImageProvider? imageProvider;

//     if (kIsWeb && _webImage != null) {
//       imageProvider = MemoryImage(_webImage!);
//     } else if (!kIsWeb && _pickedFile != null) {
//       imageProvider = FileImage(html.File(_pickedFile!.path));
//     }

//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF20C3AF), Color(0xFF35A8E0)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 20, top: 20),
//             child: SizedBox(
//               width: 600,
//               child: Form(
//                 key: _formkey,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Align(
//                         alignment: Alignment.center,
//                         child: Text(
//                           "Register Here",
//                           style: TextStyle(
//                             fontSize: 35,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       Center(
//                         child: GestureDetector(
//                           onTap: () {
//                             _pickimage(ImageSource.gallery);
//                           },
//                           child: CircleAvatar(
//                             radius: 40,
//                             backgroundColor: Colors.grey[300],
//                             backgroundImage: imageProvider,
//                             child: imageProvider == null
//                                 ? Icon(
//                               Icons.add_a_photo,
//                               size: 30,
//                               color: Colors.black54,
//                             )
//                                 : null,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Center(
//                         child: Text(
//                           _pickedFile == null ? "Upload Profile" : "Profile uploaded",
//                           style: TextStyle(fontSize: 15),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller: namecontroller,
//                         keyboardType: TextInputType.name,
//                         style: TextStyle(color: Colors.black87),
//                         decoration: InputDecoration(
//                           errorStyle: TextStyle(color: Colors.red, fontSize: 15),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(100),
//                           ),
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
//                           labelText: "Name",
//                           labelStyle: TextStyle(color: Colors.black87),
//                           prefixIcon: Icon(Icons.person, color: Colors.black87),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return "*Name is required";
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller: emailcontroller,
//                         keyboardType: TextInputType.text,
//                         style: TextStyle(color: Colors.black87),
//                         decoration: InputDecoration(
//                           errorStyle: TextStyle(color: Colors.red, fontSize: 15),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(100),
//                           ),
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
//                           labelText: "Email Id",
//                           labelStyle: TextStyle(color: Colors.black87),
//                           prefixIcon: Icon(Icons.email, color: Colors.black87),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return "*Email is required";
//                           }
//                           if (!value.contains('@')) {
//                             return "please enter valid email";
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller: mobilecontroller,
//                         keyboardType: TextInputType.number,
//                         style: TextStyle(color: Colors.black87),
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(100),
//                           ),
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
//                           labelText: "Mobile No",
//                           labelStyle: TextStyle(color: Colors.black87),
//                           prefixIcon: Icon(Icons.phone, color: Colors.black87),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller: citycontroller,
//                         keyboardType: TextInputType.text,
//                         style: TextStyle(color: Colors.black87),
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(100),
//                           ),
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
//                           labelText: "City",
//                           labelStyle: TextStyle(color: Colors.black87),
//                           prefixIcon: Icon(Icons.location_city, color: Colors.black87),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       Row(
//                         children: [
//                           Icon(Icons.male, size: 20),
//                           Radio<String>(
//                             value: "Male",
//                             groupValue: _gender,
//                             onChanged: (value) {
//                               setState(() {
//                                 _gender = value;
//                               });
//                             },
//                             activeColor: Colors.black,
//                           ),
//                           Text("Male", style: TextStyle(fontSize: 20)),
//                           SizedBox(width: 20),
//                           Icon(Icons.female, size: 20),
//                           Radio<String>(
//                             value: "Female",
//                             groupValue: _gender,
//                             onChanged: (value) {
//                               setState(() {
//                                 _gender = value;
//                               });
//                             },
//                             activeColor: Colors.black,
//                           ),
//                           Text("Female", style: TextStyle(fontSize: 20)),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                       Center(
//                         child: SizedBox(
//                           height: 40,
//                           width: 120,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (_formkey.currentState!.validate()) {
//                                 if (_gender == null) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(content: Text("Please select gender")),
//                                   );
//                                   return;
//                                 }

//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (_) => PasswordPage(
//                                       pickedFile: _pickedFile,
//                                       webImage: _webImage,
//                                       name: namecontroller.text,
//                                     ),
//                                   ),
//                                 );
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text("Please fill the required fields")),
//                                 );
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white,
//                             ),
//                             child: Text(
//                               "Next",
//                               style: TextStyle(fontSize: 15, color: Colors.black87),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }