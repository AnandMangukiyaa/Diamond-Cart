import 'package:diamond_cart/blocs/cart/cart_bloc.dart';
import 'package:diamond_cart/blocs/cart/cart_state.dart';
import 'package:diamond_cart/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartCubit cartCubit = GetIt.I<CartCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        bloc: cartCubit,
        builder: (context, state) {
          if (state.items.isEmpty) {
            return Center(child: Text('Your cart is empty'));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final diamond = state.items[index];
                    return ListTile(
                      title: Text('Lot ID: ${diamond.lotId}'),
                      subtitle: Text('Carat: ${diamond.carat}, Final Amount: \$${diamond.finalAmount}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_shopping_cart),
                        onPressed: () {
                          cartCubit.removeFromCart(diamond);
                        },
                      ),
                    );
                  },
                ),
              ),
              // Summary Section
              Container(
                padding: EdgeInsets.all(Sizes.s16.w),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(Sizes.s16.radius)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Summary',
                      style: TextStyle(fontSize: Sizes.s18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: Sizes.s8.h),
                    Text('Total Carat: ${state.totalCarat.toStringAsFixed(2)}'),
                    Text('Total Price: \$${state.totalPrice.toStringAsFixed(2)}'),
                    Text('Average Price: \$${state.averagePrice.toStringAsFixed(2)}'),
                    Text('Average Discount: ${state.averageDiscount.toStringAsFixed(2)}%'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}