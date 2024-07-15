import 'package:flutter/material.dart';
import '../models/place.dart';

class PlacesList extends StatelessWidget{
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: places.length,
        itemBuilder: (ctx,index) {
      return ListTile(
        title: Text(places[index].title, style: Theme.of(context).textTheme.titleMedium!.
        copyWith(color: Theme.of(context).colorScheme.surface),),
      );
    }
    );
  }

}