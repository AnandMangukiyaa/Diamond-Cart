import 'package:diamond_cart/blocs/cart/cart_bloc.dart';
import 'package:diamond_cart/blocs/cart/cart_state.dart';
import 'package:diamond_cart/core/constants/constants.dart';
import 'package:diamond_cart/model/diamond.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DiamondCard extends StatefulWidget {
  final Diamond diamond;

  DiamondCard({required this.diamond});

  @override
  State<DiamondCard> createState() => _DiamondCardState();
}

class _DiamondCardState extends State<DiamondCard> {
  CartCubit cartCubit = GetIt.I<CartCubit>();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: Sizes.s8.h, horizontal: Sizes.s16.w),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(Sizes.s16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lot ID: ${widget.diamond.lotId}', style: TextStyle(fontSize: Sizes.s16.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: Sizes.s8.h),
            Row(
              children: [
                Expanded(child: Text('Carat: ${widget.diamond.carat}')),
                Expanded(child: Text('Lab: ${widget.diamond.lab}')),
              ],
            ),
        Row(
          children: [
            Expanded(child: Text('Shape: ${widget.diamond.shape}')),
            Expanded(child: Text('Color: ${widget.diamond.color}')),
          ],
        ),
        Row(
          children: [
            Expanded(child: Text('Clarity: ${widget.diamond.clarity}')),
            Expanded(child: Text('Final Amount: \$${widget.diamond.finalAmount}')),
          ],
        ),
            SizedBox(height: Sizes.s8.h),
            BlocBuilder<CartCubit, CartState>(
              bloc: cartCubit,
              builder: (context, state) {
                final isInCart = state.items.where((item) => item.lotId == widget.diamond.lotId).isNotEmpty;
                return ElevatedButton(
                  onPressed: () {
                    if (isInCart) {
                      cartCubit.removeFromCart(widget.diamond);
                    } else {
                      cartCubit.addToCart(widget.diamond);
                    }
                  },
                  child: Text(isInCart ? 'Remove from Cart' : 'Add to Cart'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}