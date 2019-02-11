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
    return _buildAppScreenBody(context);
  }

  Widget _buildAppScreenBody(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: new Stack(children: <Widget>[
              _buildAppScreenMap(),
              Align(
                alignment: Alignment(.0, -.8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(8.0)
                      )
                  ),
                  margin: EdgeInsets.only(left: 18.0, right: 18.0),
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: Strings.MAP_TEXT_HINT,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.mic,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            ],
            )
        )
    );
  }

  FutureBuilder<List<Parking>> _buildAppScreenMap() {
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
        options: GoogleMapOptions(
          myLocationEnabled: true,
        ),
        onMapCreated: (GoogleMapController controller) {
          Parking parking = parkingList[0];

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

          controller.animateCamera(
              CameraUpdate.newLatLngZoom(
                  LatLng(parking.latitude, parking.longitude),
                  14
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