import 'package:flutter/material.dart';

class LeadershipScreen extends StatelessWidget {
  const LeadershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'LEADERSHIP & ADMINISTRATION',
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  color: const Color.fromARGB(255, 10, 69, 171),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        child: const Icon(Icons.person),
                      ),
                      const Column(
                        children: [
                          Text('MANAGING'),
                          Text('CLIENT PARTNER'),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  color: const Color.fromARGB(255, 10, 69, 171),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        child: const Icon(Icons.person),
                      ),
                      const Column(
                        children: [
                          Text('STRATEGIC'),
                          Text('CLIENT PARTNER'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'BOTTOM UP HIERARCHY CARRER PROGRESSION',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
