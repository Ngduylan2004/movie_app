import 'package:flutter/material.dart';

class item1 extends StatelessWidget {
  const item1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      height: 260,
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/anh1.png')),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Soul (2020)',
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
