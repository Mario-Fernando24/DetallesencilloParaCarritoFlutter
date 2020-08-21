import 'package:calculocarrito/page/detalle_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculo carrito',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF0000),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Row(
              children: <Widget>[
                Text('comidas a domicilios',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white)),
              ],
            ),
          ),
          //ocupamos un container
          SizedBox(
            height: 20.0,
          ),

          Container(
            //se adapta a cualquier dispositivo
            height: MediaQuery.of(context).size.height - 105.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(75.0),
                bottomLeft: Radius.circular(75.0),
              ),
            ),

            child: ListView(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 200 - 0,
                    //listado de los hijos
                    child: GridView.count(
                      //va hacer de dos columnas
                      crossAxisCount: 2,
                      mainAxisSpacing: 0.1,
                      childAspectRatio: 0.700,
                      children: <Widget>[
                        //por ahora asi como no se conecta a una base de dato
                        _comidasItem(
                            'Hamburguesa', 6000, 'assets/images/carrito1.jpeg'),
                        _comidasItem(
                            'Pizza', 14000, 'assets/images/carrito2.jpg'),
                        _comidasItem('Perro caliete', 26700,
                            'assets/images/carrito3.jpg'),
                        _comidasItem(
                            'Empanada', 1000, 'assets/images/carrito4.jpg'),
                        _comidasItem('Arepa con chorizo', 4000,
                            'assets/images/carrito5.jpg'),
                        _comidasItem(
                            'Arepa mixta', 5500, 'assets/images/carrito6.jpg'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _comidasItem(String nombre, int precio, String imagen) {
    //que retorne un paddin
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Container(
        child: new Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: Color(0xFFE6E4EB),
          elevation: 5,
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: imagen,
                child: new Material(
                  child: Container(
                    color: Color(0xFFE6E4EB),
                    //InkWell al mometo de presionarlo haga determinada cosaa
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (context) => DetallesPagina(
                                    nombre: nombre,
                                    precio: precio,
                                    imagen: imagen,
                                  ))),
                      child: new Image.asset(
                        imagen,
                        fit: BoxFit.contain,
                        width: 130,
                        height: 130,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3.0),
              ),
              Text(
                nombre,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.all(3.0),
              ),
              Text(
                precio.toString(),
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
