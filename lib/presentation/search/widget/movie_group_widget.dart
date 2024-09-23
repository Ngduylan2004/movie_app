import 'package:flutter/material.dart';
import 'package:movie_app/presentation/search/widget/movie_item_large_widget%20.dart';
import 'package:movie_app/presentation/search/widget/movie_item_small_widget.dart';

class item3 extends StatelessWidget {
  const item3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      height: 220,
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/anh3.png')),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Onward (2020)',
            style: TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class item4 extends StatelessWidget {
  const item4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      height: 260,
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/anh4.png')),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Mulan (2020)',
            style: TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class MovieGroupWidget extends StatelessWidget {
  const MovieGroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      height: 545,
      child: const Wrap(
        direction: Axis.vertical,
        spacing: 16, // khoảng cách giữa các chip
        runSpacing: 16, // khoảng cách giữa các dòng
        children: <Widget>[item1(), item2(), item3(), item4()],
      ),
    );
  }
}
