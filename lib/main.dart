import 'package:flutter/material.dart';
import 'package:test_isar_1n/db/database.dart';
import 'package:test_isar_1n/db/group.dart';
import 'package:test_isar_1n/db/groups_dao.dart';
import 'package:test_isar_1n/db/tag.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  
  late GroupsDAO _groupsDAO;
  
  @override
  void initState()
  {
    super.initState();
    _groupsDAO = GroupsDAO(openDB());
  }
  
  void _addItemAndSubItems()
  {
    final group = Group()
      ..label = "My group"
      ..tags.add(Tag()..label = "My tag");
    print("tags : ${group.tags.length}");
    // _groupsDAO.addOrUpdate(group);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Isar 1-n test"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItemAndSubItems,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
  
}
