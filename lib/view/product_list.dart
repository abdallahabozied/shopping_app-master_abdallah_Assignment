import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/cart_bloc.dart';
import 'package:shopping_app/bloc/cart_events.dart';
import 'package:shopping_app/bloc/cart_state.dart';
import 'package:shopping_app/data/products.dart';

class ProductListUi extends StatelessWidget {
  const ProductListUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
        builder: (BuildContext context, state) {
          return ListView.builder(
            itemCount: getList().length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("product $index"),
                leading: Icon(Icons.local_post_office_outlined,
                    color: Colors.primaries[index % Colors.primaries.length]),
                trailing: Container(
                  padding: const EdgeInsets.all(3),
                  width: 60,
                  child: InkWell(
                      onTap: () {
                        context.read<CartBloc>().add(AddToCart(
                            product: Product(
                                name: "Product $index",
                                color: Colors.primaries[
                                    index % Colors.primaries.length])));
                      },
                      onLongPress: () {
                        context.read<CartBloc>().add(RemoveFromCart(
                            product: getList()[index], index: index));
                      },
                      child: const Icon(Icons.add_shopping_cart_outlined)),
                ),
              );
            },
          );
        },
        listener: (BuildContext context, cartState) {});
  }

  List<Product> getList() {
    List<Product> products = List<Product>.generate(
      100,
      (index) => Product(
          name: "Product $index",
          color: Colors.primaries[index % Colors.primaries.length]),
    );
    return products;
  }
}
