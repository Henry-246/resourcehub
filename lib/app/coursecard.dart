import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String courseName;
  final String imagePath;
  final Function()? onTap;

  const CourseCard({
    super.key,
    required this.courseName,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                imagePath,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 20,
                child: Text(
                  courseName,
                  style:  TextStyle(
                    fontSize: screenwidth * 0.056,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: const [
                       Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 3,
                        color: Color.fromARGB(128, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
