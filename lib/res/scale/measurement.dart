import 'package:flutter/material.dart';
import 'package:tdd_test/services/navigation/navigation_service.dart';

class Measurement {
  final double _height =
      MediaQuery.of(NavigationService().getContext()!).size.height;
  final double _width =
      MediaQuery.of(NavigationService().getContext()!).size.width;
  final double _aspectRatio =
      (MediaQuery.of(NavigationService().getContext()!).size.width / 360);

  static final _device = Measurement._internal();
  Measurement._internal();

  factory Measurement() {
    return _device;
  }

  double height() {
    return _height;
  }

  double width() => _width;

  double _sizeByAspectRatio(double value) {
    return value * _aspectRatio;
  }

  double aspectRatio(double value) {
    return value * _aspectRatio;
  }

  double sizeByHeight(double value) {
    return _sizeByAspectRatio(value);
  }

  double sizeByWidth(double value) {
    return _sizeByAspectRatio(value);
  }

  double textSize(double value) {
    return _sizeByAspectRatio(value);
  }

  double margin(double value) {
    return _sizeByAspectRatio(value);
  }

  double padding(double value) {
    return _sizeByAspectRatio(value);
  }

  double radius(double value) {
    return _sizeByAspectRatio(value);
  }

  double fullWidth() {
    return _width;
  }
}

final Measurement measurement = Measurement();
