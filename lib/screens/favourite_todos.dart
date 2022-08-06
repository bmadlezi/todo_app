import 'package:flutter/material.dart';
import 'home.dart';
import 'package:favorite_button/favorite_button.dart';


class Favorites extends StatefulWidget {

   Favorites({super.key, required this.favoritesList});
   late List<String> favoritesList ;


  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  @override
  void initState(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        title: const Text('My favorites'),
          elevation: 0.0,
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: widget.favoritesList.length,
            itemBuilder: (context, index) => Card(
              elevation: 5,
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Row(
                      children: [
                        Text(
                         widget.favoritesList[index],
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)

                        ),
                      ],
                    )
                  ),

                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blueAccent,
                      height:  70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){
                              setState(() {
                                widget.favoritesList.remove(widget.favoritesList[index]);

                              });
                            } ,icon: const Icon(Icons.delete, size: 40), color:Colors.redAccent,splashColor: Colors.grey,),

                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}




