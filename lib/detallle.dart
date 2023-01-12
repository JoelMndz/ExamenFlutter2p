import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetallePage extends StatelessWidget {
  const DetallePage({super.key});

  @override
  Widget build(BuildContext context) {
    final DetalleArgs args = ModalRoute.of(context)?.settings.arguments as DetalleArgs;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Examen'),
      ),
      body: FutureBuilder(
        initialData: null,
        future: getName(args.name),
        builder:(context, snapshot){
          if(snapshot.data == null){
            return Container();
          }

          return Center(
            child: Column(
              children: datos(snapshot),
            ),
          );
        },
      ),
    );

  }

  Future<Map<String,dynamic>> getName(String name) async{
    http.Response response = await http.get(Uri.https('pokeapi.co','api/v2/pokemon/$name'));
    Map<String,dynamic> datos = json.decode(response.body);
    return datos;
  }
  
  List<Widget> datos(var snapshot) {
    return [
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 10,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 120,
                  backgroundColor: Colors.green,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    snapshot.data['name'],
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "${snapshot.data['weight']} Kg",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "${snapshot.data['height']} m",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ],
            ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
      ];
  }
}

class DetalleArgs{
  final String name;

  DetalleArgs(this.name);
}