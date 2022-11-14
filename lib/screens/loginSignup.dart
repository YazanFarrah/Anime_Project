import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../providers/auth.dart';
import '../widgets/widgets.dart';
import '../screens/screens.dart';

class MyLogin extends StatefulWidget {
  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  // @override
  @override
  Widget build(BuildContext context) {
    bool _isVisible = true;

    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context),
        borderRadius: BorderRadius.circular(20.0));
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              padding: deviceSize.width > webScreenSize
                  ? EdgeInsets.symmetric(horizontal: deviceSize.width / 3)
                  : const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //name image
                  const SizedBox(height: 64),

                  Text(
                    'Name',
                    style: GoogleFonts.lobster(
                        fontSize: 60, color: const Color(0xff2E99C7)),
                  ),
                  const SizedBox(height: 64),

                  //text field input for email

                  TextFieldInput(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter email or username';
                        }
                      },
                      textEditingController: _emailController,
                      hintText: 'Username or email',
                      textInputType: TextInputType.emailAddress),

                  const SizedBox(
                    height: 20,
                  ),

                  //text field input for password

                  TextFieldInput(
                    textInputType: TextInputType.text,
                    textEditingController: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please your enter password';
                      }
                      return null;
                    },
                    isPass: true,
                    hintText: 'Enter your password',
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //login button

                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Log in',
                          style: GoogleFonts.lobster(
                              fontSize: 40, color: const Color(0xff2E99C7)),
                        ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xff2E99C7),
                          child: Provider.of<Auth>(context).isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : IconButton(
                                  color: Colors.white,
                                  onPressed: () =>
                                      Provider.of<Auth>(context, listen: false)
                                          .authinticate(
                                              context,
                                              _formKey,
                                              _emailController,
                                              _passwordController),
                                  // navPushReplacement(context, MyLogin()),

                                  icon: const Icon(
                                    Icons.arrow_forward,
                                  )),
                        ),
                      ],
                    ),
                  ),

                  //forgot password button
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xff4c505b),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  // Flexible(child: Container(), flex: 2),

                  //already have an account?

                  const SizedBox(height: 100),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                          "Don't have an acoount?",
                          style: TextStyle(
                            color: Color(0xff4c505b),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: TextButton(
                          // onLongPress: _switchAuthMode,
                          onPressed: () {
                            _openPopup(context);
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                color: Color(0xff2E99C7),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _openPopup(context) {
  final deviceSize = MediaQuery.of(context).size;
  showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    context: context,
    builder: (context) => SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Sign up',
                  style: GoogleFonts.lobster(
                    fontSize: 60.0,
                    color: const Color(0xff2E99C7),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              SizedBox(
                width: deviceSize.width * 0.8,
                height: 50,
                child: TextButton.icon(
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF2E99C7),
                        elevation: 8.0),
                    onPressed: () =>
                        navPushReplacement(context, SignUpScreen()),
                    icon: const Icon(Icons.person_outline, color: Colors.white),
                    label: const Text(
                      'Sign up with email',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('OR'),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: deviceSize.width * 0.8,
                height: 50,
                child: TextButton.icon(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.only(left: 20),
                        elevation: 8.0),
                    onPressed: () {},
                    icon: const Icon(Icons.facebook, color: Colors.blue),
                    label: const Text(
                      'Sign up with Facebook',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: deviceSize.width * 0.8,
                height: 50,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white, elevation: 8.0),
                  onPressed: () {},
                  icon: const Icon(Icons.apple, color: Colors.black),
                  label: const Text(
                    'Sign up with Apple',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: deviceSize.width * 0.8,
                height: 50,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white, elevation: 8.0),
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.green,
                  ),
                  label: const Text(
                    'Sign up with google',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: deviceSize.width * 0.8,
                height: 50,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white, elevation: 8.0),
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.twitter,
                    color: Colors.blue,
                  ),
                  label: const Text(
                    'Sign up with twitter',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Color(0xff4c505b),
                    fontSize: 18,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      color: Color(0xff2E99C7),
                      fontSize: 18,
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    ),
  );
}
