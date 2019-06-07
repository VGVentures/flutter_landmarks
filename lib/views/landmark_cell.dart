import 'package:flutter/material.dart';
import 'package:landmarks_flutter/common/constants.dart';
import 'package:landmarks_flutter/models/landmark.dart';
import 'package:landmarks_flutter/views/star_button.dart';
import 'package:listenable_builder/listenable_builder.dart';

class LandmarkCell extends StatelessWidget {
  final Landmark landmark;
  final Function() onTap;

  const LandmarkCell({
    Key key,
    @required this.landmark,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Material(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: Constants.defaultHorizontalPadding,
              vertical: 2.0,
            ),
            onTap: this.onTap,
            leading: Image.asset(
              'assets/${landmark.imageName}.jpg',
              width: 50.0,
            ),
            title: Text(landmark.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListenableBuilder(
                  listenable: landmark,
                  builder: (context, widget) {
                    return landmark.isFavorite ? StarButton(isFavorite: landmark.isFavorite) : Container();
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
        ),
        const Divider(
          height: 1,
          indent: Constants.defaultHorizontalPadding,
        ),
      ],
    );
  }
}
