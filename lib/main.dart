import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landmarks_flutter/landmark_detail.dart';
import 'package:landmarks_flutter/views/landmark_cell.dart';
import 'package:landmarks_flutter/models/data.dart';

void main() {
  loadData().then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landmarks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Landmarks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showFavoritesOnly = false;
  List<LandmarkCell> _landmarkWidgets;

  @override
  void initState() {
    super.initState();
    _landmarkWidgets =
        List<LandmarkCell>.generate(landmarkData.length, (index) {
      return LandmarkCell(
        landmark: landmarkData[index],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print(landmarkData);
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.title),
        ),
        child: GestureDetector(
          onTap: () {},
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Landmarks',
                    style: TextStyle().copyWith(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Divider(indent: 15.0),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Show Favorites Only',
                      style: TextStyle().copyWith(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Spacer(),
                  CupertinoSwitch(
                    value: _showFavoritesOnly,
                    onChanged: (state) {
                      setState(() {
                        _showFavoritesOnly = state;
                      });
                    },
                  ),
                ],
              ),
              Divider(indent: 15.0),
            ]..addAll(List<Widget>.generate(landmarkData.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandmarkDetail(landmark: landmarkData[index],)),
                    );
                  },
                  child: LandmarkCell(
                    landmark: landmarkData[index],
                  ),
                );
              })),
          ),
        ),
      ),
    );
  }
}
