import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/model/notes.dart';
import 'package:notes_app/data/services/note_service.dart';
import 'package:notes_app/ui/core/ui/note_page.dart';
import 'package:notes_app/ui/notes/widgets/note_card.dart';

final NoteService dbInstance = NoteService.instance;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => StateHomePage();
}

class StateHomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: AutoSizeText(
                    "Notes",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, bottom: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 59, 59, 59),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, bottom: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 59, 59, 59),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline, color: Colors.white),
                ),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<List<Notes>>(
              stream: dbInstance.listenNotes(),
              builder:
                  (context, snapshot) =>
                      (snapshot.hasData && snapshot.data!.isNotEmpty)
                          ? ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return NoteCard(notes: snapshot.data![index]);
                            },
                          )
                          : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/no_notes.png',
                                  width: 300,
                                  height: 300,
                                ),
                                Text(
                                  "Create your first note!",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 80),
                              ],
                            ),
                          ),
            ),
          ),
          // Image.asset('assets/images/no_notes.png', width: 150, height: 150),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.4),
                blurRadius: 5,
                spreadRadius: 0,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.4),
                blurRadius: 5,
                spreadRadius: 0,
                offset: Offset(-5, 0),
              ),
            ],
          ),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotePage(isDraft: true),
                ),
              );
            },
            shape: const CircleBorder(),
            backgroundColor: const Color.fromRGBO(37, 37, 37, 1),
            elevation: 0, // Set elevation to 0 to remove the default shadow
            child: const Icon(Icons.add, color: Colors.white, size: 36),
          ),
        ),
      ),
    );
  }
}
