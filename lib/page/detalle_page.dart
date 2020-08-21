import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class DetallesPagina extends StatefulWidget {
  final nombre;
  final precio;
  final imagen;
  //creamos el constructor
  const DetallesPagina({this.nombre, this.precio, this.imagen});

  @override
  _DetallesPaginaState createState() => _DetallesPaginaState();
}

class _DetallesPaginaState extends State<DetallesPagina> {
  //creamos dos variables enteras que es contadores y el total
  int _contador = 0;
  int _total = 0;

//funcion para que cuando le presionamos el + nos aumente
  void _incrementandoContador() {
    setState(() {
      _contador++;
      Toast.show("mas", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    });
  }

  void _decrementoContador() {
    setState(() {
      if (_contador > 0) {
        _contador--;
        Toast.show("menos", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
      Toast.show("la cantida no puede ser menor a cero", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    });
  }

  void _calcular() {
    var numero1 = widget.precio;
    int numero2 = _contador;
    int resultado = numero1 * numero2;
    setState(() {
      _total = resultado;
      print(_total);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFD0202),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.restaurant_menu),
              onPressed: null,
              color: Colors.white),
        ],
        title: Text(
          'Detalle',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          //Stack para que la imagen se monte
          Stack(
            //trae un arreglo de children
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 102.2,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              //este es el widget que mas vamos a utilizar bastante vamos a posicionar las imagen, texto, lista entrada de texto etc
              Positioned(
                top: 15.0,
                right: 80.0,
                bottom: 25,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE6E4EB),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(45.0),
                      bottomRight: Radius.circular(45.0),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              //widget para la imagen
              Positioned(
                top: (MediaQuery.of(context).size.width / 2) + 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 47.0,
                child: Hero(
                  tag: widget.imagen,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE6E4EB),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),

                      ///que me traiga la imagen
                      image: DecorationImage(
                          image: AssetImage(widget.imagen), fit: BoxFit.cover),
                    ),
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
              ),
              //pintamos el precio, el nombre del producto la cantidad y creamos otro container para aumentar o disminuir
              Positioned(
                top: 50.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  //que me pinte una columna
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.nombre,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.black),
                    ),
                    //salto de linea
                    SizedBox(
                      height: 28.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Precio: ',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: Colors.black),
                        ),
                        Text(
                          widget.precio.toString(),
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: Colors.black),
                        ),
                      ],
                    ),

                    //salto de linea
                    SizedBox(
                      height: 28.0,
                    ),
                    Text(
                      'Cantidad: $_contador',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.black),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        //funcione de incrementar y dismunuir
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 6.0,
                              color: Colors.blue[400],
                              offset: Offset(0.0, 1.0))
                        ],
                        //le damos una sombra
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(45.0),
                          bottomLeft: Radius.circular(45.0),
                        ),
                      ),
                      margin: EdgeInsets.only(top: 20.0),
                      padding: EdgeInsets.all(8.0),
                      //lo ubicamos en la parte izquierda y que quede de forma vertical
                      child: new Column(
                        children: <Widget>[
                          SizedBox(
                            //espacio
                            height: 28.0,
                          ),
                          new IconButton(
                            icon: new Icon(Icons.add, color: Colors.yellow),
                            onPressed: () {
                              setState(() {
                                _incrementandoContador();
                                _calcular();
                              });
                            },
                          ),
                          new IconButton(
                            icon: new Icon(Icons.fiber_manual_record),
                            onPressed: () {},
                          ),
                          SizedBox(
                            //espacio
                            height: 28.0,
                          ),
                          new IconButton(
                            icon: new Icon(Icons.remove, color: Colors.yellow),
                            onPressed: () {
                              setState(() {
                                _decrementoContador();
                                _calcular();
                              });
                            },
                          ),
                          SizedBox(
                            //espacio
                            height: 28.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      padding: EdgeInsets.all(20.0),
                      height: 60.0,
                      width: 180.0,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6.0,
                              color: Colors.blue[400],
                              offset: Offset(0.0, 1.0),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(75.0),
                            bottomLeft: Radius.circular(25.0),
                          ),
                          color: Colors.grey[700]),
                      child: Text(
                        'Total: $_total',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
