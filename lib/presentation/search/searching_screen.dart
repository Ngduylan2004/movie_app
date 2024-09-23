import 'package:flutter/material.dart';
import 'package:movie_app/presentation/search/widget/movie_group_widget.dart';

class SearchingScreen extends StatefulWidget {
  const SearchingScreen({super.key});

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Số lượng tab
      child: Scaffold(
        backgroundColor: const Color(0xff15141F),

        // Đặt màu nền của Scaffold là màu đen
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor:
              const Color(0xff15141F), // Đặt màu nền của AppBar là màu đen
          title: const Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                'Find Movies, Tv series,\n and more..',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'MyFont', fontSize: 30),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff211F30),
                  hintText: 'Sherlock Holmes..',
                  hintStyle:
                      TextStyle(color: Colors.grey[400]), // Màu chữ gợi ý
                  prefixIcon: const Icon(Icons.search,
                      color: Colors.white), // Màu của biểu tượng tìm kiếm
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(
                        color: Colors.grey), // Màu viền của TextField
                  ),
                ),
                style: const TextStyle(
                    color: Colors.white), // Màu chữ trong TextField
              ),
              const SizedBox(height: 10),
              const TabBar(
                isScrollable: true, // gia hạn kích thước
                indicatorSize: TabBarIndicatorSize.label,
                tabs: <Widget>[
                  Tab(text: 'Movies'),
                  Tab(text: 'TV Series'),
                  Tab(text: 'Documentary'),
                  Tab(text: 'Sports'),
                ],

                indicatorColor: Colors.white, // Màu chỉ báo cho tab
                labelColor: Colors.white, // Màu chữ của tab
                unselectedLabelColor: Colors
                    .grey, // Màu chữ của tab không được chọn // Màu chỉ báo cho tab
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => const Center(
                        child: MovieGroupWidget(),
                      ),
                    ),
                    const Center(
                        child: Text("TV Series Content",
                            style: TextStyle(color: Colors.white))),
                    const Center(
                        child: Text("Documentary Content",
                            style: TextStyle(color: Colors.white))),
                    const Center(
                        child: Text("Sports Content",
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: const Color(0xff15141F),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search', // Nhãn cho mục tìm kiếm
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile', // Nhãn cho mục hồ sơ
            ),
          ],
        ),
      ),
    );
  }
}
