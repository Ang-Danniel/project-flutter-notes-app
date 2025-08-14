import 'package:flutter/material.dart';
import 'package:notes_app/ui/core/themes/theme.dart';
import 'package:notes_app/ui/core/ui/home.dart';
import 'package:notes_app/ui/notes/widgets/bubble_info_dialog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.darkTheme,
    );
  }
}

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themes = Theme.of(context).colorScheme;
    final key = GlobalKey();
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: IconButton(
            key: key,
            onPressed: () {
              showInfoBubble(
                "Hello",
                "Halo halo halo halo halo",
                key,
                themes.primary,
              );
            },
            icon: Icon(Icons.info),
          ),
          // child: InfoBubbleDialog(
          // "Hello",
          // "Halo halo halo halo halo",
          // bubbleWidth: 400,
          // ),
        ),
      ),
    );
  }
}
