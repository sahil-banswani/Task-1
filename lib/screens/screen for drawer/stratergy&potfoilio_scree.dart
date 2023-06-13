import 'package:flutter/material.dart';

class StrategyScreen extends StatelessWidget {
  const StrategyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
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
              Tab(
                child: Text(
                  'Revenue',
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
            Center(
              child: Text('Revenue'),
            ),
          ],
        ),
      ),
    );
  }
}
