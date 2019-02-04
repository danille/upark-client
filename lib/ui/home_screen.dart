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
      child: GoogleMap(
        onMapCreated: (GoogleMapController controller) {},
      ),
    );
  }

  FutureBuilder<List<Parking>> _buildAppScreenList() {
    return FutureBuilder(
        future: apiManager.loadParkings(),
        builder: (BuildContext context, AsyncSnapshot<List<Parking>> snapshot) {
          return new AppScreenList(snapshot);
        });
  }

}

class AppScreenList extends StatelessWidget {
  final AsyncSnapshot<List<Parking>> snapshot;

  AppScreenList(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Widgets.returnWidgetOrEmpty(
        snapshot, () => AppParkingList(snapshot.data));
  }
}

class AppParkingList extends StatelessWidget {
  final List<Parking> parkingList;

  AppParkingList(this.parkingList);

  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: new ListView.builder(
          itemBuilder: (context, index) =>
          new AppRepoListTile(parkingList[index]),
          itemCount: parkingList.length),
    );
  }
}

class AppRepoListTile extends StatelessWidget {
  final Parking parking;

  AppRepoListTile(this.parking);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(parking.name),
    );
  }

}