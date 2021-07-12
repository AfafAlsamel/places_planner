import 'package:flutter/material.dart';
import 'package:places_planner_app/providers/greate_places.dart';
import 'package:provider/provider.dart';
import 'screens/add_place_screen.dart';
import './screens/places_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider (
      create:(ctx)=> GreatePlaces(),
      child: MaterialApp(
        title: 'Grreat PLaces',
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
        ),
        home: PLacesListScreen(),
        routes: {
        AddPLaceScreen.namedRoute : (ctx) => AddPLaceScreen(),
        }
      ),
    );
  }
}




