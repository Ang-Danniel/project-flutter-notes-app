import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/ui/core/themes/theme.dart';

const String infoSvg = 'assets/icons/info_icon.svg';

class SaveNoteDialog extends StatelessWidget {
  final Function() saveNotes;
  const SaveNoteDialog({super.key, required this.saveNotes});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Dialog(
      backgroundColor: Color.fromRGBO(37, 37, 37, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 24),
          SvgPicture.asset(infoSvg, width: 36, height: 36),
          SizedBox(height: 24),
          Text("Save changes ?", style: textTheme.bodySmall),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.rejectButonColor,
                  fixedSize: Size(120, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Discard",
                  style: textTheme.bodySmall!.copyWith(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  saveNotes();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.acceptButtonColor,
                  fixedSize: Size(120, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Save",
                  style: textTheme.bodySmall!.copyWith(fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
