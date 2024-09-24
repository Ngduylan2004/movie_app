import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/presentation/detail/detail_screen.dart';
import 'package:movie_app/presentation/search/widget/movie_group_widget.dart';

class SearchingScreen extends StatefulWidget {
  const SearchingScreen({super.key});

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late final TabController _tabController;

  // Tạo danh sách các MovieModel
  final List<MovieModel> _list = List.generate(
    11,
    (index) => MovieModel(
        name: 'Ten phim $index',
        image: index % 4 == 0
            ? 'assets/images/anh1.png'
            : index % 4 == 1
                ? 'assets/images/anh2.png'
                : index % 4 == 2
                    ? 'assets/images/anh3.png'
                    : 'assets/images/anh4.png'),
  );

  // Chia danh sách thành các phần con với mỗi phần gồm 4 phần tử
  List<List<MovieModel>> chunkedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff15141F),
      appBar: AppBar(
        toolbarHeight: 100, // Giới hạn độ cao appbar
        backgroundColor:
            const Color(0xff15141F), // Đặt màu nền của AppBar là màu đen
        title: const Padding(
          padding: EdgeInsets.only(top: 10, left: 10),
          child: Text(
            'Find Movies, Tv series,\n and more..',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Lato', fontSize: 30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff211F30), // Background input
                hintText: 'Sherlock Holmes..',
                hintStyle: TextStyle(color: Colors.grey[400]), // Màu chữ gợi ý
                prefixIcon: const Icon(Icons.search,
                    color: Colors.white), // Màu của biểu tượng tìm kiếm
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(
                    color: Colors.grey, // Màu viền của TextField
                  ),
                ),
              ),
              style: const TextStyle(
                  color: Colors.white), // Màu chữ trong TextField
            ),
            const SizedBox(height: 10),
            TabBar(
              onTap: (value) {
                chunkedList = [];
                final List<MovieModel> list = List.generate(
                  8 + value,
                  (index) => MovieModel(
                      name: 'Ten phim $index',
                      image: index % 4 == 0
                          ? 'assets/images/anh1.png'
                          : index % 4 == 1
                              ? 'assets/images/anh2.png'
                              : index % 4 == 2
                                  ? 'assets/images/anh3.png'
                                  : 'assets/images/anh4.png'),
                );
                for (var i = 0; i < list.length; i += 4) {
                  chunkedList.add(list.sublist(
                      i, i + 4 > list.length ? list.length : i + 4));
                }
                setState(() {});
              },
              controller: _tabController,
              isScrollable: true, // gia hạn kích thước
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const <Widget>[
                Tab(text: 'Movies'),
                Tab(text: 'TV Series'),
                Tab(text: 'Documentary'),
                Tab(text: 'Sports'),
              ],
              indicatorColor: Colors.white, // Màu chỉ báo cho tab
              labelColor: Colors.white, // Màu chữ của tab
              unselectedLabelColor:
                  Colors.grey, // Màu chữ của tab không được chọn
            ),
            const SizedBox(height: 20),

            // Hiển thị danh sách các phần phim
            Expanded(
              child: ListView.builder(
                itemCount: chunkedList.length, // Số lượng nhóm
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Điều hướng đến trang chi tiết khi nhấn vào nhóm phim
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                              movie: chunkedList[index]
                                  [0]), // Truyền MovieModel đầu tiên
                        ),
                      );
                    },
                    child: MovieGroupWidget(listMovie: chunkedList[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    for (var i = 0; i < _list.length; i += 4) {
      chunkedList
          .add(_list.sublist(i, i + 4 > _list.length ? _list.length : i + 4));
    }
  }
}
