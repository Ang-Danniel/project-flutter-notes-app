import 'package:flutter/material.dart';
import 'package:notes_app/data/model/notes.dart';
import 'package:notes_app/data/services/note_service.dart';
import 'package:notes_app/ui/core/themes/theme.dart';
import 'package:notes_app/ui/notes/widgets/back_app_bar_widget.dart';
import 'package:notes_app/ui/notes/widgets/base_scaffold.dart';
import 'package:notes_app/ui/notes/widgets/bubble_info_dialog.dart';
import 'package:notes_app/ui/notes/widgets/save_note_dialog.dart';

class NotePage extends StatefulWidget {
  final bool isDraft;
  final Notes? note;
  const NotePage({super.key, required this.isDraft, this.note});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final dbInstance = NoteService.instance;
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  bool isDraft = true;
  bool isSaved = false;

  Notes? note;

  @override
  void initState() {
    super.initState();
    note = widget.note ?? Notes("", "");
    isDraft = widget.isDraft;
    if (isDraft) {
      isSaved = false;
    } else {
      if (widget.note == null) {
        throw Exception('Note cannot be null when isDraft is false');
      }
      titleController.text = widget.note!.title ?? " ";
      contentController.text = widget.note!.description ?? " ";
      isSaved = true;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void saveNoteDialog(BuildContext context, GlobalKey key) {
    if (titleController.text == "" || contentController.text == "") {
      showInfoBubble(
        "Warning",
        "Put the title and content first before saving!",
        key,
        AppColor.hintTextColor,
      );
      return;
    }
    showDialog(
      context: context,
      barrierColor: AppColor.barrierColor,
      builder: (context) => SaveNoteDialog(saveNotes: saveNotes),
    );
  }

  void saveNotes() {
    if (titleController.text == "" || contentController.text == "") {
      return;
    }

    note!.title = titleController.text;
    note!.description = contentController.text;
    dbInstance.saveOrUpdateNote(note!);
    isDraft = false;
    isSaved = true;
    setState(() {});
  }

  void editMode() {
    if (!isSaved) return;
    isDraft = true;
    setState(() {});
  }

  void readOnlyMode(GlobalKey key) {
    if (!isSaved) {
      showInfoBubble(
        "Info",
        "Save the note first before entering read only mode",
        key,
        AppColor.hintTextColor,
      );
      return;
    }
    isDraft = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final readOnlyButtonKey = GlobalKey();
    final saveButtonKey = GlobalKey();
    final themes = Theme.of(context);
    final textTheme = themes.textTheme;
    return BaseScreen(
      columnChildren: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackAppBarWidget(),
            (isDraft)
                ? _AppBarReadModeButtons(
                  readOnlyMode: readOnlyMode,
                  saveNoteDialog: saveNoteDialog,
                  saveButtonKey: saveButtonKey,
                  readOnlyButtonKey: readOnlyButtonKey,
                )
                : _AppBarEditModeButtons(editMode: editMode),
          ],
        ),
        const SizedBox(height: 20),
        TextField(
          readOnly: !isDraft,
          cursorColor: AppColor.cursorColor,
          cursorHeight: 36,
          controller: titleController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Title",
            hintStyle: textTheme.displayLarge,
          ),
          style: textTheme.bodyLarge,
          maxLines: null,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: TextField(
                readOnly: !isDraft,
                cursorColor: AppColor.cursorColor,
                cursorHeight: 20,
                controller: contentController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type something...",
                  hintStyle: textTheme.displaySmall,
                ),
                style: textTheme.bodySmall,
                maxLines: null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AppBarEditModeButtons extends StatelessWidget {
  final VoidCallback editMode;
  const _AppBarEditModeButtons({super.key, required this.editMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4, bottom: 5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 59, 59, 59),
      ),
      child: IconButton(onPressed: editMode, icon: const Icon(Icons.edit)),
    );
  }
}

class _AppBarReadModeButtons extends StatelessWidget {
  final Function(GlobalKey key) readOnlyMode;
  final Function(BuildContext context, GlobalKey key) saveNoteDialog;
  final GlobalKey saveButtonKey;
  final GlobalKey readOnlyButtonKey;

  const _AppBarReadModeButtons({
    super.key,
    required this.readOnlyMode,
    required this.saveNoteDialog,
    required this.saveButtonKey,
    required this.readOnlyButtonKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20, bottom: 5),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(255, 59, 59, 59),
          ),
          child: IconButton(
            key: readOnlyButtonKey,
            onPressed: () => readOnlyMode(readOnlyButtonKey),
            icon: const Icon(Icons.visibility),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(255, 59, 59, 59),
          ),
          child: IconButton(
            key: saveButtonKey,
            onPressed: () => saveNoteDialog(context, saveButtonKey),
            icon: const Icon(Icons.save),
          ),
        ),
      ],
    );
  }
}
