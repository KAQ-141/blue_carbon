import 'package:flutter/material.dart';

void main() {
  runApp(const NGOApp());
}

class NGOApp extends StatelessWidget {
  const NGOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NGO Field Officer',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),
    NewSurveyScreen(),
    ProjectsScreen(),
    WalletScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location_alt),
            label: 'New Survey',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
        ],
      ),
    );
  }
}

// ------------------- Dashboard Screen -------------------
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Surveys Uploaded: 12', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Carbon Credits Earned: 45', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

// ------------------- New Survey Screen -------------------
class NewSurveyScreen extends StatelessWidget {
  const NewSurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController speciesController = TextEditingController();
    final TextEditingController areaController = TextEditingController();
    final TextEditingController soilIdController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('New Survey')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.my_location),
                label: const Text('Capture GPS Location'),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt),
                label: const Text('Capture Photo'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: speciesController,
                decoration: const InputDecoration(labelText: 'Species'),
              ),
              TextField(
                controller: areaController,
                decoration: const InputDecoration(labelText: 'Area (sq.m)'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: soilIdController,
                decoration: const InputDecoration(labelText: 'Soil Sample ID'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Survey Submitted (Dummy)!')),
                  );
                },
                child: const Text('Submit Survey'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------- Projects Screen -------------------
class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> projects = [
      {'name': 'Mangrove Restoration', 'status': 'Pending'},
      {'name': 'Beach Plantation', 'status': 'Verified'},
      {'name': 'Wetland Cleanup', 'status': 'Credited'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(projects[index]['name']!),
              trailing: Chip(
                label: Text(projects[index]['status']!),
                backgroundColor: projects[index]['status'] == 'Pending'
                    ? Colors.orange.shade200
                    : projects[index]['status'] == 'Verified'
                        ? Colors.blue.shade200
                        : Colors.green.shade200,
              ),
            ),
          );
        },
      ),
    );
  }
}

// ------------------- Wallet Screen -------------------
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> creditHistory = [
      {'project': 'Mangrove Restoration', 'credits': 10},
      {'project': 'Beach Plantation', 'credits': 20},
      {'project': 'Wetland Cleanup', 'credits': 15},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Wallet')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total Credits: 45', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            const Text('Credit History:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: creditHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.monetization_on),
                    title: Text(creditHistory[index]['project']!),
                    trailing: Text('+${creditHistory[index]['credits']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}