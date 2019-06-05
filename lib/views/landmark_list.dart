import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:landmarks_flutter/models/landmark.dart';
import 'package:landmarks_flutter/views/landmark_cell.dart';

class LandmarkList extends StatefulWidget {
  final List<Landmark> landmarks;
  final Function(Landmark) onSelected;

  LandmarkList({
    Key key,
    @required this.landmarks,
    @required this.onSelected,
  }) : super(key: key);

  @override
  _LandmarkListState createState() => _LandmarkListState();
}

class _LandmarkListState extends State<LandmarkList> {
  final _animatedListKey = GlobalKey<AnimatedListState>();
  List<Landmark> _landmarks;

  AnimatedListState get _animatedList => _animatedListKey.currentState;

  @override
  void initState() {
    super.initState();
    _landmarks = List.from(widget.landmarks);
  }

  @override
  void didUpdateWidget(LandmarkList oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If landmarks are identical, do nothing
    if (const ListEquality().equals(oldWidget.landmarks, widget.landmarks)) {
      return;
    }

    // Remove any landmark rows no longer present in the new list
    for (final landmark in List.from(_landmarks)) {
      if (!widget.landmarks.contains(landmark)) {
        final index = _landmarks.indexOf(landmark);
        _landmarks.remove(landmark);
        _animatedList.removeItem(index, (context, animation) {
          return _buildCell(landmark, animation);
        });
      }
    }

    // Insert landmark rows not present in the old list
    for (final landmark in widget.landmarks) {
      if (!_landmarks.contains(landmark)) {
        _landmarks.add(landmark);
        final index = _landmarks.indexOf(landmark);
        _animatedList.insertItem(index);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _animatedListKey,
      shrinkWrap: true,
      initialItemCount: widget.landmarks.length,
      itemBuilder: (BuildContext context, int index, Animation<double> animation) {
        final landmark = widget.landmarks[index];
        return GestureDetector(
          onTap: () => widget.onSelected(landmark),
          child: _buildCell(landmark, animation)
        );
      },
    );
  }

  Widget _buildCell(Landmark landmark, Animation<double> animation) {
    return SizeTransition(
      axis: Axis.vertical,
      sizeFactor: animation,
      child: LandmarkCell(key: ValueKey(landmark.id), landmark: landmark)
    );
  }
}
