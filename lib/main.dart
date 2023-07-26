import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewepe/presentation/pages/auth_pages.dart';
import 'package:jewepe/presentation/pages/landing_pages.dart';
import 'package:jewepe/presentation/pages/mading.dart';
import 'package:jewepe/presentation/provider/article_provider.dart';
import 'package:jewepe/presentation/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import 'common/firestore/firestore_handler.dart';

late FirestoreHandler handler;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC_W4NMCsM-6En_6tIRuaZcF7cJM85AvD0",
      appId: "1:526591345482:web:35b7cf1f90bfb4a5f5b7b3",
      databaseURL:
          "https://jewepe-2f07a-default-rtdb.asia-southeast1.firebasedatabase.app",
      messagingSenderId: "526591345482",
      projectId: "jewepe-2f07a",
      authDomain: "jewepe-2f07a.firebaseapp.com",
      storageBucket: "jewepe-2f07a.appspot.com",
    ),
  );

  handler = FirestoreHandler(FirebaseDatabase.instance.ref());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AccountProv>(
          create: (context) => AccountProv(),
        ),
        ChangeNotifierProvider<ArticleProvider>(
          create: (context) => ArticleProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JeWePe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF7C125)),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const AuthPages(),
    );
  }
}
