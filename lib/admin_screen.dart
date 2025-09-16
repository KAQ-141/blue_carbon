import 'package:flutter/material.dart';

class AdminApp extends StatefulWidget {
  const AdminApp({super.key});

  @override
  State<AdminApp> createState() => _AdminAppState();
}

class _AdminAppState extends State<AdminApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    PendingSurveysScreen(),
    AdminProjectsScreen(),
    CarbonRegistryScreen(),
    ReportsScreen(),
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
      drawer: const CommonDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pending_actions), label: 'Pending'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Projects'),
          BottomNavigationBarItem(icon: Icon(Icons.storage), label: 'Registry'),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Reports'),
        ],
      ),
    );
  }
}

// ------------------- Pending Surveys Screen -------------------
class PendingSurveysScreen extends StatelessWidget {
  const PendingSurveysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pending = [
      {'id': 'Survey-101', 'status': 'Waiting'},
      {'id': 'Survey-102', 'status': 'Waiting'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Pending Surveys')),
      drawer: const CommonDrawer(),
      body: ListView.builder(
        itemCount: pending.length,
        itemBuilder: (context, index) {
          final survey = pending[index];
          return Card(
            child: ListTile(
              title: Text(survey['id']!),
              subtitle: Text('Status: ${survey['status']}'),
              trailing: Wrap(
                spacing: 8,
                children: [
                  IconButton(icon: const Icon(Icons.check, color: Colors.green), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.close, color: Colors.red), onPressed: () {}),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ------------------- Projects Screen -------------------
class AdminProjectsScreen extends StatelessWidget {
  const AdminProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {'name': 'Mangrove Restoration', 'status': 'Approved'},
      {'name': 'Beach Plantation', 'status': 'Rejected'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('All Projects')),
      drawer: const CommonDrawer(),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return ListTile(
            title: Text(project['name']!),
            trailing: Chip(label: Text(project['status']!)),
          );
        },
      ),
    );
  }
}

// ------------------- Carbon Registry Screen -------------------
class CarbonRegistryScreen extends StatelessWidget {
  const CarbonRegistryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registry = [
      {'id': 'TX-1001', 'credits': 10},
      {'id': 'TX-1002', 'credits': 20},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Carbon Registry')),
      body: ListView.builder(
        itemCount: registry.length,
        itemBuilder: (context, index) {
          final entry = registry[index];
          return ListTile(
            title: Text('Transaction: ${entry['id']}'),
            subtitle: Text('Credits: ${entry['credits']}'),
          );
        },
      ),
    );
  }
}

// ------------------- Reports Screen -------------------
class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Report Generated (Dummy)!')),
            );
          },
          icon: const Icon(Icons.download),
          label: const Text('Generate PDF Report'),
        ),
      ),
    );
  }
}



class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Navigation Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Map View'),
            onTap: () {
              Navigator.pushNamed(context, '/map');
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text('Knowledge Hub'),
            onTap: () {
              Navigator.pushNamed(context, '/knowledge');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile & Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help / FAQs'),
            onTap: () {
              Navigator.pushNamed(context, '/help');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Log Out', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
