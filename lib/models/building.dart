import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class Building{
  final String name;
  final GeoPoint location;

  Building({
    required this.name,
    required this.location
  });

  factory Building.fromData(dynamic data){
    return Building(name: data['name'], location: data['location']);
  }
}