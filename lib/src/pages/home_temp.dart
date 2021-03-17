import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis', 'Siete', 'Ocho', 'Nueve', 'Diez'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: _crearItemsCorta(),
      ),
    );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (var opc in opciones) {
      final listTile = ListTile(
        title: Text(opc),
      );
      lista..add(listTile)
        ..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorta(){
    
    return opciones.map((opc){
      return Column(
        children: [
          ListTile(
            leading: Icon(Icons.whatshot_sharp),
            title: Text(opc),
            subtitle: Text('Subtitulo'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              
            },
          ),
          Divider()
        ],
      );
    }).toList();

  }

}