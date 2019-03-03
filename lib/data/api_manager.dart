import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:client/data/model/parking.dart';
import 'package:client/util/constants.dart';

class ApiManager {
  var _httpClient = new HttpClient();

  Future<List<Parking>> loadParkings() async {
    var decodedJSON = await _getDecodedJson(Constants.API_GET_PARKINGS_URL);

    List<Parking> parkingList = List<Parking>();
    for (var parkingJSON in decodedJSON) {
      parkingList.add(Parking.fromJSON(parkingJSON));
    }

    return parkingList;
  }

  Future _getDecodedJson(String path) async {
    var uri = new Uri.https(Constants.API_BASE_URL, path);
    var response = await _get(uri);
    return json.decode(response);
  }

  Future<String> _get(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();
    return response.transform(utf8.decoder).join();
  }
}