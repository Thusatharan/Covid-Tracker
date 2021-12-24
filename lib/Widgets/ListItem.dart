import 'package:flutter/material.dart';

class GlobalListItem extends StatelessWidget {
  final String title;
  final String count;

  GlobalListItem({@required this.title, @required this.count});
  @override
  Widget build(BuildContext context) {
    return //Single List Item
        Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      margin: EdgeInsets.all(5),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black45,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(count,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontFamily: 'Inter')),
        ],
      ),
    );
    //Single List Item
  }
}
