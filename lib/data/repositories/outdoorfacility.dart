import 'package:rentease/data/model/outdoor_facility.dart';
import 'package:rentease/utils/api.dart';

class OutdoorFacilityRepository {
  Future<List<OutdoorFacility>> fetchOutdoorFacilityList() async {
    final result = await Api.get(
      url: Api.getOutdoorFacilites,
      queryParameters: {},
    );

    final outdoorFacilities = (result['data'] as List).map((element) {
      return OutdoorFacility.fromJson(element);
    }).toList();

    return List.from(outdoorFacilities);
  }
}
