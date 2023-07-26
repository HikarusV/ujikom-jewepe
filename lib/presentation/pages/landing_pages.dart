import 'package:flutter/material.dart';
import 'package:jewepe/presentation/pages/mading.dart';

import '../widget/text_input.dart';

class LandingPages extends StatelessWidget {
  const LandingPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF20374B),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 56, horizontal: 54),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/jewepe.png'),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 36,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFF7C125),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 14),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 6,
                        ),
                        // color: Colors.green,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "What's New",
                              style: TextStyle(
                                color: Color(0xFFF7C125),
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "in School Today",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                height: 0,
                              ),
                            ),
                            const Text(
                              "Lorem ipsum dolor sit amet consectetur adipiscing elit est, feugiat tellus dapibus tempor aliquam tempus duis porta, fusce lectus.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                height: 0,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const InputText(),
                            const SizedBox(
                              height: 20,
                            ),
                            const InputText(),
                            const SizedBox(
                              height: 20,
                            ),
                            Material(
                              color: const Color(0xFFF7C125),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MadingPages(),
                                      ));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 42,
                                  child: const Text(
                                    'Mading',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        // color: Colors.blue,
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/notes-jewepe.png',
                          scale: 1.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
