import 'dart:ui';
abstract class Products{}

class Product extends Products {
  int? index ;
  String? name ;
  Color? color ;

  Product ({ required this.name , required this.color});
  Product.empty();
}