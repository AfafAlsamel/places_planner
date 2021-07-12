import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/location_input.dart';
import '../widgets/image_input.dart';
import '../providers/greate_places.dart';


class AddPLaceScreen extends StatefulWidget {
  static const namedRoute = '/add-place';

  @override
  _AddPLaceScreenState createState() => _AddPLaceScreenState();
}

class _AddPLaceScreenState extends State<AddPLaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage ;

  void _selectedImage (File pickedImage){
    _pickedImage = pickedImage ;
  }

 void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatePlaces>(context, listen: false)
        .AddNewPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add new place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'title',
                    ),
                    controller: _titleController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(_selectedImage ),
                  LocationInput(),
                ],
              ),
            ),
          )),
          Text('User input'),
          RaisedButton.icon(
            onPressed: _savePlace,
            icon: Icon(
              Icons.add,
            ),
            label: Text('add place'),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
