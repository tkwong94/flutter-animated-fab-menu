library animated_fab_menu;

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddFab extends StatefulWidget {
  AddFab(
      {Key key,
      this.menu,
      this.icon,
      this.btnSize = 50,
      this.expandHeight = 300,
      this.expandWidth = 200,
      this.color = Colors.blue,
      this.colorTo = Colors.white})
      : super(key: key);

  Widget menu;
  Widget icon;
  double btnSize;
  double expandHeight;
  double expandWidth;
  Color color;
  Color colorTo;

  @override
  _AddFabState createState() => _AddFabState();
}

class _AddFabState extends State<AddFab> {
  var _isMenuOpen = false;

  double _btnSize;
  double _height;
  double _width;
  Color _color;
  Color _colorTo;

  @override
  Widget build(BuildContext context) {
    _btnSize = widget.btnSize;
    _height = widget.expandHeight;
    _width = widget.expandWidth;
    _color = widget.color;
    _colorTo = widget.colorTo;

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          GestureDetector(
            onTap: () => setState(() {
              this._isMenuOpen = false;
            }),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              color: _isMenuOpen ? Colors.black54 : Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AnimatedContainer(
              width: _isMenuOpen ? _width : _btnSize,
              height: _isMenuOpen ? _height : _btnSize,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isMenuOpen ? _colorTo : _color),
              alignment: AlignmentDirectional.bottomEnd,
              duration: Duration(milliseconds: 500),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: _height,
                      maxWidth: _width,
                      minHeight: _btnSize,
                      minWidth: _btnSize),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _isMenuOpen ? widget.menu : Container(),
                      _isMenuOpen
                          ? Container()
                          : GestureDetector(
                              onTap: () => setState(() {
                                    this._isMenuOpen = true;
                                  }),
                              child: widget.icon),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
