import 'package:flutter/material.dart';
import 'package:notes_app/ui/core/themes/theme.dart';
import 'package:notes_app/ui/notes/widgets/back_app_bar_widget.dart';
import 'package:notes_app/ui/notes/widgets/base_scaffold.dart';

class NoteSaerch extends StatefulWidget {
  const NoteSaerch({super.key});

  @override
  State<StatefulWidget> createState() => StateNoteSearch();
}

class StateNoteSearch extends State<NoteSaerch> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themes = Theme.of(context);
    return BaseScreen(
      columnChildren: [
        Row(
          children: [
            BackAppBarWidget(),
            Expanded(
              child: _CustomSearchBar(searchController: searchController),
            ),
          ],
        ),
      ],
    );
  }
}

class _CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  const _CustomSearchBar({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    final themes = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.searchBarColor,
      ),
      padding: EdgeInsets.only(left: 24, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              style: themes.textTheme.bodySmall!.copyWith(fontSize: 20),
              cursorHeight: 24,
              cursorColor: AppColor.white,
              cursorWidth: 1,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          IconButton(
            onPressed: () {
              searchController.text = "";
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
