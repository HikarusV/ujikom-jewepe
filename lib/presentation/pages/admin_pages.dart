import 'package:flutter/material.dart';
import 'package:jewepe/data/model/article.dart';
import 'package:jewepe/main.dart';
import 'package:jewepe/presentation/provider/article_provider.dart';
import 'package:jewepe/presentation/provider/auth_provider.dart';
import 'package:jewepe/presentation/widget/article_card.dart';
import 'package:provider/provider.dart';

import '../../common/result_state.dart';
import '../widget/poster_pick.dart';
import '../widget/textfield_custom.dart';

class AdminPages extends StatefulWidget {
  const AdminPages({Key? key}) : super(key: key);

  @override
  State<AdminPages> createState() => _AdminPagesState();
}

class _AdminPagesState extends State<AdminPages> {
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  ImagesData imagesData = ImagesData('poster1');

  @override
  void initState() {
    Future.microtask(() => Provider.of<ArticleProvider>(context, listen: false)
      ..fetchAllArticleData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Column(
        children: [
          /// Header
          Flexible(
            flex: 0,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 30,
              ),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/jewepe-dark.png',
                        scale: 1.4,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Dashboard',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      context.read<AccountProv>().logOut();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 65,
                      height: 28,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF20374B),
                        ),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Color(0xFF20374B),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Flexible(
            flex: 0,
            child: SizedBox(
              height: 20,
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Column(
              children: [
                /// Search Bar, Add Article
                Flexible(
                  flex: 0,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: const Color(0x0f8f949c),
                            child: Stack(
                              children: [
                                TextField(
                                  controller: TextEditingController(),
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 50),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0,
                                        color: Color(0xFF20374B),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFFF7C125),
                                      ),
                                    ),
                                    hintStyle:
                                        TextStyle(color: Color(0xFF8F949C)),
                                    hintText: 'Search Articles ...',
                                  ),
                                  style: const TextStyle(
                                      color: Color(0xFF20374B), fontSize: 14),
                                  cursorColor: const Color(0x0f8f949c),
                                ),
                                const Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 10,
                                  child: Icon(
                                    Icons.search,
                                    color: Color(0xFF8F949C),
                                    size: 28,
                                  ),
                                ),
                                Positioned(
                                  right: 8,
                                  top: 7,
                                  bottom: 7,
                                  child: Material(
                                    color: const Color(0xFFF7C125),
                                    borderRadius: BorderRadius.circular(8),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(8),
                                      onTap: () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 65,
                                        height: 38,
                                        child: const Text(
                                          'Search',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Flexible(
                          flex: 0,
                          child: SizedBox(
                            width: 20,
                          ),
                        ),
                        Flexible(
                          flex: 0,
                          child: Material(
                            color: const Color(0xFF0D7A57),
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
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
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.2,
                                      width: MediaQuery.of(context).size.width /
                                          3.7,
                                      padding: const EdgeInsets.all(20),
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                hintText: 'Judul Artikel',
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
                                                hintText: 'Deskripsi Artikel',
                                                controller: desc,
                                              ),
                                              const SizedBox(
                                                height: 18,
                                              ),
                                              Material(
                                                color: const Color(0xFFF7C125),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  onTap: () {
                                                    if (title.text.isNotEmpty &&
                                                        desc.text.isNotEmpty) {
                                                      handler
                                                          .addNewData(
                                                        Article(
                                                            createdAt:
                                                                DateTime.now(),
                                                            title: title.text,
                                                            description:
                                                                desc.text,
                                                            images: imagesData
                                                                .images),
                                                      )
                                                          .then(
                                                        (value) {
                                                          if (value['bool']) {
                                                            context
                                                                .read<
                                                                    ArticleProvider>()
                                                                .addOfflineData(
                                                                    value[
                                                                        'data']);
                                                            Navigator.pop(
                                                                context);
                                                          } else {}
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      );

                                                      showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              const Center(
                                                                child:
                                                                    CircularProgressIndicator(),
                                                              ));
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 38,
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      'Tambah Data',
                                                      style: TextStyle(
                                                          color: Colors.white),
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
                                              onPressed: () =>
                                                  Navigator.pop(context),
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
                                alignment: Alignment.center,
                                width: 65,
                                height: 45,
                                child: const Text(
                                  'Add\nArticle',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Flexible(
                  flex: 0,
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                Expanded(child:
                    Consumer<ArticleProvider>(builder: (context, value, child) {
                  if (value.articleState == ResultState.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.articleDataList.length,
                      itemBuilder: (context, index) => ArticleCard(
                        article: value.articleDataList[index],
                      ),
                    );
                  } else if (value.articleState == ResultState.loading) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (value.articleState == ResultState.error) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text('Ada Yang Tidak Beres'),
                      ),
                    );
                  } else if (value.articleState == ResultState.noData) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text(
                          'Data kosong',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text('Default Value'),
                      ),
                    );
                  }
                }))
              ],
            ),
          ))
          // Expanded(child: Col)
        ],
      ),
    );
  }
}

class ImagesData {
  String images;

  ImagesData(this.images);
}
