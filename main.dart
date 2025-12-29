import 'package:flutter/material.dart';
import 'notes_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes SQLite',
      theme: ThemeData(useMaterial3: true),
      home: const NotesPage(),
    );
  }
}
