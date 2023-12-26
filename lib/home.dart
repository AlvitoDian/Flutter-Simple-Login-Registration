import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/auth/register.dart';
import 'components/box_content.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c2229),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Color(0xff99a4a9), width: 0.8),
          ),
          child: IconButton(
            icon: Icon(Icons.menu, color: Colors.white, size: 20.0),
            onPressed: () {
              // Tambahkan logika untuk menangani aksi ketika tombol hamburger ditekan
              // Contoh: Navigator.push(context, MaterialPageRoute(builder: (context) => YourDrawerScreen()));
            },
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 9, top: 9, bottom: 9),
                decoration: BoxDecoration(
                  color: Color(0xff3b3b3b),
                  borderRadius: BorderRadius.circular(9.0),
                ),
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Cari...',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.7)),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon:
                            Icon(Icons.search, color: Colors.white, size: 20.0),
                        onPressed: () {
                          // Tambahkan logika untuk menangani aksi ketika ikon pencarian ditekan
                          // Contoh: Show search functionality
                        },
                      ),
                    ),
                    onChanged: (value) {
                      // Logika ketika nilai pada TextField berubah
                    },
                  ),
                ),
              ),
              // Add other widgets for additional actions
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CustomContainer(
                  imagePath: 'assets/banner.png',
                  title: 'Dimension Breaker',
                  genre: 'Action, Fantasy',
                  episodes: '94',
                  type: 'TV',
                ),
                CustomContainer(
                  imagePath: 'assets/banner2.png',
                  title: 'Dimension Breaker',
                  genre: 'Action, Fantasy',
                  episodes: '94',
                  type: 'TV',
                ),
                CustomContainer(
                  imagePath: 'assets/banner.png',
                  title: 'Dimension Breaker',
                  genre: 'Action, Fantasy',
                  episodes: '94',
                  type: 'TV',
                ),
                CustomContainer(
                  imagePath: 'assets/banner2.png',
                  title: 'Dimension Breaker',
                  genre: 'Action, Fantasy',
                  episodes: '94',
                  type: 'TV',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
