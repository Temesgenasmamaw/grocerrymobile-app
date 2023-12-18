import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groccery_app/bloc/auth/bloc/auth_bloc.dart';
import 'package:groccery_app/bloc/cart-bloc.dart';
import 'package:groccery_app/bloc/favorite-bloc.dart';

import 'package:groccery_app/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
    BlocProvider<AuthBloc>(
      create: (BuildContext context) => AuthBloc(),
    ),
    // BlocProvider<CartBloc>(
    //   create: (BuildContext context) => CartBloc(),
    // ),
    // BlocProvider<FavoriteBloc>(
    //   create: (BuildContext context) => FavoriteBloc(),
    // ),
  ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(),
        },
      ),
    );
  }
}

