import 'dart:io';


class PlaceInformation {

  final double lititude;
  final double longtude;
  final String address;

  PlaceInformation({this.lititude, this.longtude, this.address});
}




class Place {
  final String id;
  final String title;
  final File image;

  final PlaceInformation location;

  Place({this.id, this.title, this.image, this.location});
}
