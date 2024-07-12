import 'dart:convert';
import 'package:flutter/services.dart';

class Services {
  final String id;
  final String title;
  final String image;
  final int basketNumber;

  Services({
    required this.title,
    required this.basketNumber,
    required this.id,
    required this.image,
  });
}
