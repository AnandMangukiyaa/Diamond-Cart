import 'package:diamond_cart/model/diamond.dart';

class CartState {
  final List<Diamond> items;

  CartState({required this.items});

  // Calculate summary
  double get totalCarat => items.fold(0, (sum, diamond) => sum + (diamond.carat ?? 0));
  double get totalPrice => items.fold(0, (sum, diamond) => sum + (diamond.finalAmount ?? 0));
  double get averagePrice => items.isEmpty ? 0 : totalPrice / items.length;
  double get averageDiscount => items.isEmpty ? 0 : items.fold(0, (sum, diamond) => sum + (diamond.discount ?? 0).toInt()) / items.length;
}