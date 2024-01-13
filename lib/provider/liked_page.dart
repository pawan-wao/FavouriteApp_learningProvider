import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'fav.dart';

 class LikedPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    //creating instance of provider
    final provider = Provider.of<FavProvider>(context);
    return MaterialApp(
      home: Scaffold(
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
        body: SafeArea(
          child: Column(
            children: [
              Consumer<FavProvider>(
                builder: (context, value, child) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: value.selectedItems.length,
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
        ),
      ),
    );
  }
}