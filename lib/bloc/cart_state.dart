import '../data/products.dart';

abstract class CartState {
  final List<Product> cartItems ;
  CartState({required this.cartItems});

}

class CartEmpty extends CartState {
  CartEmpty():super(cartItems: []);
}


class CartItemLoading extends CartState {
  CartItemLoading(): super (cartItems: []);
}

class ProductAdd extends CartState {
  final List<Product> addItem ;
  ProductAdd({required  this.addItem}):super (cartItems: addItem);

}


class ProductRemove extends CartState {
  final List<Product> removedItem ;

  ProductRemove({required this.removedItem}):super(cartItems: removedItem);
}


