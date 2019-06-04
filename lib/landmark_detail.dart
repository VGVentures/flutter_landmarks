import 'package:flutter/material.dart';

import 'models/landmark.dart';

class LandmarkDetail extends StatelessWidget {
  final Landmark landmark;

  const LandmarkDetail({Key key, @required this.landmark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: 0.0 + 300.0,
            child: _mapView(),
          ),
          Positioned(
            top: 170.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              children: <Widget>[
                _imageView(),
                Padding(padding: const EdgeInsets.only(top: 20.0)),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        'Chilkoot Trailfkadsl;dksafkjld;sajkfld;ajsklf;d',
                        style: TextStyle().copyWith(
                            fontWeight: FontWeight.w400, fontSize: 28.0),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 12.0)),
                    Icon(Icons.star),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mapView() {
    return Container(
      color: Color(0xFFC3ECB2),
      child: Center(
        child: Text('Map'),
      ),
    );
  }

  Widget _imageView() {
    return Container(
      height: 250.0,
      width: double.infinity,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 4.0,
                color: Colors.transparent,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 10.0,
                  spreadRadius: 10.0,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(125.0))),
          width: 250.0,
          height: 250.0,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(120.0)),
            child: Image.asset('assets/${landmark.imageName}.jpg'),
          ),
        ),
      ),
    );
  }
}
