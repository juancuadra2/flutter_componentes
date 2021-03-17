import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _mostrarAlert(context),
          child: Text("Mostrar alerta"),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Volver",
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text("Alerta 1"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contenido de la alerta'),
              FlutterLogo( size: 100 ),
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
              color: Colors.red,
              shape: StadiumBorder(),
            ), 
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Aceptar"),
              color: Colors.blue,
              shape: StadiumBorder(),
            ),
          ],
        );
      }
    );
  }


}