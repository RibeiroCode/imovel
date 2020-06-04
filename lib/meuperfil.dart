import 'package:flutter/material.dart';
import 'package:imovelapp/menu.dart';

class MeuPerfil extends StatelessWidget {
  Widget build (BuildContext context) {
    return MaterialApp (
      home: Scaffold (
        body: Column (
          children: [ Container (
              child: Text ('MINHA IMAGEM',
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize: (30), color: Colors.red)),
                     
              padding: EdgeInsets.all(22),),

               Container (
              child: Text('MEU NOME: xxxxxxxxxxxx',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              padding: EdgeInsets.all(16),
              
            ),
            Container (
              child: Text('MEUS NOME: xxxxxxxxxxxx',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              padding: EdgeInsets.all(16), ),

              Container (
              child: Text('MEU CRECI: xxxxxxxxxxxx',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              padding: EdgeInsets.all(16), ),
              Container (
              child: Text('MEUS CONTATOS: xxxxxxxxxxxx',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              padding: EdgeInsets.all(16), ),
              Container (
              child: Text('MEUS IMOVEIS: xxxxxxxxxxxx',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              padding: EdgeInsets.all(16), ),
               Stack(
                 children: [
                   
                 Positioned(  
                 child: FlatButton ( color:Colors.black,
                   child: Text ('Editar', style: TextStyle (fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
                   textAlign: TextAlign.center),
                 onPressed: () {
                   Navigator.push (context, MaterialPageRoute  () );
                 } ,
                  ),
                 ),
                 Padding ( padding: EdgeInsets.all (30 ),
                 ),
                 
            ]   ),
             
              Stack(
                 children: [
                   
                 Positioned(  
                 child: IconButton ( icon: Icon (Icons.arrow_back) ,
                 onPressed: () {
                   Navigator.push (context, MaterialPageRoute (builder: ( context) => Menu () ));
                 } ,
                  ),
                 ),
                 Padding ( padding: EdgeInsets.all (30 ),
                 ),
                 
            ]   )

      
            
             
          ])))  ;
  }
}