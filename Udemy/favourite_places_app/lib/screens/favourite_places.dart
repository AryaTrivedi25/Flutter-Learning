import 'package:favourite_places_app/screens/add_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favourite_places_app/widgets/places_list.dart';

class FavouritePlacesScreen extends ConsumerStatefulWidget{
  const FavouritePlacesScreen({super.key});

  @override
  ConsumerState<FavouritePlacesScreen> createState() => _FavouritePlacesState();
}

class _FavouritePlacesState extends ConsumerState<FavouritePlacesScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(onPressed: (){const AddPlaceScreen();}, icon: const Icon(Icons.add)),
        ],
      ),
      body: PlacesList(places: [],),
    );
  }
}