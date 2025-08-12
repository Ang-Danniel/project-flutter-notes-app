import 'package:flutter/material.dart';
import 'package:notes_app/data/model/notes.dart';
import 'package:notes_app/ui/core/ui/note_page.dart';

class NoteCard extends StatelessWidget {
  final Notes notes;
  final Color? cardColor;
  const NoteCard({super.key, required this.notes, this.cardColor});

  @override
  Widget build(BuildContext context) {
    String title = notes.title ?? "Undefined";
    Color cardColor = this.cardColor ?? const Color.fromRGBO(255, 158, 100, 1);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NotePage(isDraft: false, note: notes),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 16),
        padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: title,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
