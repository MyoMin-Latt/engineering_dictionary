import 'package:a17_eng_dictionary/database/dictionary_database.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final DictionaryDatabase database = DictionaryDatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favourite'),
        ),
        body: FutureBuilder<List<DictionaryTableData>>(
          future: database.dictionaryDao.getAllFavourite(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Detail_screen(
                                  data: snapshot.data![index],
                                  database: database,
                                );
                              }),
                            );
                          },
                          child: Text(snapshot.data![index].eng)),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
