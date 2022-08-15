import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key key}) : super(key: key);

  void selectMeal() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(),
          ],
        ),
      ),
    );
  }
}
