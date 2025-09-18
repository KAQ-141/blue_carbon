import 'package:flutter/material.dart';
import 'login_page.dart';
import 'NGO_screen.dart';
import 'admin_screen.dart';
import 'investor_screen.dart';
import 'splash_screen.dart';

void main() {
  runApp(const CarbonApp());
}

class CarbonApp extends StatelessWidget {
  const CarbonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: const SplashScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sections = [
      {"title": "NGO / Community", "icon": Icons.nature_people, "color": Colors.green, "route": "/ngo"},
      {"title": "Admin", "icon": Icons.admin_panel_settings, "color": Colors.orange, "route": "/admin"},
      {"title": "Public Viewer", "icon": Icons.public, "color": Colors.blue, "route": "/viewer"},
      {"title": "About App", "icon": Icons.info, "color": Colors.purple, "route": "/about"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Blue Carbon MRV", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 2,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe6f7f1), Color(0xFFc8f0e2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.95,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: sections.length,
          itemBuilder: (context, index) {
            final section = sections[index];
            return _buildGlassTile(context, section);
          },
        ),
      ),
    );
  }

  Widget _buildGlassTile(BuildContext context, Map<String, dynamic> section) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, section["route"]),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              section["color"].withOpacity(0.8),
              section["color"].withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: section["color"].withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(4, 6),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(section["icon"], size: 50, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              section["title"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
