import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/card_cubit.dart';
import 'package:shopping_app/bloc/cart_bloc.dart';
import 'package:shopping_app/bloc/cart_state.dart';
import 'package:shopping_app/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
     BlocProvider(create: (BuildContext con) {
     return CartCubit();
     }),
          BlocProvider(create: (BuildContext con) {
            return CartBloc();
          }),
     ],
      child: BlocConsumer<CartBloc ,CartState>(
          builder: (BuildContext context,  CartState ) {
           return
            MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(

                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const Home(),
            );
          },
          listener: (BuildContext context,  CartState ){}
      ),
    );
  }
}
