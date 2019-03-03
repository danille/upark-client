import 'package:client/blocs/parking_bloc.dart';
import 'package:flutter/widgets.dart';

class ParkingsProvider extends InheritedWidget {
  final ParkingBloc parkingBloc;

  ParkingsProvider({
    Key key,
    ParkingBloc parkingBloc,
    Widget child,
  })
      : parkingBloc = parkingBloc ?? ParkingBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ParkingBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(
          ParkingsProvider) as ParkingsProvider)
          .parkingBloc;
}