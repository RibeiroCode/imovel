
import 'package:flutter/material.dart';
import 'package:imovelapp/contatos.dart';

class ExemploContato extends StatelessWidget {
  Widget build (BuildContext context) {
    return MaterialApp (
      home: Scaffold (
        body: Column (
          children: [ Container (
              child: Text ('IMAGEM',
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize: (30), color: Colors.red)),
                     
              padding: EdgeInsets.all(16),),

               Container (
              child: Text('NOME DO CONTATO: xxxxxxxxxxxx',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              padding: EdgeInsets.all(16),
              
            ),
            Container (
              child: Text('CRECI DO CONTATO: xxxxxxxxxxxx',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              padding: EdgeInsets.all(16), ),

              Container (
              child: Text('CONTATOS DO CONTATO: xxxxxxxxxxxx',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              padding: EdgeInsets.all(16), ),
             
              Stack(
                 children: [
                   
                 Positioned(  
                 child: IconButton ( icon: Icon (Icons.arrow_back) ,
                 onPressed: () {
                   Navigator.push (context, MaterialPageRoute (builder: ( context) => Contatos () ));
                 } ,
                  ),
                 ),
                 Padding ( padding: EdgeInsets.all (30 ),
                 ),
                 
            ]   )

      
            
             
          ])))  ;
  }
}