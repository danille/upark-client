import 'dart:async';

import 'package:client/data/api_manager.dart';
import 'package:client/data/model/parking.dart';
import 'package:rxdart/rxdart.dart';

class ParkingBloc {
  PublishSubject<List<Parking>> _parkingsController =
  PublishSubject<List<Parking>>();

  Sink<List<Parking>> get _inParkings => _parkingsController.sink;

  Stream<List<Parking>> get parkings => _parkingsController.stream;

  ParkingBloc() {
    ApiManager api = ApiManager();

    api.loadParkings().then((List<Parking> parkings) =>
        _handleFetchedParkings(parkings));
  }

  _handleFetchedParkings(List<Parking> parkings) {
    if (parkings.length > 0) {
      _inParkings.add(parkings);
    }
  }


}