import 'package:flutter/material.dart';
import 'package:technical_task/data/models/exhibit.dart';

class DisplayPhotos extends StatelessWidget {
  final Exhibit exhibit;
  const DisplayPhotos({Key? key, required this.exhibit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(exhibit.title),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(exhibit.images.length,
              (index) => Image.network(
                exhibit.images[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
