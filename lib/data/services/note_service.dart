import 'package:isar/isar.dart';
import 'package:notes_app/data/model/notes.dart';
import 'package:path_provider/path_provider.dart';

class NoteService {
  NoteService._singleton();

  static final NoteService _instance = NoteService._singleton();

  static NoteService get instance => _instance;

  late final Future<Isar> db = openDB();

  Future<void> saveOrUpdateNote(Notes note) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.notes.put(note);
    });
  }

  Future<void> deleteNote(Notes note) async {
    final isar = await db;
    await isar.notes.delete(note.id);
  }

  Future<List<Notes>> getAllNotes() async {
    final isar = await db;
    final result = await isar.notes.where().findAll();

    return result;
  }

  Stream<List<Notes>> listenNotes() async* {
    final isar = await db;
    yield* isar.notes.where().watch(fireImmediately: true);
  }

  Future<List<Notes>> filterTitle(String title) async {
    final isar = await db;
    final result = await isar.notes.filter().titleContains("name").findAll();

    return result;
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([NotesSchema], directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }
}
