import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/presentation/bloc/user/user_bloc.dart';
import 'package:user_app/presentation/bloc/user/user_page.dart';
import 'package:user_app/repository/repository.dart';

import 'data/data_provider/data_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: 
      BlocProvider(
        // create: (context) => UserBloc(userRepository: UserRepository(dataProvider: DataProvider())),
        create: (context) => UserBloc(userRepository: UserRepository(dataProvider: DataProvider())),
        child:
         const UserPage(),
      )
    );
  }
}



