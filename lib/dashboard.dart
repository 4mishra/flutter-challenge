import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard")
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color:Colors.black54),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_outlined, color:Colors.black54),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
            backgroundColor: Color(0xff3e4685),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money, color:Colors.black54),
            label: 'Buy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color:Colors.black54),
            label: 'Profile',
          ),
        ]
      )
    );
  }
}
