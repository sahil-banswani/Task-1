import 'package:flutter/material.dart';

class LifeCoachScreen extends StatelessWidget {
  const LifeCoachScreen({super.key});

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
                  'Client',
                ),
              ),
              Tab(
                child: Text(
                  'Business Contacts',
                ),
              ),
              Tab(
                child: Text(
                  'Compose Email',
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
              child: Text('Client'),
            ),
            Center(
              child: Text('Buissness contact'),
            ),
            Center(
              child: Text('Compose Email'),
            ),
          ],
        ),
      ),
    );
  }
}
