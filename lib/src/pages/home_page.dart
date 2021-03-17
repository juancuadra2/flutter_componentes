import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
        centerTitle: true,
        elevation: 0,
      ),
      body: _lista(),
    );
  }

  Widget _lista(){

    menuProvider.cargarData().then((opciones){
      print(opciones);
    });

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){

        return ListView(
          children: _listaItems(snapshot.data, context),
        );

      }
    );

  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context){
    
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final item = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: (){

          Navigator.pushNamed(context, opt['ruta']);

        },
      );

      opciones..add(item)
        ..add(Divider());
    });

    return opciones;

  }

}