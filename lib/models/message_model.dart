import 'user_model.dart';

class Message{

  final User sender;  //referring User class
  final String time;  //defining the timestamp
  final String msg;  // actual message

  final bool unread; //unread
  final bool isLiked; //liked


  Message(
    {
      this.sender,
      this.time,
      this.msg,
      this.unread,
      this.isLiked
    }
  );
}


//Current User
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/gerg.jpg',
);

//Other Users 
final User greg = User(
  id: 1, 
  name: 'Greg', 
  imageUrl: 'assets/images/greg.jpg'
  );


final User james = User(
  id: 2, 
  name: 'James', 
  imageUrl: 'assets/images/james.jpg'
  );


final User john = User(
  id: 3, 
  name: 'John', 
  imageUrl: 'assets/images/john.jpg'
  );

final User olivia = User(
  id: 4, 
  name: 'Olivia', 
  imageUrl: 'assets/images/olivia.jpg'
  );

final User sam = User(
  id: 5, 
  name: 'Sam', 
  imageUrl: 'assets/images/sam.jpg'
  );


final User sophia = User(
  id: 6, 
  name: 'Sophia', 
  imageUrl: 'assets/images/sophia.jpg'
  );

final User steven = User(
  id: 7, 
  name: 'Steven', 
  imageUrl: 'assets/images/steven.jpg'
  );


//list of favorite contacts on home screen

List<User> favList = [greg,james,john,olivia,sam,sophia,james,john,olivia,sophia,greg,sam,john,olivia,sam,sophia,james,greg,james,john,olivia,sam,sophia,james,john,olivia,sophia,greg,sam,john,olivia,sam,sophia,james];

//demo chats on home screen 
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    msg: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    msg: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    msg: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    msg: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    msg: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    msg: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    msg: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];


//messages on chat screen 
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    msg: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    msg: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    msg: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    msg: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    msg: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    msg: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];