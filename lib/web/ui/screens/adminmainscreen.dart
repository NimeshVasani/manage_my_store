import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  final List<String> options = [
    'Add Items',
    'Item Stocks',
    'New Orders',
    'Return Items',
    'Emails',
    'Income/Outgoing',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/admin_avatar.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Admin User',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Add Items'),
              onTap: () {
                // Handle Add Items
              },
            ),
            ListTile(
              title: Text('Item Stocks'),
              onTap: () {
                // Handle Item Stocks
              },
            ),
            ListTile(
              title: Text('New Orders'),
              onTap: () {
                // Handle New Orders
              },
            ),
            ListTile(
              title: Text('Return Items'),
              onTap: () {
                // Handle Return Items
              },
            ),
            ListTile(
              title: const Text('Emails'),
              onTap: () {
                // Handle Emails
              },
            ),
            ListTile(
              title: const Text('Income/Outgoing'),
              onTap: () {
                // Handle Income/Outgoing
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Handle Logout
               // FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Admin Panel Content'),
      ),
    );
  }
}