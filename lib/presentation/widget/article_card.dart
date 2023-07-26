import 'package:flutter/material.dart';
import 'package:jewepe/data/model/article.dart';
import 'package:jewepe/presentation/pages/admin_pages.dart';
import 'package:jewepe/presentation/widget/poster_pick.dart';
import 'package:jewepe/presentation/widget/textfield_custom.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../provider/article_provider.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/poster/${article.images}.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          article.description.length > 50
                              ? article.description.substring(0, 50)
                              : article.description,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          Flexible(
            flex: 0,
            child: Row(
              children: [
                /// Comment Button
                Material(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(90),
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                          backgroundColor: Colors.white,
                          alignment: Alignment.center,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 1.5,
                            width: MediaQuery.of(context).size.height / 2,
                            padding: const EdgeInsets.all(20),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Flexible(
                                      flex: 0,
                                      child: Text(
                                        'Comments',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                        child: ListView.builder(
                                      itemCount: article.comments != null
                                          ? article.comments!.keys.length
                                          : 0,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              article.comments != null
                                                  ? article.comments!.values
                                                      .toList()[index]
                                                      .username
                                                  : 'username',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ), //username
                                            Text(
                                              article.comments != null
                                                  ? article.comments!.values
                                                      .toList()[index]
                                                      .email
                                                  : 'email',
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ), //email
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              article.comments != null
                                                  ? article.comments!.values
                                                      .toList()[index]
                                                      .comment
                                                  : 'comment',
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ), //comments
                                            Container(
                                              color: Colors.grey.shade200,
                                              height: 1,
                                              margin: const EdgeInsets.only(
                                                  top: 10,
                                                  left: 2,
                                                  right: 2,
                                                  bottom: 8),
                                            )
                                          ],
                                        );
                                      },
                                    )),
                                  ],
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
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
                    splashColor: Colors.grey,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.chat,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),

                /// Edit Button
                Material(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(90),
                    onTap: () {
                      TextEditingController title = TextEditingController();
                      TextEditingController desc = TextEditingController();
                      ImagesData imagesData = ImagesData(article.images);
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
                            height: MediaQuery.of(context).size.height / 1.2,
                            width: MediaQuery.of(context).size.width / 3.7,
                            padding: const EdgeInsets.all(20),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PosterPick(
                                      imagesData: imagesData,
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    const Text('Title'),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFieldCustom(
                                      hintText: article.title,
                                      controller: title,
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    const Text('Description'),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFieldCustom(
                                      maxLines: 8,
                                      hintText: article.description,
                                      controller: desc,
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Material(
                                      color: const Color(0xFFF7C125),
                                      borderRadius: BorderRadius.circular(8),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(8),
                                        onTap: () {
                                          bool valid = false;
                                          Map<String, dynamic> updateBuffer =
                                              {};

                                          if (title.text.isNotEmpty) {
                                            updateBuffer['title'] = title.text;
                                            valid = true;
                                          }

                                          if (desc.text.isNotEmpty) {
                                            updateBuffer['description'] =
                                                desc.text;
                                            valid = true;
                                          }

                                          if (imagesData.images !=
                                              article.images) {
                                            updateBuffer['images'] =
                                                imagesData.images;
                                            valid = true;
                                          }

                                          if (valid) {
                                            handler
                                                .updateArticleData(
                                                    updateBuffer, article.id)
                                                .then((value) {
                                              if (value['bool']) {
                                                // snackbarSuccess(context,
                                                //     message: 'Berhasi Mengubah Data');
                                                context
                                                    .read<ArticleProvider>()
                                                    .updateData(article.id,
                                                        updateBuffer);
                                                // Navigator.pop(context);
                                                Navigator.pop(context);
                                              } else {
                                                // snackbarError(context,
                                                //     message:
                                                //     'Ada Masalah Saat Mengubah Data, ${value['message']}');
                                              }

                                              Navigator.pop(context);
                                            });

                                            showDialog(
                                              context: context,
                                              builder: (context) => const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            );
                                          }
                                        },
                                        child: Container(
                                          height: 38,
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'Ubah Data',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
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
                    splashColor: Colors.grey,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),

                /// Delete Button
                Material(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(90),
                    onTap: () {
                      bool confirm = false;
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
                            height: MediaQuery.of(context).size.height / 3.2,
                            width: MediaQuery.of(context).size.width / 3,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                const Expanded(
                                  child: Icon(
                                    Icons.error_outline,
                                    color: Colors.grey,
                                    size: 48,
                                  ),
                                ),
                                const Flexible(
                                  flex: 0,
                                  child: Text(
                                      'Apakah kamu yakin ingin menghapus artikel ini?'),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      /// Tombol Konfirmasi Hapus
                                      Material(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(4),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          onTap: () {
                                            confirm = true;
                                            Navigator.pop(context);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 8,
                                            ),
                                            child: Text(
                                              'Ya, Saya Yakin',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        width: 20,
                                      ),

                                      /// Tombol Konfirmasi Cencel Hapus
                                      Material(
                                        borderRadius: BorderRadius.circular(4),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          onTap: () => Navigator.pop(context),
                                          splashColor: Colors.grey,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 8,
                                            ),
                                            child: const Text(
                                              'Tidak, Batalkan',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ).then((value) {
                        if (confirm) {
                          handler.deleteArticleData(article.id);
                          context
                              .read<ArticleProvider>()
                              .deletedData(article.id);
                        }
                      });
                    },
                    splashColor: Colors.grey,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.delete,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
