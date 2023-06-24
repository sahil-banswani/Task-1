// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:cookie_jar/cookie_jar.dart';
// import 'dart:convert';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:life_coach/screens/login.dart';

// class Home extends StatelessWidget {
//   Home({super.key});
//   Future<List<String>> lifeCoachRoutes() async {
//     try {
//       final cookieJar = CookieJar();
//       final uri = Uri.parse(
//           'https://jobportal.techallylabs.com/api/v1/life-coach/life-coach-routes');
//       final request = http.Request('GET', uri);
//       final cookies = await cookieJar.loadForRequest(uri);
//       Cookie? token;

//       for (final cookie in cookies) {
//         if (cookie.name == 'jwt_token') {
//           token = cookie;
//           break;
//         }
//       }

//       if (token != null) {
//         request.headers['Authorization'] = 'Bearer ${token.value}';
//       }
//       request.headers['Content-Type'] = 'application/json';

//       final response = await request.send();
//       final responseData = await response.stream.bytesToString();
//       final decodedData = jsonDecode(responseData) as List<dynamic>;
//       final names = decodedData.map((data) => data['name'] as String).toList();
//       return names;
//     } catch (err) {
//       print(err);
//       return []; // Return an empty list in case of an error
//     }
//   }

//   //refrece data code
//   // Future<void> _refreshData(BuildContext context) async {
//   //   // Wait for a short duration to simulate a refresh delay
//   //   await Future.delayed(const Duration(seconds: 2));
//   //   final url = Uri.parse(
//   //       'https://jobportal.techallylabs.com/api/v1/life-coach/life-coach-routes');
//   //   final response = await http.get(url);

//   //   if (response.statusCode == 200) {
//   //     final cookieJar = CookieJar();
//   //     final uri = Uri.parse(
//   //         'https://jobportal.techallylabs.com/api/v1/life-coach/life-coach-routes');
//   //     final request = http.Request('GET', uri);
//   //     final cookies = await cookieJar.loadForRequest(uri);
//   //     Cookie? token;

//   //     for (final cookie in cookies) {
//   //       if (cookie.name == 'jwt_token') {
//   //         token = cookie;
//   //         break;
//   //       }
//   //     }

//   //     if (token != null) {
//   //       request.headers['Authorization'] = 'Bearer ${token.value}';
//   //     }
//   //     request.headers['Content-Type'] = 'application/json';

//   //     final response = await request.send();
//   //     final responseData = await response.stream.bytesToString();
//   //     final decodedData = jsonDecode(responseData) as List<dynamic>;
//   //     final names = decodedData.map((data) => data['name'] as String);
//   //     return names;

//   //   }
//   //   // ignore: use_build_context_synchronously
//   //   ScaffoldMessenger.of(context).showSnackBar(
//   //     const SnackBar(
//   //       content: Text(
//   //         'Data Refreshed',
//   //         style: TextStyle(
//   //           fontWeight: FontWeight.bold,
//   //         ),
//   //       ),
//   //       backgroundColor: Colors.blue,
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final advancedDrawerController = AdvancedDrawerController();

//     void _handleMenuButtonPressed() {
//       // NOTICE: Manage Advanced Drawer state through the Controller.
//       // _advancedDrawerController.value = AdvancedDrawerValue.visible();
//       advancedDrawerController.showDrawer();
//     }

