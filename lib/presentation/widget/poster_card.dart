import 'package:flutter/material.dart';
import 'package:jewepe/data/model/article.dart';
import 'package:jewepe/data/model/comment.dart';
import 'package:jewepe/presentation/widget/comment_card.dart';
import 'package:jewepe/presentation/widget/textfield_custom.dart';

class PosterCard extends StatelessWidget {
  const PosterCard({Key? key, this.keys = 'poster1', required this.article})
      : super(key: key);
  final String keys;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width - 240,
                height: MediaQuery.of(context).size.height - 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF1D2226),
                              // borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/poster/$keys.jpg'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  article.createdAt.toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            article.description +
                                                article.description +
                                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 60,
                                            bottom: 20,
                                          ),
                                          alignment: Alignment.center,
                                          height: 1,
                                          color: Colors.black12,
                                        ),

                                        /// Komentar
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            const Expanded(
                                              child: TextFieldCustom(
                                                hintText: 'Tulis Komentas',
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Flexible(
                                              flex: 0,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.send,
                                                  size: 30,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 12,
                                          itemBuilder: (context, index) {
                                            return CommentCard(
                                              comment: Comments(
                                                  createdAt: DateTime.now()),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Container(
          width: 60,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage('assets/images/poster/$keys.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
