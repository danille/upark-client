import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:client/data/model/parking.dart';
import 'package:client/util/constants.dart';

class ApiManager {
  var httpClient = new HttpClient();

  Future<List<Parking>> loadParkings() async {
    var decodedJSON = await _getDecodedJson(Constants.API_GET_PARKINGS_URL);

    List<Parking> parkingList = new List<Parking>();
    for (var parkingJSON in decodedJSON) {
      parkingList.add(new Parking.fromJSON(parkingJSON));
    }

    return parkingList;
  }

  Future _getDecodedJson(String path) async {
    var uri = new Uri.https(Constants.API_BASE_URL, path);
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var json = await response.transform(Utf8Decoder()).join();
    var decoded = jsonDecode(json);
    return decoded;
  }
}