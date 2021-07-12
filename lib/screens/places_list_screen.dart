import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/greate_places.dart';
import './add_place_screen.dart';

class PLacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPLaceScreen.namedRoute);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatePlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatePlaces>(
                child: Center(
                  child: const Text('Got no places yet, start adding some!'),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
                    ? ch
                    : ListView.builder(
                        itemCount: greatPlaces.items.length,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              greatPlaces.items[i].image,
                            ),
                          ),
                          title: Text(greatPlaces.items[i].title),
                          onTap: () {
                            // Go to detail page ...
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
