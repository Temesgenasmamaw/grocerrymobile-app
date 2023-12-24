import 'package:flutter/material.dart';
import 'package:groccery_app/screens/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorText = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            height: size.height * 0.45,
            width: size.width,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.35,
            height: size.height * 0.65,
            width: size.width,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 250, 246, 246),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36.0),
                  topRight: Radius.circular(36.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sign In",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            hintText: ' Username: 929040099',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            errorText: _errorText.isNotEmpty &&
                                    _usernameController.text.isEmpty
                                ? 'Username is required'
                                : null,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: '123456',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
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
                            errorText: _errorText.isNotEmpty &&
                                    _passwordController.text.isEmpty
                                ? 'Password is required'
                                : null,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _signIn();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor: Colors.orangeAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _signIn() {
    if (_usernameController.text == '929040099' &&
        _passwordController.text == '123456') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              title: '',
            ),
          ));
    } else {
      setState(() {
        _errorText = 'Invalid username or password';
      });
    }
  }
}
