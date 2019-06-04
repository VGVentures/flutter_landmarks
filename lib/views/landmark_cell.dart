import 'package:flutter/material.dart';
import 'package:landmarks_flutter/models/landmark.dart';
import 'package:landmarks_flutter/views/star_button.dart';

class LandmarkCell extends StatelessWidget {
  LandmarkCell({this.landmark});

  final Landmark landmark;

  @override
  Widget build(BuildContext context) {
    print(landmark.imageName);
    return Material(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.asset('assets/${landmark.imageName}.jpg'),
            title: Text(landmark.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                StarButton(isFavorite: true, onTap: (status) {
                  print(status);
                }),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          Divider(indent: 15.0),
        ],
      ),
    );
  }
}
