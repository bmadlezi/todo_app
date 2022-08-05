import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'favourite_todos.dart';
import 'location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final myControl = TextEditingController();
  late List todos = [];
  late List favourites = [];

  TodoItem item = TodoItem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Todo App'),
        elevation: 0.0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Favourite(favouritesList: favourites);
                  }
                )
              );
            },
            icon: const Icon(Icons.list),
         )
        ]
      ),
      body:  buildListView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: showPopUpDialog,
        child: const  Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose(){
    myControl.dispose();
    super.dispose();
  }

  String getTodos(index){
    return todos[index];
  }

  Future<void> showPopUpDialog(){
    return showDialog<void>(
      context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add todo item'),
          content: dialogContent(context),
        );
      }
    );
  }

  Widget buildListView() {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) =>
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              child: Card(
                elevation: 7,
                color: Colors.white,
                child: Row(
                  children: [

                    //the main text wrapper starts
                    Expanded(
                      flex: 8,
                      child:  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              todos[index],
                              style:  TextStyle(fontSize: 22, color: Colors.grey[900])

                            ),

                          ],
                       )
                      )
                    ),

                    //Right icon buttons wrapper
                    Expanded(
                      flex: 2,
                      child: Container(

                        color: Colors.blueAccent,
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: (){
                              setState(() {
                                todos.remove(todos[index]);
                              });
                            } ,icon: const Icon(Icons.delete, size: 40), color:Colors.redAccent,splashColor: Colors.grey,),

                            FavoriteButton(
                              isFavorite: false,
                              valueChanged: (isFavorite) {
                                isFavorite ? favourites.add(todos[index]) : favourites.remove(todos[index]);
                              },
                            ),
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
      );

  }

  void deleteTodoItem(index){
    setState(() {
      todos.remove(todos[index]);
    });
  }

  void addItemToFavorites(item){

  }

  Widget dialogContent(context) {
    return  Container(
        width: 260.0,
        height: 230.0,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: myControl,
              decoration: const InputDecoration(
                  hintText: 'meet with jane',
                  labelText: 'Enter dodo',
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20.0),
            RaisedButton(
              onPressed: () {
                setState((){
                  //remove text after adding item
                  //remove dialog after adding item
                  myControl.text.isEmpty? null: todos.add(myControl.text);
                  myControl.clear();
                  Navigator.pop(context);
                });
              },
              color: Colors.cyan,
              child: const Text('ADD'),
            )
          ],
        ),
      );
  }
}

class TodoItem{
  late String itemName;
}
