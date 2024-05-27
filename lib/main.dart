import 'package:flutter/material.dart';
import 'package:rent/page/add_tenant_page.dart';
import 'package:rent/page/tenant_page.dart';

import 'page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: [
              const Text("Accueil"),
              const Text("Liste des locataires"),
              const Text("Add locataire")
            ][_currentIndex],
            backgroundColor: Colors.greenAccent),
        body: [
          const HomePage(),
          const TenantPage(),
          const AddTenantPage()
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.event_repeat), label: "Rents"),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "add Rent")
            ],
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            elevation: 10,
            currentIndex: _currentIndex,
            onTap: (index) => setCurrentIndex(index)),
      ),
    );
  }
}
