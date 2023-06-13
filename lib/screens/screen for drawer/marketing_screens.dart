import 'package:flutter/material.dart';

class MarketingScreen extends StatelessWidget {
  const MarketingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Life Coach',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Notification',
                ),
              ),
              Tab(
                child: Text(
                  'Sent Email',
                ),
              ),
              Tab(
                child: Text(
                  'Contacts',
                ),
              ),
              Tab(
                child: Text(
                  'Potfoilio',
                ),
              ),
              Tab(
                child: Text(
                  'Compose Email',
                ),
              ),
              Tab(
                child: Text(
                  'Introductory Email',
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Notification'),
            ),
            Center(
              child: Text('Send Email'),
            ),
            Center(
              child: Text('Contact'),
            ),
            Center(
              child: Text('Potfolio'),
            ),
            Center(
              child: Text('Compose Email'),
            ),
            Center(
              child: Text('Introductory Email'),
            ),
          ],
        ),
      ),
    );
  }
}
