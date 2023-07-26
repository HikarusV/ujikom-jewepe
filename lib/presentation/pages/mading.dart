import 'package:flutter/material.dart';
import 'package:jewepe/data/model/article.dart';
import 'package:jewepe/presentation/widget/poster_card.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../provider/article_provider.dart';

class MadingPages extends StatefulWidget {
  const MadingPages({Key? key}) : super(key: key);

  @override
  State<MadingPages> createState() => _MadingPagesState();
}

class _MadingPagesState extends State<MadingPages> {
  @override
  void initState() {
    Future.microtask(() => Provider.of<ArticleProvider>(context, listen: false)
      ..fetchAllArticleData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF20374B),
      body: Consumer<ArticleProvider>(builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.all(40),
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              // crossAxisCount: 3,
              childAspectRatio: 1,
              mainAxisExtent: MediaQuery.of(context).size.width / 2.5,
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2.5,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
              // mainAxisSpacing: 60,
              // crossAxisSpacing: 60,
            ),
            children: generate(value.articleDataList),
          ),
        );
      }),
    );
  }

  List<Widget> generate(List<Article> data) {
    List<Widget> buffer = [];
    for (Article i in data) {
      buffer.add(PosterCard(
        keys: i.images,
        article: i,
      ));
    }

    return buffer;
  }
}
