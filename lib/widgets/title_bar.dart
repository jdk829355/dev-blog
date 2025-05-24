import 'package:flutter/material.dart';

// title, profileImage 인자를 받는 TitleBar 위젯
class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.title, required this.profileImage});

  final String title;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
      width: double.infinity,
      height: 65,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFE5E8EA),
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 8, 9, 10),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 1.28,
            ),
          ),
          const Spacer(),
          _buildProfileImage(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 40,
      height: 40,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(profileImage),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
