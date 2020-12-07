import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  CustomAppBar(
    this.title, {
    Key key,
  })  : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(0xFF2f3542),
      automaticallyImplyLeading: true,
      leading: IconButton(
        icon:
            Image.asset('assets/launcher/icon.png'), //Icon(Icons.chevron_left),
        // onPressed: () => Navigator.pop(context),
        color: Colors.black,
      ),
    );
  }
}
