import '../model/yugioh_card_info.dart';
import 'local/database_helper.dart';
import 'network/api_client.dart';

class Repository {
  static Future<YuGiOhCardInfo> fetchYuGiOhCard({
    int numCount,
    int offsetCount,
  }) async {
    return ApiClient.getYuGiOhCardInfo(
      numCount: numCount,
      offsetCount: offsetCount,
    );
  }

  static Future<List<dynamic>> insertYuGiOhCard(
    YuGiOhCardInfo cardInfo,
  ) {
    return DatabaseHelper.insert(cardInfo);
  }

  static Future<YuGiOhCardInfo> readYuGiOhCard() {
    return DatabaseHelper.read();
  }

  static Future<List<dynamic>> deleteYuGiOhCard() {
    return DatabaseHelper.delete();
  }
}
