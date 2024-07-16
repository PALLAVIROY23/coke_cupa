import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class Customshape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width /5, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;

    // TODO: implement getClip
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
  }

