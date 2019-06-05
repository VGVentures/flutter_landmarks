import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landmarks_flutter/landmark_detail.dart';
import 'package:landmarks_flutter/models/landmark.dart';
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
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  bool _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text(widget.title),
              backgroundColor: Colors.white,
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 5.0),
            ),
            SliverToBoxAdapter(
              child: Row(
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
            ),
            SliverToBoxAdapter(child: const Divider(indent: 15.0)),
          ]..addAll(
              List<Widget>.generate(
                landmarkData.length,
                (index) {
                  final landmark = landmarkData[index];
                  final showCell = (!_showFavoritesOnly ||
                      (_showFavoritesOnly && landmark.isFavorite));
                  return SliverToBoxAdapter(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      height: showCell ? null : 0.0,
                      child: GestureDetector(
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
                        child: LandmarkCell(
                          landmark: landmark,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ),
      ),
    );
  }
}
