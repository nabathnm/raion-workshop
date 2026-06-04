import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:level_1/features/cart/cart_bloc.dart';
import 'package:level_1/features/favorites/favorite_bloc.dart';
import 'package:level_1/home_page.dart';
import 'package:level_1/providers/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductProvider())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(create: (_) => CartBloc()),
          BlocProvider<FavoriteBloc>(create: (_) => FavoriteBloc()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
