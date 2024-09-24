import 'package:flutter/material.dart';
import 'package:movie_app/presentation/newFeed/widget/newfeed_banner_widget.dart';
import 'package:movie_app/presentation/newFeed/widget/newfeed_widget.dart';

class NewfeedScreen extends StatelessWidget {
  const NewfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff15141F),
      appBar: AppBar(
        titleSpacing: 28,
        backgroundColor: const Color(0xff15141F),
        toolbarHeight: 80,
        title: const Padding(
          padding: EdgeInsets.only(top: 53.0),
          child: Row(
            children: [
              Text(
                'Stream ',
                style: TextStyle(
                    fontSize: 29,
                    // fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 254, 123, 0)),
              ),
              Text(
                'Everywhere',
                style: TextStyle(
                    fontSize: 29,
                    // fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              const NewfeedBannerWidget(),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    'Trending',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontFamily: 'Lato',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              NewfeedWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
