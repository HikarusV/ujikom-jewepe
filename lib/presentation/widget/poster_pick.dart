import 'package:flutter/material.dart';
import 'package:jewepe/presentation/pages/admin_pages.dart';

class PosterPick extends StatefulWidget {
  const PosterPick({Key? key, required this.imagesData}) : super(key: key);
  final ImagesData imagesData;

  @override
  State<PosterPick> createState() => _PosterPickState();
}

class _PosterPickState extends State<PosterPick> {
  String key = 'poster1';
  List<String> data = [
    'poster1',
    'poster2',
    'poster3',
    'poster4',
    'poster5',
  ];

  @override
  void initState() {
    key = widget.imagesData.images;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Image'),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/poster/$key.jpg'),
            ),
          ),
          width: 60,
          height: 70,
        ),
        const SizedBox(
          height: 8,
        ),
        DropdownButton(
          value: key,
          items: [
            DropdownMenuItem(
              value: data[0],
              child: const Text('poster1'),
            ),
            DropdownMenuItem(
              value: data[1],
              child: const Text('poster2'),
            ),
            DropdownMenuItem(
              value: data[2],
              child: const Text('poster3'),
            ),
            DropdownMenuItem(
              value: data[3],
              child: const Text('poster4'),
            ),
            DropdownMenuItem(
              value: data[4],
              child: const Text('poster5'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              // print(value);
              key = value!;
              widget.imagesData.images = value;
            });
          },
        ),
      ],
    );
  }
}
