import 'package:flutter/material.dart';
import 'package:faketwitter/home/home.dart';
import 'package:faketwitter/create_tweet/create_tweet.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('new tweet'),
        onPressed: () {
          Navigator.of(context).pushNamed(CreateTweetPage.route);
        },
      ),
    );
  }
}