//     return AdvancedDrawer(
//       backdrop: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Colors.blue, const Color(0xFF263DDE).withOpacity(0.2)],
//           ),
//         ),
//       ),
//       controller: advancedDrawerController,
//       animationCurve: Curves.easeInOut,
//       animateChildDecoration: true,
//       rtlOpening: false,
//       disabledGestures: false,
//       childDecoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(
//           Radius.circular(30),
//         ),
//       ),
//       drawer: SafeArea(
//         child: ListTileTheme(
//           child: Align(
//             alignment: Alignment.topLeft,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ClipOval(
//                       child: Container(
//                         color: Colors.transparent,
//                         width: 100.0,
//                         height: 100.0,
//                         child: Image.asset(
//                           'assets/images/logo.png',
//                           width: 100.0,
//                           height: 100.0,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20.0),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const LoginScreen()));
//                       },
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(15.0),
//                         child: Material(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             side: const BorderSide(
//                               color: Colors.indigo,
//                               width: 1.0,
//                             ),
//                           ),
//                           child: Container(
//                             width: 110.0,
//                             height: 40.0,
//                             decoration: const BoxDecoration(
//                               color: Colors.indigo,
//                             ),
//                             child: const Center(
//                               child: Text(
//                                 'LOGOUT',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 40.0),
//                 Container(
//                   height: 1.0,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     border: Border(
//                       top: BorderSide(
//                         color: Colors.black,
//                         width: 1.0,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 ListTile(
//                   title: FutureBuilder<List<String>>(
//                     future: lifeCoachRoutes(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const CircularProgressIndicator();
//                       } else if (snapshot.hasError) {
//                         return Text('Error: ${snapshot.error}');
//                       } else {
//                         final names = snapshot.data;
//                         return Align(
//                           alignment: Alignment.centerLeft,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: names!
//                                 .map((name) => GestureDetector(
//                                       onTap: () {},
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             vertical: 8.0),
//                                         child: Text(
//                                           name,
//                                           style: const TextStyle(
//                                               fontSize: 20,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                     ))
//                                 .toList(),
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Home'),
//           leading: IconButton(
//             onPressed: _handleMenuButtonPressed,
//             icon: ValueListenableBuilder<AdvancedDrawerValue>(
//               valueListenable: advancedDrawerController,
//               builder: (_, value, __) {
//                 return AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 250),
//                   child: Icon(
//                     value.visible ? Icons.clear : Icons.menu,
//                     key: ValueKey<bool>(value.visible),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         body: RefreshIndicator(
//           onRefresh: () => lifeCoachRoutes(),
//           child: ListView(
//             children: const [
//               Padding(padding: EdgeInsets.only(top: 150.0)),
//               Center(
//                 child: Text(
//                   "DASHBOARD",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:convert';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:life_coach/screens/login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AdvancedDrawerController advancedDrawerController;

  @override
  void initState() {
    super.initState();
    advancedDrawerController = AdvancedDrawerController();
  }

  Future<List<String>> lifeCoachRoutes() async {
    try {
      final cookieJar = CookieJar();
      final uri = Uri.parse(
          'https://jobportal.techallylabs.com/api/v1/life-coach/life-coach-routes');
      final request = http.Request('GET', uri);
      final cookies = await cookieJar.loadForRequest(uri);
      Cookie? token;

      for (final cookie in cookies) {
        if (cookie.name == 'jwt_token') {
          token = cookie;
          break;
        }
      }

      if (token != null) {
        request.headers['Authorization'] = 'Bearer ${token.value}';
      }
      request.headers['Content-Type'] = 'application/json';

      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final decodedData = jsonDecode(responseData) as List<dynamic>;
      final names = decodedData.map((data) => data['name'] as String).toList();
      return names;
    } catch (err) {
      // ignore: avoid_print
      print(err);
      return []; // Return an empty list in case of an error
    }
  }

  Future<void> _refreshData(BuildContext context) async {
    // Wait for a short duration to simulate a refresh delay
    await Future.delayed(
      const Duration(seconds: 2),
    );
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Data Refreshed',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
    );
    setState(() {}); // Refresh the widget state after data is refreshed
  }

  List<int> ids = [8, 10, 11, 12, 13, 14, 15];

  void _handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _refreshData(context),
      child: AdvancedDrawer(
        backdrop: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, const Color(0xFF263DDE).withOpacity(0.2)],
            ),
          ),
        ),
        controller: advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        drawer: SafeArea(
          child: ListTileTheme(
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Container(
                          color: Colors.transparent,
                          width: 100.0,
                          height: 100.0,
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: const BorderSide(
                                color: Colors.indigo,
                                width: 1.0,
                              ),
                            ),
                            child: Container(
                              width: 110.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                color: Colors.indigo,
                              ),
                              child: const Center(
                                child: Text(
                                  'LOGOUT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  Container(
                    height: 1.0,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ListTile(
                    title: FutureBuilder<List<String>>(
                      future: lifeCoachRoutes(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final names = snapshot.data;
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: names!
                                  .map((name) => GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => SubModule(
                                          //       subModule: names,
                                          //     ),
                                          //   ),
                                          // );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            name,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
          ),
          body: ListView(
            children: const [
              Padding(padding: EdgeInsets.only(top: 150.0)),
              Center(
                child: Text(
                  "DASHBOARD",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
