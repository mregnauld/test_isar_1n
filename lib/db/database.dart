import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_isar_1n/db/group.dart';
import 'package:test_isar_1n/db/tag.dart';

Future<Isar> openDB() async
{
  if (Isar.instanceNames.isEmpty)
  {
    final dbFolder = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [TagSchema, GroupSchema],
      inspector: true,
      directory: dbFolder.path,
    );
  }
  return Future.value(Isar.getInstance());
}