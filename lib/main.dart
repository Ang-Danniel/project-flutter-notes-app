import 'package:flutter/material.dart';
import 'package:notes_app/ui/core/ui/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}
