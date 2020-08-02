import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class JsonviaHTTP extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(

    debugShowCheckedModeBanner: false,
    title:  'Http-Json-BuildListView',
    home: BuildListView (),
    );
  }
}

class BuildListView extends StatefulWidget {
  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Lista de Usuarios'),
      ),
      body: listaUsuarios(),
    );
  }


listaUsuarios() {
  return ListView.builder(
    itemBuilder: (context, index) (
      return ListTile (
        title: Text ("minha lista")
      )
    ),);
  
}
}
