import 'package:flutter/material.dart';

class item2 extends StatelessWidget {
  const item2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      height: 220,
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/anh2.png')),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Knives Out (2019)',
            style: TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class item3 extends StatelessWidget {
  const item3({super.key});

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
