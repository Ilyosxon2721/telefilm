import 'package:flutter/material.dart';

class SliverAppBarTitleStatus extends StatefulWidget {
  final Widget child;
  const SliverAppBarTitleStatus({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  _SliverAppBarTitleStatusState createState() {
    return _SliverAppBarTitleStatusState();
  }
}

class _SliverAppBarTitleStatusState extends State<SliverAppBarTitleStatus> {
  ScrollPosition? _position;
  bool _visible = true;
  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context).position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: widget.child,
    );
  }
}
