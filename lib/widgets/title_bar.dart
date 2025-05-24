import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

// title, profileImage 인자를 받는 TitleBar 위젯
class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.parameters});

  final Map<String, String> parameters;

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
            parameters['title'] ?? 'Dev Blog',
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
    return GestureDetector(
      onTap: () => launchUrlString(parameters['githubUrl'] ?? 'https://www.github.com/jdk829355'),
      child: Container(
        width: 40,
        height: 40,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: AssetImage(parameters['profileImage'] ?? 'images/lake.jpg'),
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
