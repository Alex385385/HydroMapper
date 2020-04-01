import 'package:flutter/material.dart';
import 'package:user_location/user_location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Location Plugin Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // ADD THIS
  MapController mapController = MapController();
  UserLocationOptions userLocationOptions;
  // ADD THIS
  List<Marker> markers = [];
  @override
  Widget build(BuildContext context) {
    // You can use the userLocationOptions object to change the properties
    // of UserLocationOptions in runtime
    userLocationOptions = UserLocationOptions(
      context: context,
      mapController: mapController,
      markers: markers,
      updateMapLocationOnPositionChange: false,
    );
    return Scaffold(
        appBar: AppBar(title: Text("Hydro Mapper")),
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(34.057459, -117.822361),
            zoom: 20.0,
            plugins: [
              // ADD THIS
              UserLocationPlugin(),
            ],
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            // ADD THIS
            MarkerLayerOptions(markers: markers),
            // ADD THIS
            userLocationOptions,
          ],
          // ADD THIS
          mapController: mapController,
        ));
  }
}