import 'package:flutter/material.dart';
import 'package:jewepe/presentation/pages/admin_pages.dart';
import 'package:jewepe/presentation/provider/auth_provider.dart';
import 'package:jewepe/presentation/widget/text_input.dart';
import 'package:provider/provider.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
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
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 1.7,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset('assets/images/jewepe-dark.png'),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    InputText(
                      backgroundColor: Colors.white,
                      iconData: Icons.email,
                      fontColor: const Color(0xFF20374B),
                      text: 'Email',
                      cursorColor: const Color(0xFF20374B),
                      controller: email,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputText(
                      backgroundColor: Colors.white,
                      iconData: Icons.lock,
                      fontColor: const Color(0xFF20374B),
                      text: 'Password',
                      cursorColor: const Color(0xFF20374B),
                      controller: password,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Material(
                      color: const Color(0xFFF7C125),
                      borderRadius: BorderRadius.circular(4),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(4),
                        onTap: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const AdminPages(),
                          //   ),
                          // );
                          context
                              .read<AccountProv>()
                              .signInMailPass(email.text, password.text);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 42,
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
