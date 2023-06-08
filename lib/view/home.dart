import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/cart_bloc.dart';
import 'package:shopping_app/bloc/cart_state.dart';
import 'package:shopping_app/view/product_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        return CartBloc();},
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shopping app"),
          actions: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: TextButton.icon(
                      onPressed: () {
                      },
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text("")),
                ),
                 BlocConsumer<CartBloc ,CartState>(builder: (context , state ){
                    return  Positioned(
                        left: 30,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red
                          ),
                          child: Text("${state.cartItems.length}" ,style: const TextStyle(color: Colors.white),),
                        ));
                 }, listener: (BuildContext context ,cartState){})

              ],
            )
          ],
        ),
        body: const ProductListUi(),
      ),
    );
  }
}
