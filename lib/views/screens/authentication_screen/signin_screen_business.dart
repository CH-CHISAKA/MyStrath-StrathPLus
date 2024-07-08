// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystrath_strathplus/controllers/authentication_controller.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/main_screen.dart';

class SigninScreenBusiness extends StatefulWidget {
  const SigninScreenBusiness({super.key});

  @override
  _SigninScreenBusinessState createState() => _SigninScreenBusinessState();
}

class _SigninScreenBusinessState extends State<SigninScreenBusiness> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  final AuthController _authController = AuthController();

  String id = '';
  String password = '';

  bool _isLoading = false;

  loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String result = await _authController.loginUser(id, password);

    if (result == "success") {
      /// Go To The Main Screen
      /// 
      Future.delayed(Duration.zero, () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return  const MainScreen();
        }));

        // Logged in Message
        ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Logged in'),));
      });
      print('Logged in');
    } else {
      setState(() {
        _isLoading = false;
      });
       Future.delayed(Duration.zero, (){
    ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content:Text(result)));
  });
    }
  }

          // registerUser() async {
          //   String result = await _authController.registerNewUser(id, password);
          //   if (result == 'success') {}
          // }

// Method to handle form submission
  void _submitForm() async {
    // Validate the form fields and show error messages if any
    if (_formKey.currentState!.validate()) {
      // If all fields are valid, register the user
      String result = await _authController.registerNewUser(
        id,
        password,
      );

      if (result == "success") {
        // Registration successful, do something (navigate to another screen, etc.)
        print('User registration successful!');
      } else {
        // Registration failed, handle error
        print('User registration failed.');
      }
    } else {
      // If any field is invalid, print a failure message
      print('Login Failed. Check Your Business ID or Password');
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: SingleChildScrollView(
        // Wrap content in SingleChildScrollView - making the screen scrollable
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              // Assign the form key to the Form widget
              key: _formKey,
              // Set autovalidateMode to onUserInteraction to show validation messages only after user interaction
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                // Aligning to center
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                      height:
                          150), // Add spacing to prevent overlap with status bar
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
                      "Create Your Business Account",
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
                      setState(() {
                        id = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Business Email';
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
                      labelText: 'Business Id...',
                      labelStyle: GoogleFonts.getFont(
                        "Nunito Sans",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        letterSpacing: 0.1,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/icons/business_id_icon.png',
                          height: 24,
                          width: 24,
                        ),
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
                      setState(() {
                        password = value;
                      });
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
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
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

                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      onTap: () {
                        loginUser();
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
                              child: _isLoading ? const CircularProgressIndicator(
                                color: Colors.white,
                              ):
                              Text(
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
                  // You can add more widgets here as needed
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
