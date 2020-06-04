import 'package:flutter/material.dart';
import 'package:imovelapp/cadastroimovel.dart';
import 'package:imovelapp/sidemenu-menu.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashBoard(),
    );
  }
}

class DashBoard extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[700],
          leading: IconButton  ( icon: Icon(Icons.list),
            onPressed:  () {
            Navigator.push(
                        context, 
                      MaterialPageRoute (
                        builder: (context) => SideMenu (),
          ) , ); } )
          
        
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: CustomPaint(
                painter: ShapesPainter(),
                child: Container(
                  height: size.height / 2,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: menuItems(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> menuItems() {
    List<Widget> list = List();
    for (var i = 0; i <= 5; i++) {
      list.add(createGridItem(i));
    }
    return list;
  }

  Widget createGridItem( position) {
    var color = Colors.white;
    var icondata = Icons.add;
    var descricaoBotao = "";

    switch ( position) {
      case 0: // Imoveis
        icondata = Icons.home;
        descricaoBotao = "Imóveis";
        break ;
      case 1: //Adicionar Imovel
        icondata = Icons.add_box;
        descricaoBotao = "Adicionar Imóvel";
        break; 
      case 2:// Perfil
        icondata = Icons.person;
        descricaoBotao = "Perfil";
        break;
      case 3:// Transações
        icondata = Icons.swap_horiz;
        descricaoBotao = "Transações";
        break;
      case 4: // Contatos
        icondata = Icons.group;
        descricaoBotao = "Contatos";
        break;
      case 5: // Sair
        icondata = Icons.highlight_off;
        descricaoBotao = "Sair";
        break;
    }

    color = Colors.deepPurple;

    return Builder(builder: (context) {
      return Padding(
        padding:
            const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
        child: Card(
          elevation: 10,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.white),
          ),
          child: InkWell(
            onTap: () { 
                            Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Selected Item $position")));
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    icondata,
                    size: 40,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      descricaoBotao,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
      ;
    });
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the paint color to be white
    paint.color = Colors.white;
    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);
    paint.color = Colors.orange[600];
    // create a path
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    // close the path to form a bounded shape
    path.close();
    canvas.drawPath(path, paint);
    /* // set the color property of the paint
    paint.color = Colors.deepOrange;
    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, size.height / 2);
    // draw the circle with center having radius 75.0
    canvas.drawCircle(center, 75.0, paint);*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
