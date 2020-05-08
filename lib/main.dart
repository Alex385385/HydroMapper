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
      home: homeScreen(),
    );
  }
}

class homeScreen extends StatefulWidget {
  State createState() => HomePage();
}

class HomePage extends State<homeScreen> {
  bool _visible = false;
  var _currencies = [
    '',
    'Building 1: Building One',
    'Building 5: College of Letters, Arts and Social Science',
    'Building 6: College of Education and Integrative Studies',
    'Building 7: College of Environmental Design',
    'Building 8: College of Science',
    'Building 9: College of Engineering',
    'Building 35: Bronco Student Center',
    'Building 42: BRIC',
    'Building 66: Bronco Bookstore',
    'Building 121: Student Services Building'
  ];
  var _currentItemSelected = '';
  var _location = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hydro Mapper'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Hydro Mapper, find the closest water station near you to refill your water bottles!\n\n\n\n\n\n\n\n\n\n\n\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Use dropdown menu or click map for locations\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              items: _currencies.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: TextStyle(fontSize: 15.0),
                  ),
                );
              }).toList(),
              onChanged: (String newValueSelected) {
                // Your code to execute, when a menu item is selected from drop down
                _onDropDownItemSelected(newValueSelected);

                _visible = true;

                if (_currentItemSelected == 'Building 1: Building One') {
                  _location = '1st floor to the left';
                }

                if (_currentItemSelected ==
                    'Building 5: College of Letters, Arts and Social Science') {
                  _location = 'Left of main entrance';
                }

                if (_currentItemSelected ==
                    'Building 6: College of Education and Integrative Studies') {
                  _location = '1st floor';
                }

                if (_currentItemSelected ==
                    'Building 7: College of Environmental Design') {
                  _location = 'Entrance next to bathroom';
                }

                if (_currentItemSelected == 'Building 8: College of Science') {
                  _location = 'Third Floor off the elevator';
                }

                if (_currentItemSelected ==
                    'Building 9: College of Engineering') {
                  _location = '1st Floor old building';
                }

                if (_currentItemSelected ==
                    'Building 35: Bronco Student Center') {
                  _location = 'Game Room';
                }
                if (_currentItemSelected == 'Building 42: BRIC') {
                  _location = 'Outside infront of the pool';
                }
                if (_currentItemSelected == 'Building 66: Bronco Bookstore') {
                  _location = '1st floor next to bathroom';
                }
                if (_currentItemSelected ==
                    'Building 121: Student Services Building') {
                  _location = 'Towards Financial Aid Office';
                }
              },
              value: _currentItemSelected,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Go to view map'),
              onPressed: () {
                navigateToSubPage(context);
              },
            ),
            Visibility(
              child: Text('\n\n\n\n' + _location, style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold)),
              visible: _visible,
            ),
          ],
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
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
            maxZoom: 19.0,
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
            new MarkerLayerOptions(markers: [
              build7_1,
              build7_2,
              build5,
              build8,
              build1,
              build6_1,
              build6_2,
              build9_1,
              build9_2,
              build9_3,
              bric
            ])
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
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        height: 350,
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/build7_1.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 7: College of Environmental Design \n Quad Area',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker build7_2 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.057154, -117.827198),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/build7_2.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 7: College of Environmental Design \n Entrance',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker build5 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.057715, -117.824206),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image:
                                            AssetImage('assets/build5.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 5: College of Letters, Arts and Social Science \n Left of main entrance ',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker build8 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.058636, -117.824955),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image:
                                            AssetImage('assets/build8.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 8: College of Science \n 3rd Floor off the elevators',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker build1 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.059591, -117.824140),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image:
                                            AssetImage('assets/build1.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 1: Building One \n 1st floor to the left',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker build6_1 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.058747, -117.822970),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/build6_1.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 6: College of Education and Integrative Studies \n 1st floor',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker build6_2 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.058392, -117.822766),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/build6_2.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 6: College of Education and Integrative Studies \n 1st floor',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker build9_1 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.058876, -117.822235),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/build9_1.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 9: College of Engineering \n 1st Floor old building',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker build9_2 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.058819, -117.822025),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/build9_2.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 9: College of Engineering \n 1st Floor old building',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker build9_3 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.059246, -117.822373),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/build9_3.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 9: College of Engineering \n 2nd floor by elevator',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker bric = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.054035, -117.820127),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image: AssetImage('assets/bric.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 42: BRIC \n Outside by the pool',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker ssb = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.058168, -117.819435),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image: AssetImage('assets/ssb.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 121: Student Services Building \n Towards Financial Aid Office',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker bsc_1 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.056751, -117.821550),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image:
                                            AssetImage('assets/bsc_1.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 35: Bronco Student Center \n Game Room',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker bsc_2 = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.056427, -117.821507),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image:
                                            AssetImage('assets/bsc_2.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 35: Bronco Student Center \n By Ursa Minor',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));

Marker bookS = new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(34.055944, -117.820277),
    builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on, color: Colors.deepPurple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: new Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 300,
                                color: Colors.amber[600],
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Image(
                                        image:
                                            AssetImage('assets/bookS.jpeg'))),
                              ),
                              Expanded(
                                child: Text(
                                    'Building 66: Bronco Bookstore \n 1st Floor next to bathrooms',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));
