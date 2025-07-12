import 'package:isar/isar.dart';

part 'notes.g.dart';

@collection
class Notes {
  Id id = Isar.autoIncrement;

  String? title;
  String? description;

  Notes(this.title, this.description);
}
