import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:landmarks_flutter/models/landmark.dart';
import 'package:landmarks_flutter/views/star_button.dart';

class LandmarkDetail extends StatelessWidget {
  final Landmark landmark;
  final Completer<GoogleMapController> _controller = Completer();

  LandmarkDetail({
    Key key,
    @required this.landmark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          previousPageTitle: 'Landmarks',
          backgroundColor: const Color(0x00FFFFFF),
          border: Border(
            bottom: BorderSide.none,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              height: 450.0,
              child: _mapView(),
            ),
            Positioned(
              top: 320.0,
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
                          landmark.name,
                          style: TextStyle().copyWith(fontWeight: FontWeight.w400, fontSize: 28.0),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 12.0)),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: AnimatedBuilder(
                          animation: landmark,
                          builder: (context, widget) {
                            return StarButton(
                              isFavorite: landmark.isFavorite,
                              onTap: (value) {
                                landmark.setFavorite(value);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.only(top: 12.0)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        landmark.park,
                        style: TextStyle().copyWith(fontWeight: FontWeight.w500, fontSize: 14.0),
                      ),
                      Expanded(child: Container()),
                      Text(
                        landmark.state,
                        style: TextStyle().copyWith(fontWeight: FontWeight.w500, fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mapView() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(landmark.coordinates.latitude, landmark.coordinates.longitude),
        zoom: 13.70,
      ),
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
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
                color: const Color(0x22000000),
                blurRadius: 10.0,
                spreadRadius: 10.0,
              ),
            ],
            borderRadius: const BorderRadius.all(const Radius.circular(125.0)),
          ),
          width: 250.0,
          height: 250.0,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(const Radius.circular(120.0)),
            child: Image.asset('assets/${landmark.imageName}.jpg'),
          ),
        ),
      ),
    );
  }
}
