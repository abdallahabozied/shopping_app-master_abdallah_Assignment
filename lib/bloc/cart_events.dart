// ignore_for_file: overridden_fields

import 'package:shopping_app/bloc/cart_bloc.dart';
import '../data/products.dart';

abstract class CartEvents extends CartBloc{
}


class AddToCart extends CartEvents {
  final Product product ;
  AddToCart({ required this.product});
}

class RemoveFromCart extends CartEvents {
  final Product product ;
  @override
  final int index;
  RemoveFromCart({required this.product, required this.index});

}