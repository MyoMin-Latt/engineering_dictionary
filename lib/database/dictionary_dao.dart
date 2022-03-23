import 'package:a17_eng_dictionary/database/dictionary_database.dart';
import 'package:a17_eng_dictionary/database/dictionary_table.dart';
import 'package:drift/drift.dart';
part 'dictionary_dao.g.dart';

@DriftAccessor(tables: [DictionaryTable])
class DictionaryDao extends DatabaseAccessor<DictionaryDatabase>
    with _$DictionaryDaoMixin {
  DictionaryDao(DictionaryDatabase dictionaryDatabase)
      : super(dictionaryDatabase);

  Future<List<DictionaryTableData>> getAllWord() async {
    return await select(dictionaryTable).get();
  }

  Future<List<DictionaryTableData>> searchWord(String words)async {
    return await (select(dictionaryTable)..where((tbl) => tbl.eng.like('$words%'))).get();
  }
}
