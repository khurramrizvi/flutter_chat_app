import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {

    //chat message builder
    final Container msg = Container(
      width: MediaQuery.of(context).size.width*0.75,
      decoration: BoxDecoration(
        borderRadius: isMe? BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ):
        BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),

        color: isMe ? Theme.of(context).accentColor :
        Theme.of(context).hintColor,
      ),
      margin: isMe //checking if msg is send by us
          ? EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: 80)
          : EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),

      padding: EdgeInsets.symmetric(
        //padding inside the container
          horizontal: 25,
          vertical: 15
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message.time,
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),),
          SizedBox(height: 8,),
          Text(message.msg,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),),
        ],
      ),
    );

    if(isMe){
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(
          iconSize: 24,
          icon: message.isLiked?
              Icon(Icons.favorite,):
          Icon(Icons.favorite_border,),
          color: message.isLiked?
          Colors.red:
          Colors.blueGrey,
          onPressed: () {},
        ),
      ],
    );
  }

  //message composer widget
  _buildMessageComposer(){
    return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 8
    ),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.photo),
              iconSize: 25,
              color: Theme.of(context).primaryColor,
              onPressed: (){}),

          Expanded(child:
          TextField(
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value){},
            decoration: InputDecoration.collapsed(
              hintText: 'Send a message'
            ),
          )),

          IconButton(icon: Icon(Icons.send),
              iconSize: 25,
              color: Theme.of(context).primaryColor,
              onPressed: (){})
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          IconButton(
            iconSize: 24,
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  child: ListView.builder(
                    reverse: true,
                      padding: EdgeInsets.only(top: 15),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = messages[index];
                        final bool isMe = message.sender.id == currentUser.id;
                        return _buildMessage(message, isMe);
                      }),
                ),
              ),
            ),

            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
