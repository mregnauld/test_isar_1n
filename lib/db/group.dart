import 'package:isar/isar.dart';
import 'package:test_isar_1n/db/tag.dart';

part 'group.g.dart';

@Collection()
class Group
{

  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String label;
  
  final tags = IsarLinks<Tag>();
  
}