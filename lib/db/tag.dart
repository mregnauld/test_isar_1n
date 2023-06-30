import 'package:isar/isar.dart';
import 'package:test_isar_1n/db/group.dart';

part 'tag.g.dart';

@Collection()
class Tag
{

  Id id = Isar.autoIncrement;
  late String label;
  
  @Backlink(to: "tags")
  final group = IsarLink<Group>();

}