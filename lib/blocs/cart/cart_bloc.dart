import 'package:diamond_cart/blocs/cart/cart_state.dart';
import 'package:diamond_cart/model/cart.dart';
import 'package:diamond_cart/model/diamond.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(items: [])) {
    loadCart();
  }

  var cart = Cart(items: []);
  void loadCart() async {
    final cartBox = await Hive.openBox<Cart>('cart'); // Ensure the box is open
    final cart = cartBox.get('cart', defaultValue: Cart(items: []));
    this.cart = cart!;
    emit(CartState(items: cart?.items ?? []));
  }

  // Add diamond to cart
  void addToCart(Diamond diamond) async {
    final cartBox = await Hive.openBox<Cart>('cart'); // Ensure the box is open
    final cart = cartBox.get('cart', defaultValue: Cart(items: []));
    cart?.items.add(diamond);
    this.cart = cart!;
    await cartBox.put('cart', cart!); // Save updated cart to Hive
    emit(CartState(items: cart.items));
  }

  // Remove diamond from cart
  void removeFromCart(Diamond diamond) async {
    final cartBox = await Hive.openBox<Cart>('cart'); // Ensure the box is open
    final cart = cartBox.get('cart', defaultValue: Cart(items: []));
    cart?.items.remove(diamond);
    this.cart = cart!;
    await cartBox.put('cart', cart!); // Save updated cart to Hive
    emit(CartState(items: cart.items));
  }
}