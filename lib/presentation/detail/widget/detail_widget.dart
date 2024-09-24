import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Cho phép cuộn ngang
      child: SizedBox(
        height: 180, // Đặt chiều cao của SizedBox để chứa ảnh và text
        child: Row(
          children: [
            // Hình ảnh đầu tiên với label
            _buildImageWithLabel('assets/images/anh1.png',
                'Star Wars: The Rise of Skywalker (2019)'),
            // Hình ảnh thứ hai với label
            _buildImageWithLabel('assets/images/anh2.png',
                'Star Wars: The Force Awakens (2015)'),
            // Hình ảnh thứ ba với label
            _buildImageWithLabel('assets/images/anh3.png',
                'Rogue One: A Star Wars Story (2016) '),
          ],
        ),
      ),
    );
  }

  // Hàm hỗ trợ để tạo hình ảnh với label
  Widget _buildImageWithLabel(String imagePath, String label) {
    return Container(
      width: 170, // Chiều rộng của khung
      margin: const EdgeInsets.symmetric(
          horizontal: 8), // Khoảng cách giữa các hình ảnh
      child: Column(
        children: [
          // ClipRRect chỉnh ảnh độ cong của ảnh
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // Bo góc hình ảnh
            child: Image.asset(
              imagePath,
              width: 170, // Kích thước chiều rộng
              height: 130, // Kích thước chiều cao
              fit: BoxFit.cover, // Đảm bảo hình ảnh chiếm đầy không gian
            ),
          ),
          const SizedBox(height: 8), // Khoảng cách giữa hình ảnh và text
          Container(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white, // Màu chữ
                fontSize: 14, // Kích thước chữ
                fontWeight: FontWeight.bold, // Đậm
              ),
              textAlign: TextAlign.start,
              maxLines: 2, // Cho phép xuống hàng
              overflow: TextOverflow.visible, // Hiển thị toàn bộ chữ
            ),
          ),
        ],
      ),
    );
  }
}
