import 'package:a17_eng_dictionary/database/dictionary_database.dart';
import 'package:a17_eng_dictionary/screen/detail.dart';
import 'package:a17_eng_dictionary/screen/favourite.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DictionaryDatabase database = DictionaryDatabase();
  final _searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Engineering Dictionary"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) {
                return FavouriteScreen();
              }),
            ),
          );
        },
        child: Icon(Icons.favorite),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchText,
              onChanged: (str) {
                setState(() {});
              },
              decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<DictionaryTableData>>(
                future: database.dictionaryDao.searchWord(_searchText.text),
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
                }),
          ),
        ],
      ),
    );
  }
}
