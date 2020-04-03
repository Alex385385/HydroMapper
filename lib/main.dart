
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hydro Mapper'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Map Water Station Markers under progress, Coming Soon'),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Go to view map'),
              onPressed: () {
                navigateToSubPage(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
}


class MapPage extends StatelessWidget {
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
        appBar: AppBar(title: Text("Hydro Mapper - Map")),
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(34.057459, -117.822361),
            zoom: 15.0,
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
            new MarkerLayerOptions(
              markers: [
                build7_1, build7_2, build5,
                build8, build1, build6_1, build6_2,
                build9_1, build9_2, build9_3, bric
              ]
            )
          ],
          // ADD THIS
          mapController: mapController,
        ));
  }
}

Marker build7_1 = new Marker(
  width: 45.0,
  height: 45.0,
  point: new LatLng(34.057536, -117.827423),
  builder: (context) => new Container(
    child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
  )
);

Marker build7_2 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.057154, -117.827198),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);

Marker build5 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.057715, -117.824206),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);

Marker build8 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.058636, -117.824955),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);

Marker build1 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.059591, -117.824140),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);

Marker build6_1 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.058747, -117.822970),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);

Marker build6_2 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.058392, -117.822766),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);

Marker build9_1 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.058876, -117.822235),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);

Marker build9_2 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.058819, -117.822025),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);

Marker build9_3 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.059246, -117.822373),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);

Marker bric = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.054035, -117.820127),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);

Marker ssb = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.058168, -117.819435),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);

Marker bsc_1 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.056751, -117.821550),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);

Marker bsc_2 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.056427, -117.821507),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);

Marker bookS = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.055944, -117.820277),
    builder: (context) => new Container(
      child: IconButton(icon: Icon(Icons.location_on, color: Colors.deepPurple), onPressed: null),
    )
);
