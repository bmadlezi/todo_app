import 'package:flutter/material.dart';
import 'home.dart';

class Favourite extends StatefulWidget {
  late List favouritesList = [];

  Favourite({required this.favouritesList});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(50.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Card(),
        ),
    );
  }
}




