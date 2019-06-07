import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landmarks_flutter/common/constants.dart';
import 'package:landmarks_flutter/screens/landmark_detail.dart';
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

  @override
  Widget build(BuildContext context) {
    final landmarks = _showFavoritesOnly ? favoriteLandmarks : allLandmarks;
    return Material(
      child: CupertinoPageScaffold(
        child: SafeArea(
          bottom: false,
          child: CustomScrollView(
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                largeTitle: Text(widget.title),
                backgroundColor: Colors.white,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Constants.defaultHorizontalPadding / 4,
                    horizontal: Constants.defaultHorizontalPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Show Favorites Only',
                        style: TextStyle().copyWith(
                          fontSize: 17.0,
                        ),
                      ),
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
                ),
              ),
              SliverToBoxAdapter(
                child: const Divider(
                  height: 1,
                  indent: Constants.defaultHorizontalPadding,
                ),
              ),
              SliverPadding(padding: const EdgeInsets.only(top: 8.0)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final landmark = landmarks[index];
                    return LandmarkCell(
                      landmark: landmark,
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => LandmarkDetail(
                              landmark: landmark,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  childCount: landmarks.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
