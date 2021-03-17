import 'dart:async';

import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  ListviewPage({Key key}) : super(key: key);

  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {

  List<int> _numeros = new List();
  int _ultimoIndex = 0;
  bool isLoading = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    _agregarImagenes();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ]
      ) 
    );
  }

  Widget _crearLista(){
    return RefreshIndicator(
        onRefresh: obtenerPagina1,  
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _numeros.length,
        itemBuilder: (BuildContext context, int index){

          final imagen = _numeros[index];

          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage('https://picsum.photos/500/300?image=$imagen')
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async{
    final duration = Duration(seconds: 2);
    new Timer(duration, (){
      _numeros.clear();
      _ultimoIndex++;
      _agregarImagenes();
    });

    return Future.delayed(duration);
  }

  void _agregarImagenes(){
     for (var i = 1; i <= 10; i++) {
       _ultimoIndex ++;
       _numeros.add(_ultimoIndex);
     }
     
     setState((){});
  }

  Future<Null> fetchData() async{
    isLoading = true;
    setState((){});

    final Duration duration = new Duration(seconds: 5);

    new Timer(duration, respuestaHTTP);

    return Future.delayed(duration);

  }

  void respuestaHTTP(){
     isLoading = false;

      _scrollController.animateTo(
        _scrollController.position.pixels + 100, 
        duration: Duration(milliseconds: 250), 
        curve: Curves.fastOutSlowIn
      );

     _agregarImagenes();
  }

  Widget _crearLoading(){
    return isLoading ? Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator()
          ],
        ),
        SizedBox(height: 15.0),
      ],
    ) : Container();
  }

}