import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum CardStatus {like, dislike, save}

class CardProvider extends ChangeNotifier {
  List<String> _urlImages = [];
  bool _isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  List<String> get urlImages => _urlImages;
  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;

  CardProvider() {
    resetUsers();
  }

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details){
    _isDragging = true;

    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details){
    _position += details.delta;
    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;
    notifyListeners();
  }

  void endPosition() {
    _isDragging = false;
    notifyListeners();

    final status = getStatus(force: true);

    if (status!=null) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
        msg: status.toString().split('.').last.toUpperCase(),
        fontSize:36,
      );
    }

    switch (status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      case CardStatus.save:
        save();
        break;
      default:
        resetPosition();
    }

    resetPosition();

  }

  void resetPosition () {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  double getStatusOpacity() {
    final delta = 100;
    final pos = max(_position.dx.abs(), _position.dy.abs());
    final opacity = pos / delta;
    
    return min(opacity,1);
  }
  CardStatus? getStatus({bool force = false}) {
    final x = _position.dx;
    final y = _position.dy;
    final forceSave = x.abs() < 20;

    if (force) {
    final delta = 100;
    if (x >= delta) {
      return CardStatus.like;
    } else if (x <= -delta) {
      return CardStatus.dislike;
    } else if (y <= -delta / 2 && forceSave) {
      return CardStatus.save;
    }
  } else {
    final delta = 20;
    if (y<= -delta * 2 && forceSave) {
      return CardStatus.save;
    } else if (x>= delta) {
      return CardStatus.like;
    } else if (x <= -delta) {
      return CardStatus.dislike;
    }
  }
  }

    void dislike() {
    _angle = -20;
    _position -= Offset(2* _screenSize.width, 0);
    _nextCard();

    notifyListeners();
    }

    void like() {
      _angle = 20;
      _position += Offset(2 * _screenSize.width, 0);
      _nextCard();

      notifyListeners();
    }

    void save() {
    _angle =0;
    _position -= Offset(0, _screenSize.height);
    _nextCard();

    notifyListeners();
    }

    Future _nextCard() async {
      if (_urlImages.isEmpty) return;

      await Future.delayed(Duration(milliseconds: 200));
      _urlImages.removeLast();
      resetPosition();
    }


    void resetUsers() {
      _urlImages = <String>[
      // 'https://media.licdn.com/dms/image/C5603AQGfdV4lIIHFmg/profile-displayphoto-shrink_400_400/0/1617316486467?e=1682553600&v=beta&t=hJqKXJ7HEO95jn-C8CuFeSBFBleMIbrMV3eDoIdi0e0'
      'https://images.unsplash.com/photo-1526512340740-9217d0159da9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmVydGljYWx8ZW58MHx8MHx8&w=1000&q=80'
      'https://images.unsplash.com/photo-1526512340740-9217d0159da9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmVydGljYWx8ZW58MHx8MHx8&w=1000&q=80'
      'https://images.unsplash.com/photo-1526512340740-9217d0159da9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmVydGljYWx8ZW58MHx8MHx8&w=1000&q=80'
      'https://images.unsplash.com/photo-1526512340740-9217d0159da9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmVydGljYWx8ZW58MHx8MHx8&w=1000&q=80'
      // 67YbTsxUMdbGc2Ww9O0Yv&ust=1677026636242000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCPDt252xpf0CFQAAAAAdAAAAABAq'
      ].reversed.toList();
      notifyListeners();
    }
  }
