import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystrath_strathplus/controllers/authentication_controller.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key}); 

  @override
  // ignore: library_private_types_in_public_api
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  final AuthController _authController = AuthController();

  String id = '';
  String password = '';

  void _submitForm() async {
    // Validate the form fields and show error messages if any
    if (_formKey.currentState!.validate()) {
      try {
        // Attempt to register the new user
        await _authController.registerNewUser(id, password);
        // Show success message or navigate to another screen
        print('Registration successful');
      } catch (e) {
        // Handle registration error
        print('Registration failed: $e');
      }
    } else {
      // If any field is invalid, print a failure message
      print('Login Failed. Check Your Admission Number or Password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 150), // Add spacing to prevent overlap with status bar
                  // Welcome Message
                  Center(
                    child: Text(
                      "WELCOME",
                      style: GoogleFonts.getFont(
                        'Nunito Sans',
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                  ),

                  // Create Account Message
                  Center(
                    child: Text(
                      "Create Your Account",
                      style: GoogleFonts.getFont(
                        'Lato',
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  // Display logo
                  Center(
                    child: Image.asset(
                      'assets/images/LOGOLT.png',
                      height: 150,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Enter Details Text
                  Text(
                    "Enter Details",
                    style: GoogleFonts.getFont(
                      'Nunito Sans',
                      color: const Color.fromARGB(255, 0, 0, 0), // Text Colour
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      letterSpacing: 0.2,
                    ),
                  ),

                  const SizedBox(height: 3),

                  // Input Text field
                  TextFormField(
                    onChanged: (value) {
                      id = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Admission Number';
                      } else {
                        return null;
                      }
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFD9D9D9),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Admission Number',
                      labelStyle: GoogleFonts.getFont(
                        "Nunito Sans",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        letterSpacing: 0.1,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/icons/admission_icon.png'),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Enter Password
                  Text(
                    "Password",
                    style: GoogleFonts.getFont(
                      'Nunito Sans',
                      color: Colors.black, // Text colour
                      fontSize: 20,
                      letterSpacing: 0.2,
                    ),
                  ),

                  const SizedBox(height: 3),

                  // Password Input Field
                  TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: !_isPasswordVisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      } else {
                        return null;
                      }
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFD9D9D9),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Enter Password',
                      labelStyle: GoogleFonts.getFont(
                        "Nunito Sans",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        letterSpacing: 0.1,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/icons/lock_icon.png'),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),

                  // Creating Sign Up Button
                  const SizedBox(height: 35),

                  InkWell(
                    onTap: () {
                      // Call the form submission method when the button is pressed
                      _submitForm();
                    },
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFF8AC23),
                            Color(0xFFDC9F31),
                            Color(0xFFBA9553),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 10,
                            top: 19,
                            child: Opacity(
                              opacity: 0.4,
                              child: Container(
                                width: 60,
                                height: 60,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 10,
                                    color: const Color(0xFFF8AC23),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: Opacity(
                              opacity: 0.5,
                              child: Container(
                                width: 10,
                                height: 10,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: const Color(0xFFDC9F31),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 5,
                            child: Opacity(
                              opacity: 0.5,
                              child: Container(
                                width: 15,
                                height: 15,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 20,
                                    color: const Color(0xFFDC9F31),
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'SIGN IN',
                              style: GoogleFonts.getFont(
                                'Nunito Sans',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1,
                          color: const Color(0xFFA77C37),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20), // Add spacing at the bottom
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}