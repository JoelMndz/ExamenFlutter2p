import 'package:examen_2p/detallle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Examen'),
      ),
      body: FutureBuilder(
        initialData: [],
        future: getAll(),
        builder:(context, snapshot){
          return ListView(
            children: items(snapshot),
          );
        },
      ),
    );
  }

  List<Widget> items(var snapshot){
    List<Widget> lista = [];
    for (var i in snapshot.data){
      lista.add(
        ListTile(
          title: Center(
            child: Text(i['name']),
          ),
          onTap: ()=> Navigator.pushNamed(context, '/detalles',arguments: DetalleArgs(i['name'])),
        )
      );
      lista.add(Divider());
    }
    return lista;
  }

  Future<List<dynamic>> getAll() async{
    http.Response response = await http.get(Uri.https('pokeapi.co','api/v2/pokemon'));
    Map datos = json.decode(response.body);
    return datos['results'];
  }
}