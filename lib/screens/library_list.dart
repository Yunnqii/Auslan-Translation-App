import 'package:flutter/material.dart';
import 'search_result.dart';
import 'package:video_player/video_player.dart';
import '../data/data_repository.dart';

class LibraryListScreen extends StatelessWidget {
  final String category;
  final List<dynamic> words; // 假设每个词汇是一个字符串

  LibraryListScreen({required this.category, required this.words});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 62), // 箭头距离顶部的高度
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/images/arrow.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 64), // 箭头和种类名称之间的距离
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ...words.map((word) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6f8c51).withOpacity(0.6),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchResultPage(
                                word: word,
                                videoLinks: [
                                  'https://object-store.rc.nectar.org.au/v1/AUTH_92e2f9b70316412697cddc6f3ac0ee4e/staticauslanorgau/auslan/34/34820.mp4'
                                ], // 传递视频链接
                                definitions: [
                                  'The organ inside your body where food is digested; or the front part of your body below your waist. English = stomach, belly. Informal English = tummy. Medical or scientific English = abdomen.'
                                ], // 传递定义
                              ),
                            ),
                          );
                        },
                        child: Text(word),
                      ),
                    )),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
