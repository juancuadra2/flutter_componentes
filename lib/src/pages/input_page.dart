import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';
  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric( horizontal: 10, vertical: 20),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput(){
    return TextField(
       textCapitalization: TextCapitalization.sentences,
       decoration: InputDecoration(
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20), 
         ),
         counter: Text('Letras: ${ _nombre.length }'),
         hintText: 'Nombre',
         labelText: 'Nombre',
         helperText: 'Solo es el nombre',
         suffixIcon: Icon(Icons.accessibility),
         icon: Icon(Icons.account_circle)
       ),
       onChanged: (value) {
         setState((){
          _nombre = value;
         });
       },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email_outlined),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _crearPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (value){
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        labelText: 'Fecha',
        suffixIcon: Icon(Icons.date_range_sharp),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context); 
      },
    );
  }

  _selectDate(BuildContext context) async{

    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(1995), 
      lastDate: new DateTime(2050),
      locale: Locale('es', 'ES')
    );

    if(picked != null){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
 
  }

  List<DropdownMenuItem<String>> getItemsDropdown(){
    
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((element) {
      lista.add(
        DropdownMenuItem(
          child: Text(element), 
          value: element,
        )
      );
    });

    return lista; 

  }

  Widget _crearDropdown(){
    
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 25.0,),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getItemsDropdown(), 
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
                print(opt);
              });
            },
          ),
        ),
        
      ],
    );    
  }



}