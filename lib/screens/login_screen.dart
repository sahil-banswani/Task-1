import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formfield = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final formfield = GlobalKey<FormState>();
    final emailcontroller = TextEditingController();
    final passwordController = TextEditingController();
    bool passToggle = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Life Coach'),
        centerTitle: true,
        // backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 120,
                      height: 175,
                      child: DrawerHeader(
                        decoration: const BoxDecoration(color: Colors.blue),
                        //logo
                        child: Image.asset(
                          'assests/images/logo.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'Dignity of Nobel',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                const Divider(),
                //other pages
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: ListTile(
                            selectedTileColor: Colors.grey[800],
                            leading: const Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            title: const Text(
                              'Home',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: ListTile(
                            splashColor: Colors.grey[400],
                            selectedTileColor: Colors.grey[800],
                            leading: const Icon(
                              Icons.info,
                              color: Colors.black,
                            ),
                            title: const Text(
                              'About',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: ListTile(
                        selectedTileColor: Colors.grey[800],
                        leading: Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        title: Text(
                          'Log Out',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 60,
            vertical: 20,
          ),
          child: Form(
            key: formfield,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 150),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailcontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Enter your email',
                        ),
                        validator: (value) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.azA-Z0-9.!#$%&*+-/=?^_`{|}+@[a-zA-z)-9]+\.[a-zA-Z]+]")
                              .hasMatch(value!);
                          if (value.isEmpty) {
                            return "Enter Email";
                          } else if (emailValid) {
                            return 'Enter Valid Email';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        obscureText: passToggle,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock),
                          hintText: 'Enter your password',
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passToggle = !passToggle;
                              });
                            },
                            child: Icon(passToggle
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter the password";
                          } else if (passwordController.text.length < 8) {
                            return "Password Length Should be more than 8 Character";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          if (formfield.currentState!.validate()) {
                            print('Success');
                            emailcontroller.clear();
                            passwordController.clear();
                          }
                        },
                        child: Container(
                          height: 50,
                          // width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue[600],
                          ),
                          child: const Center(
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Already have an Account?',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Sign up',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
