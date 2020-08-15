import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {

  double deviceWidth;

  @override
  Widget build(BuildContext context) {

    deviceWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)
            ),
            child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(chat.sender.imageUrl),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chat.sender.name,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),),

                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            width: deviceWidth<500? 0:deviceWidth/2.0, //responsive message section
                            child: Text(chat.msg,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),),
                          )
                        ],
                      )
                    ]
                  ),
                  Column(
                    children: [
                      Text(chat.time),
                      Text('NEW')
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
