import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: Colors.black),
    home: const HomePage(),
  ));
}

// Hàm xây dựng một box
Widget buildBox(String title, String imagePath) {
  return Container(
    width: 150, // Đặt chiều rộng cho box
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 3), // Đổ bóng xuống dưới
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          child: Image.asset(
            imagePath,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

// Hàm xây dựng các box trong wrap
Widget buildWrap() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Wrap(
      spacing: 15.0, // Khoảng cách giữa các box
      runSpacing: 10.0, // Khoảng cách giữa các hàng
      children: <Widget>[
        buildBox('Hamilton', 'assets/hamilton.jpg'),
        buildBox('Lafayette', 'assets/lafayette.jpg'),
        buildBox('Mulligan', 'assets/mulligan.jpg'),
        buildBox('Laurens', 'assets/laurens.jpg'),
      ],
    ),
  );
}

// Widget cho tab Documentary
class DocumentaryTab extends StatelessWidget {
  const DocumentaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return buildWrap();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Widget cho tab Movies
class MovieTab extends StatelessWidget {
  const MovieTab({super.key});

  @override
  Widget build(BuildContext context) {
    return buildWrap();
  }
}

// Widget cho tab Sports
class SportsTab extends StatelessWidget {
  const SportsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return buildWrap();
  }
}

// Widget cho tab TV Series
class TVSeriesTab extends StatelessWidget {
  const TVSeriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return buildWrap();
  }
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Số lượng tab
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100, // Tăng chiều cao AppBar
          title: const Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Text(
              'Find Movies, TV Series,\n and more..',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Đưa Search Bar UI lên trên TabBar
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const TabBar(
                tabs: <Widget>[
                  Tab(text: 'Movies'),
                  Tab(text: 'TV Series'),
                  Tab(text: 'Documentary'),
                  Tab(text: 'Sports'),
                ],
              ),
              const SizedBox(height: 20),
              // Nội dung sẽ hiển thị trong TabBarView
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    MovieTab(),
                    TVSeriesTab(),
                    DocumentaryTab(),
                    SportsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
