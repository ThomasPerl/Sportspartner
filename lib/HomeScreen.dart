import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final supabase = Supabase.instance.client;
  String? username;
  String? email;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    // Email kommt direkt aus auth.users
    email = user.email;

    // Username kommt aus der Profile-Tabelle
    final response = await supabase
        .from('profiles')
        .select('user_name')
        .eq('uuid', user.id)
        .maybeSingle();

    if (response != null) {
      setState(() {
        username = response['user_name'] as String?;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(username ?? "Lade..."),
              accountEmail: Text(email ?? ""),
              currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),

            // Die anderen Items in einem Expanded / scrollable Bereich
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero, // optional, damit keine unnötigen Ränder
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: const Icon(Icons.message),
                    title: const Text("Messages"),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {},
                  ),
                  Divider(),
                ],
              ),
            ),

            // Logout immer unten
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("LogOut"),
              onTap: () {
                Supabase.instance.client.auth.signOut();
              },
            ),
          ],
        ),
      ),
      body: const Center(child: Text("Home Screen")),
    );
  }
}
