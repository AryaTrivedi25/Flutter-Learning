import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favourite_places_app/widgets/places_list.dart';

class FavouritePlaces extends ConsumerStatefulWidget{
  const FavouritePlaces({super.key});

  @override
  ConsumerState<FavouritePlaces> createState() => _FavouritePlacesState();
}

class _FavouritePlacesState extends ConsumerState<FavouritePlaces> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
        ],
      ),
      body: PlacesList(places: [],),
    );
  }
}