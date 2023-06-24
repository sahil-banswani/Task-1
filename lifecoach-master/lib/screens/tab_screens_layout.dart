import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:convert';

import '../widgets/logoutbutton.dart';

class TabScreenLayout extends StatefulWidget {
  final int id;
  const TabScreenLayout({Key? key, this.id = 0}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TabScreenLayout> {
  List<String> responseData = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<List<Map<String, dynamic>>> lifeCoachRoutes() async {
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
      final routes = decodedData
          .map((data) => {
                'id': data['id'],
                'name': data['name'],
              })
          .toList();
      return routes;
    } catch (err) {
      print(err);
      return []; // Return an empty list in case of an error
    }
  }

  Future<void> fetchData() async {
    try {
      final uri = Uri.parse(
          'https://jobportal.techallylabs.com/api/v1/life-coach/top-nav/${widget.id}');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body) as List<dynamic>;
        final names =
            decodedData.map((data) => data['name'].toString()).toList();
        setState(() {
          responseData = names;
        });
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> refreshData(BuildContext context) async {
    // Call the fetchData method to retrieve the latest data
    await fetchData();
    await Future.delayed(const Duration(seconds: 2));
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
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => refreshData(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: SafeArea(
                child: Container(
                  color: Colors.blue, // Customize the color for the drawer
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: ListView(
                      children: [
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
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
                                const LogOutButton(),
                              ],
                            ),
                            const SizedBox(height: 30.0),
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
                            const SizedBox(height: 10.0),
                            SingleChildScrollView(
                              child: ListTile(
                                title: RefreshIndicator(
                                  onRefresh: () => refreshData(context),
                                  child:
                                      FutureBuilder<List<Map<String, dynamic>>>(
                                    future: lifeCoachRoutes(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      } else if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      } else {
                                        final routes = snapshot.data;
                                        return Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: routes!
                                                .map(
                                                  (route) => GestureDetector(
                                                    onTap: () {
                                                      final id = route['id'];
                                                      final name =
                                                          route['name'];
                                                      print('ID: $id');
                                                      print('Name: $name');
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              TabScreenLayout(
                                                                  id: id),
                                                        ),
                                                      );
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 8.0),
                                                      child: Text(
                                                        route['name'],
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        );
                                      }
                                    },
                                  ),
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
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: responseData.isEmpty
                    ? const Center(
                        child: Text('No data available'),
                      )
                    : SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: DefaultTabController(
                          length: responseData.length,
                          child: Column(
                            children: [
                              TabBar(
                                isScrollable:
                                    true, // Enable horizontal scrolling
                                tabs: responseData
                                    .map(
                                      (name) => Tab(
                                        child: Container(
                                          alignment: Alignment.center,
                                          constraints:
                                              const BoxConstraints.expand(
                                                  width: 150),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE6ECF9),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Text(
                                            name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF265DD1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onTap: (index) {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
