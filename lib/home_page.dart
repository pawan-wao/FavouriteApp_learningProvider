import 'package:favouriteapp_learningprovider/provider/liked_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/fav.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // creating instance of provider class
    final provider = Provider.of<FavProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Favourites"),
          actions: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LikedPage(),));
              },
                child: Icon(Icons.favorite_rounded
                )),
            SizedBox(
              width: 24,
            ),
          ],
        ),
        body: Column(
          children: [
            Consumer<FavProvider>(
              builder: (context, value, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: 25,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          //calling provider callas method
                          if (value.selectedItems.contains(index)) {
                            value.heartremove(index);
                          } else {
                            value.heartLiked(index);
                          }
                        },
                        title: Text("Item " + index.toString()),
                        trailing: value.selectedItems.contains(index)
                            ? Icon(Icons.favorite_rounded)
                            : Icon(Icons.favorite_border_rounded),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
    );
  }
}
