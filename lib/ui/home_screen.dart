import 'package:client/data/api_manager.dart';
import 'package:client/data/model/parking.dart';
import 'package:client/util/strings.dart';
import 'package:client/util/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  final ApiManager apiManager;

  HomeScreen(this.apiManager);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(Strings.APP_NAME),
      ),
      body: _buildAppScreenBody(context),
    );
  }

  Widget _buildAppScreenBody(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
        child: _buildAppScreenList()
    );
  }

  FutureBuilder<List<Parking>> _buildAppScreenList() {
    return FutureBuilder(
        future: apiManager.loadParkings(),
        builder: (BuildContext context, AsyncSnapshot<List<Parking>> snapshot) {
          return AppScreenMap(snapshot);
        });
  }

}

class AppScreenMap extends StatelessWidget {
  final AsyncSnapshot<List<Parking>> snapshot;

  AppScreenMap(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Widgets.returnWidgetOrEmpty(
        snapshot, () => AppParkingMap(snapshot.data));
  }
}

class AppParkingMap extends StatelessWidget {
  final List<Parking> parkingList;

  AppParkingMap(this.parkingList);


  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          parkingList.forEach
            ((parking) =>
              controller.addMarker(
                  MarkerOptions(
                      position: LatLng(parking.latitude, parking.longitude),
                      infoWindowText: InfoWindowText(
                          parking.name,
                          "Capacity: " + parking.capacity.toString())
                  )
              )
          );
        }
    );
  }
}

class AppParkingMarker extends StatelessWidget {
  final Parking parking;

  AppParkingMarker(this.parking);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(parking.name),
    );
  }

}