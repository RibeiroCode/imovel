import 'package:flutter/material.dart';
import 'package:imovelapp/ExemploContato.dart';
import 'package:imovelapp/menu.dart';
import 'package:imovelapp/meuperfil.dart';

class Contatos extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xfffb8c00),
              title: Text('Meus Contatos',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            body: Column(children: [
              Container(
                height: 40,
                alignment: Alignment.center,
                child: FlatButton(
                    child: Text(
                      "CONTATO 1", style: TextStyle (fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red),
                      textAlign: TextAlign.right,
                    ),
                    
                    onPressed: () {
                      Navigator.push(
                        context, 
                      MaterialPageRoute (
                        builder: (context) => ExemploContato (),
                 ) , ) ;
                    }
                      
                      ), ),
                      Container(
                height: 40,
                alignment: Alignment.center,
                child: FlatButton(
                    child: Text(
                      "CONTATO 2", style: TextStyle (fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red),
                      textAlign: TextAlign.right,
                    ), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                      MaterialPageRoute (
                        builder: (context) => MeuPerfil (),
                 ) , ) ;
                    }
                      
                      ), ),
                      Container(
                height: 40,
                alignment: Alignment.center,
                child: FlatButton(
                    child: Text(
                      "CONTATO 3", style: TextStyle (fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red),
                      textAlign: TextAlign.right,
                    ), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                      MaterialPageRoute (
                        builder: (context) =>ExemploContato (),
                 ) , ) ;
                    }
                      
                      ), ),
                      Container(
                height: 40,
                alignment: Alignment.center,
                child: FlatButton(
                    child: Text(
                      "CONTATO 4", style: TextStyle (fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red),
                      textAlign: TextAlign.right,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, 
                      MaterialPageRoute (
                        builder: (context) => ExemploContato (),
                 ) , ) ;
                    }
                      
                      ), ),
                      Stack( children: [
                 Positioned(
                 child: IconButton ( icon: Icon (Icons.arrow_back),
                 onPressed: () {
                   Navigator.push (context, MaterialPageRoute (builder: ( context) => Menu () ));
                 },
                   ),
                 ),
            ])
                      ],
                )));
                      
                
           
           
  }
}

 