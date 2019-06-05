import 'package:flutter/material.dart';
import 'package:landmarks_flutter/common/constants.dart';
import 'package:landmarks_flutter/models/landmark.dart';
import 'package:landmarks_flutter/views/star_button.dart';

class LandmarkCell extends StatelessWidget {
  final Landmark landmark;

  const LandmarkCell({Key key, @required this.landmark}) : super(key: key);

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
                AnimatedBuilder(
                  animation: landmark,
                  builder: (context, widget) {
                    return landmark.isFavorite
                        ? StarButton(
                            isFavorite: landmark.isFavorite,
                          )
                        : Container();
                  },
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15.0,
                  color: const Color(0xFFD3D3D3),
                ),
              ],
            ),
          ),
          const Divider(indent: Constants.defaultHorizontalPadding),
        ],
      ),
    );
  }
}
