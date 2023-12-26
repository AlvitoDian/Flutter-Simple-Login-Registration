import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String genre;
  final String episodes;
  final String type;

  CustomContainer({
    required this.imagePath,
    required this.title,
    required this.genre,
    required this.episodes,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFF1d232a),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Color(0xff62666c),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xff99a4a9),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          buildText('Genre', genre),
          buildText('Action, Fantasy', ''),
          buildText('Episodes', episodes),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildText('Type', type),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.bookmark,
                  color: Color(0xff99a4a9),
                  size: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildText(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        '$label: $value',
        style: TextStyle(
          color: Color(0xff99a4a9),
          fontSize: 14.0,
        ),
      ),
    );
  }
}
