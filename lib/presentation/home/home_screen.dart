import 'package:flutter/material.dart';
import 'package:movie_app/presentation/newFeed/newfeed_screen.dart';
import 'package:movie_app/presentation/search/searching_screen.dart';

// Ví dụ tạo widget màn hình Home

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Biến để lưu index hiện tại

  // Tạo danh sách màn hình

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Hiển thị màn hình theo index đã chọn
          Expanded(
            child:
                _selectedIndex == 0 ? NewfeedScreen() : const SearchingScreen(),
          ),
          // Thanh dưới cùng chứa các biểu tượng (icon)
          Container(
            color: Colors.black, // Đặt màu nền cho thanh dưới
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.white, size: 35),
                  onPressed: () => _onIconTapped(0), // Chuyển về màn hình Home
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white, size: 35),
                  onPressed: () =>
                      _onIconTapped(1), // Chuyển về màn hình tìm kiếm
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onIconTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cập nhật index khi icon được nhấn
    });
  }
}
