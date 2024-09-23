// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     theme: ThemeData(scaffoldBackgroundColor: Colors.black),
//     home: const HomePage(),
//   ));
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100, // tăng chiều cao appBar
//         title: const Padding(
//           padding: EdgeInsets.only(top: 10, left: 10),
//           child: Text(
//             'Find Movies, Tv series,\n and more..',
//             style: TextStyle(
//               fontSize: 29,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Search Bar UI
//             TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Sherlock Holmes',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 TabBar(
//                   tabs: <Widget>[
//                     Tab(text: 'Movies'),
//                     Tab(text: 'TV Series'),
//                     Tab(text: 'Documentary'),
//                     Tab(text: 'Sports'),
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
