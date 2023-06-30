import 'package:isar/isar.dart';
import 'package:test_isar_1n/db/group.dart';
import 'package:test_isar_1n/db/tag.dart';

class GroupsDAO
{

  final Future<Isar> db;


  GroupsDAO(this.db);
  
  Future<Group?> getGroupById(int id) async
  {
    final isar = await db;
    return await isar.groups.get(id);
  }

  Future<void> addOrUpdate(Group group) async
  {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tags.putAll(group.tags.toList());
      await isar.groups.put(group);
      // await group.tags.save();
    });
  }

}