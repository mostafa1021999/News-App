import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shop Market'),),
      body: Column(
        children: [
          Image(image: NetworkImage('https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80')),
        Text('Head Phone'),
        ],
      ),
    );
  }
}