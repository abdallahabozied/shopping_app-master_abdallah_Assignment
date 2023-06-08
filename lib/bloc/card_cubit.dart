import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/cart_events.dart';
import 'package:shopping_app/data/products.dart';

class CartCubit extends Cubit<Product>{
  CartCubit(): super(Product.empty());

   void addToCart() {
      var productx = Product.empty();
      productx.name= state.name;
      productx.color= state.color;
      emit(productx);
    }
  void RemoveFromCart(Product x) {
    var productx = Product.empty();
    productx.name=null;
    productx.color=null;
  }
  }