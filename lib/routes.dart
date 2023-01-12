import 'package:examen_2p/detallle.dart';
import 'package:examen_2p/home.dart';
import 'package:flutter/material.dart';

Map <String, WidgetBuilder> getRoutes(BuildContext context){
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    '/detalles': (BuildContext context) => DetallePage(),
  };
}