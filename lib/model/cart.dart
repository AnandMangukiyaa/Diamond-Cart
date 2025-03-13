import 'package:diamond_cart/model/diamond.dart';
import 'package:hive_flutter/adapters.dart';

part 'cart.g.dart';
@HiveType(typeId: 1)
class Cart {
  @HiveField(0)
  final List<Diamond> items;

  Cart({required this.items});
}