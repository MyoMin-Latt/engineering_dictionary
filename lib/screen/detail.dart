import 'package:a17_eng_dictionary/database/dictionary_database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class Detail_screen extends StatefulWidget {
  final DictionaryDatabase database;
  final DictionaryTableData data;

  const Detail_screen({Key? key, required this.data, required this.database})
      : super(key: key);

  @override
  State<Detail_screen> createState() => _Detail_screenState();
}

class _Detail_screenState extends State<Detail_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Engineering Dictionary"),
      ),
      body: ListView(
        children: [
          StreamBuilder<DictionaryTableData>(
              stream: widget.database.dictionaryDao.watchData(widget.data.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return IconButton(
                      onPressed: () async {
                        if (snapshot.data?.favourite == null) {
                          await widget.database.dictionaryDao
                              .updateWord(DictionaryTableCompanion(
                            id: Value(widget.data.id),
                            eng: Value(widget.data.eng),
                            myan: Value(widget.data.myan),
                            type: Value(widget.data.type),
                            favourite: Value(true),
                          ));
                        } else {
                          await widget.database.dictionaryDao
                              .updateWord(DictionaryTableCompanion(
                            id: Value(widget.data.id),
                            eng: Value(widget.data.eng),
                            myan: Value(widget.data.myan),
                            type: Value(widget.data.type),
                            favourite: Value(null),
                          ));
                        }
                      },
                      icon: snapshot.data?.favourite == null
                          ? Icon(Icons.star_border)
                          : Icon(Icons.star));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          ListTile(
            title: Text('English'),
            subtitle: Text(widget.data.eng),
          ),
          ListTile(
            title: Text('English'),
            subtitle: Text(widget.data.type),
          ),
          ListTile(
            title: Text('English'),
            subtitle: Text(widget.data.myan),
          ),
        ],
      ),
    );
  }
}
