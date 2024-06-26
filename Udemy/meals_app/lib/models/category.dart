import 'package:flutter/material.dart';
import 'dart:ui';

class Category {
  Category({required this.id,
    this.color = Colors.orange,
    required this.title});

  final String id;
  final String title;
  final Color color;

}