import 'package:sqflite/sqflite.dart';

import '../../config/constant.dart';
import '../../model/yugioh_card_info.dart';

class DatabaseHelper {
  static Database _db;

  static Future<Database> get database async {
    if (_db == null) {
      _db = await _initDatabase();
    }
    return _db;
  }

  static Future<Database> _initDatabase() async {
    Database _database = await openDatabase(
      Constant.databaseName,
      version: 1,
      onCreate: (Database db, int version) async {
        Batch _batch = db.batch();
        _batch.execute(
          'CREATE TABLE ${Constant.tableCard} '
          '('
          '${Constant.fieldIdCard} INTEGER PRIMARY KEY, '
          '${Constant.fieldNameCard} TEXT, '
          '${Constant.fieldDescCard} TEXT, '
          '${Constant.fieldImageCard} TEXT'
          ')',
        );
        _batch.execute(
          'CREATE TABLE ${Constant.tableMeta} '
          '('
          '${Constant.fieldTotalMeta} INTEGER, '
          '${Constant.fieldOffsetMeta} INTEGER'
          ')',
        );
        await _batch.commit(noResult: true);
      },
    );
    return _database;
  }

  static Future<List<dynamic>> insert(YuGiOhCardInfo card) async {
    Database _database = await database;
    Batch _batch = _database.batch();
    for (Datum datum in card.data) {
      _batch.insert(
        Constant.tableCard,
        <String, dynamic>{
          Constant.fieldIdCard: datum.id,
          Constant.fieldNameCard: datum.name,
          Constant.fieldDescCard: datum.desc,
          Constant.fieldImageCard: datum.cardImages[0].imageUrl,
        },
      );
    }
    _batch.delete(Constant.tableMeta);
    _batch.insert(
      Constant.tableMeta,
      <String, dynamic>{
        Constant.fieldTotalMeta: card.meta.totalRows,
        Constant.fieldOffsetMeta: card.meta.nextPageOffset,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    List<dynamic> _response = await _batch.commit();
    return _response;
  }

  static Future<YuGiOhCardInfo> read() async {
    Database _database = await database;
    
    Batch _batch = _database.batch();
    _batch.query(Constant.tableCard);
    _batch.query(Constant.tableMeta);

    List<dynamic> _listBatch = await _batch.commit();
    List<Map<String, dynamic>> _listMapCard = _listBatch[0];
    List<Datum> _listCard = List<Datum>.generate(
      _listMapCard.length,
      (int indexDatum) {
        Map<String, dynamic> _mapDatum = _listMapCard[indexDatum];
        return Datum(
          id: _mapDatum[Constant.fieldIdCard],
          name: _mapDatum[Constant.fieldNameCard],
          desc: _mapDatum[Constant.fieldDescCard],
          cardImages: <CardImage>[
            CardImage(
              imageUrl: _mapDatum[Constant.fieldImageCard],
            ),
          ],
        );
      },
    );
    Map<String, dynamic> _mapMeta = _listBatch[1][0];
    YuGiOhCardInfo _yuGiOhCardInfo = YuGiOhCardInfo(
      data: _listCard,
      meta: Meta(
        totalRows: _mapMeta[Constant.fieldTotalMeta],
        nextPageOffset: _mapMeta[Constant.fieldOffsetMeta],
      ),
    );
    return _yuGiOhCardInfo;
  }

  static Future<List<dynamic>> delete() async {
    Database _database = await database;
    Batch _batch = _database.batch();
    _batch.delete(Constant.tableCard);
    _batch.delete(Constant.tableMeta);
    List<dynamic> _response = await _batch.commit();
    return _response;
  }
}
