import 'package:diamond_cart/blocs/cart/cart_bloc.dart';
import 'package:diamond_cart/blocs/filter/filter_cubit.dart';
import 'package:diamond_cart/blocs/filter/filter_state.dart';
import 'package:diamond_cart/core/constants/constants.dart';
import 'package:diamond_cart/views/widgets/diamon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  FilterCubit filterCubit = GetIt.I<FilterCubit>();
  CartCubit cartCubit = GetIt.I<CartCubit>();

  @override
  void initState() {
    cartCubit.loadCart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Results'),
      ),
      body: Padding(
        padding: EdgeInsets.all(Sizes.s16.w),
        child:  filterCubit.filteredDiamonds.isNotEmpty?ListView.builder(
              itemCount: filterCubit.filteredDiamonds.length,
              itemBuilder: (context, index) {
                final diamond =filterCubit.filteredDiamonds[index];
                return DiamondCard(diamond: diamond);
              },
        ):Center(child: Text('No results found', style: TextStyle(fontSize: Sizes.s16.sp,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}
