import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 30.0;
  bool _bloquearSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget  _crearSlider(){
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _valorSlider,
      min: 0.0,
      max: 400.0, 
      onChanged: _bloquearSlider ? null : (value) {
        setState(() {
          _valorSlider = value;
        });
      },
    );
  }

  Widget _crearCheckbox() {
    // return Checkbox(
    //   value: _bloquearSlider, 
    //   onChanged: (value) {
    //      setState(() {
    //        _bloquearSlider = !_bloquearSlider;
    //      });
    //   },
    // );

    return CheckboxListTile(
      value: _bloquearSlider,
      title: Text('Bloquear slider'),
      onChanged: (value){
        setState(() {
          _bloquearSlider = value;
        });
      },
    );

  }

  Widget _crearSwitch(){
    return SwitchListTile(
      value: _bloquearSlider,
      title: Text('Bloquear slider'), 
      onChanged: (value) {
        setState(() {
          _bloquearSlider = value;
        });
      },
    );
  }

  Widget _crearImagen(){
    return Image(
      image: NetworkImage('https://assets.stickpng.com/images/580b57fbd9996e24bc43c066.png'),
      width: _valorSlider,
      fit: BoxFit.contain
    );
  }


}