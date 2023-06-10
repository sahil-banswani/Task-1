// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final formfield = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     final formfield = GlobalKey<FormState>();
//     final emailcontroller = TextEditingController();
//     final passwordController = TextEditingController();
//     bool passToggle = true;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Life Coach'),
//         centerTitle: true,
//         // backgroundColor: Colors.blue,
//       ),
//       drawer: Drawer(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 120,
//                       height: 175,
//                       child: DrawerHeader(
//                         decoration: const BoxDecoration(color: Colors.blue),
//                         //logo
//                         child: Image.asset(
//                           'assests/images/logo.png',
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     const Text(
//                       'Dignity of Nobel',
//                       style: TextStyle(
//                         fontSize: 20,
//                       ),
//                     )
//                   ],
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                 ),
//                 const Divider(),
//                 //other pages
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 25),
//                           child: ListTile(
//                             selectedTileColor: Colors.grey[800],
//                             leading: const Icon(
//                               Icons.home,
//                               color: Colors.black,
//                             ),
//                             title: const Text(
//                               'Home',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 25),
//                           child: ListTile(
//                             splashColor: Colors.grey[400],
//                             selectedTileColor: Colors.grey[800],
//                             leading: const Icon(
//                               Icons.info,
//                               color: Colors.black,
//                             ),
//                             title: const Text(
//                               'About',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 25),
//                       child: ListTile(
//                         selectedTileColor: Colors.grey[800],
//                         leading: Icon(
//                           Icons.logout,
//                           color: Colors.black,
//                         ),
//                         title: Text(
//                           'Log Out',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),

//       // ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 60,
//             vertical: 20,
//           ),
//           child: Form(
//             key: formfield,
//             child: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(top: 150),
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     // mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         'Login',
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold,
//                             fontStyle: FontStyle.normal),
//                       ),
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.emailAddress,
//                         controller: emailcontroller,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           prefixIcon: Icon(Icons.email),
//                           hintText: 'Enter your email',
//                         ),
//                         validator: (value) {
//                           bool emailValid = RegExp(
//                                   r"^[a-zA-Z0-9.azA-Z0-9.!#$%&*+-/=?^_`{|}+@[a-zA-z)-9]+\.[a-zA-Z]+]")
//                               .hasMatch(value!);
//                           if (value.isEmpty) {
//                             return "Enter Email";
//                           } else if (emailValid) {
//                             return 'Enter Valid Email';
//                           }
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.visiblePassword,
//                         controller: passwordController,
//                         obscureText: passToggle,
//                         decoration: InputDecoration(
//                           border: const OutlineInputBorder(),
//                           prefixIcon: const Icon(Icons.lock),
//                           hintText: 'Enter your password',
//                           suffixIcon: InkWell(
//                             onTap: () {
//                               setState(() {
//                                 passToggle = !passToggle;
//                               });
//                             },
//                             child: Icon(passToggle
//                                 ? Icons.visibility
//                                 : Icons.visibility_off),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Enter the password";
//                           } else if (passwordController.text.length < 8) {
//                             return "Password Length Should be more than 8 Character";
//                           }
//                         },
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           if (formfield.currentState!.validate()) {
//                             print('Success');
//                             emailcontroller.clear();
//                             passwordController.clear();
//                           }
//                         },
//                         child: Container(
//                           height: 50,
//                           // width: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.blue[600],
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'Log In',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           const Text(
//                             'Already have an Account?',
//                             style: TextStyle(
//                               fontSize: 17,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           TextButton(
//                             onPressed: () {},
//                             child: const Text(
//                               'Sign up',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:life_coach/screens/sign_up_screen.dart';
// import 'package:nodejs/widgets/rounded_button.dart';
// import 'package:http/http.dart' as http;

import '../widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var mytext = true;
  bool loading = false;

  bool myfunction() {
    return !mytext;
  }

  bool isSecure = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  signup() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blueAccent,
        content: Text(
          'Login in Successfully',
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
          height: 200,
          width: MediaQuery.of(context).size.width,
          // color: const Color.fromRGBO(63, 81, 181, 1),
          color: Colors.blue[900],
          child: const Padding(
            padding: EdgeInsets.only(top: 55.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assests/images/logo.png'),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Dignity of Noble',
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
      body: Container(
        padding:
            const EdgeInsets.only(top: 30), // Adjust the top padding as needed
        child: SingleChildScrollView(
          child: Column(
            //resizeToAvoidBottomPadding: false,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assests/images/logo.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextFormField(
                        key: const ValueKey('email'),
                        controller: emailController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please Enter your Email';
                          } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@gmail\.com$')
                              .hasMatch(val)) {
                            return 'Please enter a valid email address';
                          }
                          //return null;
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          hintText: "Your Email",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextFormField(
                        key: const ValueKey('Password'),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Password';
                          } else if (value.length < 6) {
                            return 'Password should be of 6 characters';
                          }
                          return null;
                        },
                        obscureText: isSecure,
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          hintText: "Your Password",
                          border: InputBorder.none,
                          suffixIcon: tooglePassword(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RoundedButton(
                text: "Login",
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
                    "Don't have an Account?",
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignupScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
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
}
