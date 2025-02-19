import 'package:rentease/data/model/category.dart';
import 'package:rentease/data/model/data_output.dart';
import 'package:rentease/utils/api.dart';
import 'package:rentease/utils/constant.dart';

class CategoryRepository {
  Future<DataOutput<Category>> fetchCategories({
    required int offset,
    int? id,
  }) async {
    final parameters = <String, dynamic>{
      if (id != null) 'id': id,
      Api.offset: offset,
      Api.limit: Constant.loadLimit,
    };
    try {
      final response = await Api.get(
        url: Api.apiGetCategories,
        queryParameters: parameters,
      );

      final modelList = (response['data'] as List).map(
        (e) {
          return Category.fromJson(e);
        },
      ).toList();
      return DataOutput(total: response['total'] ?? 0, modelList: modelList);
    } catch (e) {
      rethrow;
    }
  }
}
