import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('yes'),
                  color: Colors.grey[100],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('no'),
                  color: Colors.grey[100],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('no'),
                  color: Colors.grey[100],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('no'),
                  color: Colors.grey[100],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('no'),
                  color: Colors.grey[100],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('no'),
                  color: Colors.grey[100],
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
