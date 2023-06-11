import 'package:flutter/material.dart';
// import 'package:nodejs/components/rounded_button.dart';
import 'package:http/http.dart' as http;

import '../widgets/rounded_button.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var mytext = true;
  bool loading = false;

  bool myfunction() {
    return !mytext;
  }

  bool isSecure = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final name = TextEditingController();
  final mobNo = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    mobNo.dispose();
    name.dispose();
    super.dispose();
  }

  signup() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blueAccent,
        content: Text(
          'Sign in Successfully',
          style: TextStyle(fontSize: 15.0, color: Colors.white),
        ),
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void registration() async {}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Life Coach'),
        centerTitle: true,
        // backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.indigo,
          child: const Padding(
            padding: EdgeInsets.only(top: 55.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assests/images/logo.png'),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Dignity\nof\nNoble',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 30), // Adjust the top padding as needed
        child: SingleChildScrollView(
          child: Column(
            //resizeToAvoidBottomPadding: false,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'SIGNUP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldOr('Name'),
                    TextFieldOr('Email'),
                    TextFieldOr('Mobile No.'),
                    TextFieldOr('Enter Password'),
                    TextFieldOr('Confirm Password'),
                    
                  ],
                ),
              ),
              RoundedButton(
                text: "Signup",
                press: () async {
                  setState(() {
                    loading = true;
                  });
                  if (_formKey.currentState!.validate()) {
                    await signup();
                  }
                  setState(() {
                    loading = false;
                  });
                },
                loading: loading,
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account?",
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tooglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecure = !isSecure;
        });
      },
      icon: isSecure
          ? const Icon(Icons.visibility_off_rounded)
          : const Icon(Icons.visibility_rounded),
      color: Colors.lightBlueAccent,
    );
  }

  Widget TextFieldOr(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        key: ValueKey(text.toString()),
        controller: emailController,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Please Enter your $text';
          } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@gmail\.com$').hasMatch(val)) {
            return 'Please enter a valid $text';
          }
          //return null;
          return null;
        },
        decoration: InputDecoration(
          icon: const Icon(
            Icons.person,
            color: Colors.grey,
          ),
          hintText: "Your $text",
          border: InputBorder.none,
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:nodejs/components/rounded_button.dart';
import 'package:nodejs/screens/login.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:nodejs/screens/user.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  Future save() async {
    var res = await http.post("http://localhost:8080/signup" as Uri,
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': user.email,
          'password': user.password
        });
    print(res.body);
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => const Signin()));
  }

  User user = User('', '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Text(
                      "Signup",
                      style: GoogleFonts.pacifico(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: TextEditingController(text: user.email),
                        onChanged: (value) {
                          user.email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter something';
                          } else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return null;
                          } else {
                            return 'Enter valid email';
                          }
                        },
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            hintText: 'Enter Email',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.blue)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.blue)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: TextEditingController(text: user.email),
                        onChanged: (value) {
                          user.email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter something';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.vpn_key,
                              color: Colors.blue,
                            ),
                            hintText: 'Enter Password',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.blue)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.blue)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(55, 16, 16, 0),
                      child: SizedBox(
                        height: 50,
                        width: 400,
                        child: RoundedButton(
                          text: "Signup",
                          press: () async {
                            if (_formKey.currentState!.validate()) {
                              await save();
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(95, 20, 0, 0),
                        child: Row(
                          children: [
                            const Text(
                              "Already have Account ? ",
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight
                                  .bold),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Signin()));
                              },
                              child: const Text(
                                "Signin",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
*/