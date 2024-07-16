// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_null_comparison, deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Function(double? i)? onRatingChanged;
  Color? color;
  Color? unselectedColor;
  final double iconSize;

      StarRating(
      {this.starCount = 5,
        this.rating = .0,
        this.onRatingChanged,
        this.unselectedColor,
        this.iconSize = 20,
        this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: unselectedColor,
        size: iconSize,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
        size: iconSize,
      );
    } else {
      icon = Icon(
        Icons.star,
        size: iconSize,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return InkResponse(
      onTap:
      onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        List.generate(starCount, (index) => buildStar(context, index)));
  }
}
