import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:componentes/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
      ],
      title: 'Componentes',
      initialRoute: '/',
      routes: getApplicationRoutes(),//Rutas de la aplicacion
      onGenerateRoute: (settings) {
        return getOnGeneratedRoute(context);//Redireccion cuando no hay ruta
      },
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
    );
  }

}