import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorites Contacts',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      size: 30,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {})
              ],
            ),
          ),

          //Fav Contacts Images
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                            favList[index].imageUrl,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        favList[index].name,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
