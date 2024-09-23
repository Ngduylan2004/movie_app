// return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text(
//           'Find Movies, Tv series, and more..',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 29,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
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
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//             // Bạn có thể thêm các phần khác bên dưới
//           ],
//         ),
//       ),
//     );