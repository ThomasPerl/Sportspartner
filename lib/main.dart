import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import 'AuthGate.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://gkvwrijnotthydjvycxm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdrdndyaWpub3R0aHlkanZ5Y3htIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE4OTI1MjQsImV4cCI6MjA2NzQ2ODUyNH0.BoCfWozfLnQi1-sxS1XcwlANX6IR9P2ChHKtQlFgdDc',
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(), // <- nur noch AuthGate
    );
  }
}
