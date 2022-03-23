import 'package:a17_eng_dictionary/database/dictionary_database.dart';
import 'package:flutter/material.dart';

class Detail_screen extends StatelessWidget {
  final DictionaryTableData data;
  const Detail_screen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Engineering Dictionary"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('English'),
            subtitle: Text(data.eng),
          ),
          ListTile(
            title: Text('English'),
            subtitle: Text(data.type),
          ),
          ListTile(
            title: Text('English'),
            subtitle: Text(data.myan),
          ),
        ],
      ),
    );
  }
}
