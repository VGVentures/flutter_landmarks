import 'package:flutter/material.dart';
import 'package:landmarks_flutter/landmark_detail.dart';
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
  @override
  Widget build(BuildContext context) {
    print(landmarkData);
    return Scaffold(
      body: ListView.builder(
        itemCount: landmarkData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(landmarkData[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandmarkDetail(landmark: landmarkData[index],)),
              );
            },
          );
        },
      ),
    );
  }
}
