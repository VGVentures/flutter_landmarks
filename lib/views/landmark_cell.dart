import 'package:flutter/material.dart';
import 'package:landmarks_flutter/models/landmark.dart';
import 'package:landmarks_flutter/views/star_button.dart';

class LandmarkCell extends StatelessWidget {
  LandmarkCell({Key key, @required this.landmark}) : super(key: key);

  final Landmark landmark;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.asset(
              'assets/${landmark.imageName}.jpg',
              width: 50.0,
            ),
            title: Text(landmark.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                StarButton(
                    isFavorite: true,
                    onTap: (status) {
                      print(status);
                    }),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15.0,
                  color: const Color(0xFFD3D3D3),
                ),
              ],
            ),
          ),
          Divider(indent: 15.0),
        ],
      ),
    );
  }
}
