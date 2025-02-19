import 'package:rentease/data/model/data_output.dart';
import 'package:rentease/data/model/notification_data.dart';
import 'package:rentease/utils/api.dart';
import 'package:rentease/utils/constant.dart';

class NotificationsRepository {
  Future<DataOutput<NotificationData>> fetchNotifications({
    required int offset,
  }) async {
    try {
      final parameters = <String, dynamic>{
        // Api.userid: HiveUtils.getUserId(),
        Api.offset: offset,
        Api.limit: Constant.loadLimit,
      };
      final response = await Api.get(
        url: Api.apiGetNotifications,
        queryParameters: parameters,
      );
      print('total is ${response['total']}');

      final modelList = (response['data'] as List).map((e) {
        return NotificationData.fromJson(e);
      }).toList();

      return DataOutput(
        total: response['total'],
        modelList: modelList,
      );
    } catch (e) {
      rethrow;
    }
  }
}
