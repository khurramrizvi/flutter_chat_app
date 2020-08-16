import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final double deviceWidth = MediaQuery.of(context).size.width;

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
              return GestureDetector(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_){
                      return ChatScreen(user: chat.sender,);
                    }
                  ));
                },
                child: Container(
                  //a container wrapping the entire single user
                  margin: EdgeInsets.only(top: 5,bottom: 5,right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  decoration: BoxDecoration(
                    color: chat.unread?Colors.deepPurple[100]: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))
                  ),
                  //outer row holding image and time details
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      //inner row with image, title, subtitle
                      Row(
                        children: <Widget>[
                          //image
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(chat.sender.imageUrl),
                          ),

                          SizedBox(
                            width: 10,
                          ),

                          //column having name and msg
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat.sender.name,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),),

                              SizedBox(
                                height: 10,
                              ),

                              Container(
                                width: deviceWidth<500? 200:deviceWidth/2.0, //responsive message section
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

                      //column containing time and new text
                      Column(
                        children: [
                          //time text
                          Text(chat.time,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),

                          SizedBox(
                            height: 5,
                          ),

                          chat.unread?Container(
                            //container having new text
                            width: 40,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(30)
                              ),
                              alignment: Alignment.center,
                              child: Text('NEW',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),)
                          ):
                              Text('')
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
