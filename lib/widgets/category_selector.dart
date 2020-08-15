import 'package:flutter/material.dart';


class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {

  int selectedIndex = 0;
  double deviceWidth;
  List<String> categories = ['Messages', 'Online', 'Group', 'Requests'];

  @override
  Widget build(BuildContext context) {

    deviceWidth = MediaQuery.of(context).size.width;

    return Container(
    height: 90,
    color: Theme.of(context).primaryColor,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: (){
          setState(() {
            selectedIndex = index;
          });
        },
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(categories[index],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: index == selectedIndex? Colors.white: Colors.white60,
                letterSpacing: 1.5
              ),),

              SizedBox(
                width: deviceWidth<510? 10: deviceWidth/4.5,
              ),

            ],
          ),
        ),
      );
     },
    ),
    );
  }
}