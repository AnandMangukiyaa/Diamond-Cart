import 'package:diamond_cart/blocs/filter/filter_cubit.dart';
import 'package:diamond_cart/blocs/filter/filter_state.dart';
import 'package:diamond_cart/core/constants/constants.dart';
import 'package:diamond_cart/core/routes/app_routes.dart';
import 'package:diamond_cart/mock_data.dart';
import 'package:diamond_cart/model/diamond.dart';
import 'package:diamond_cart/views/widgets/diamon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DiamondFilterPage extends StatefulWidget {
  @override
  State<DiamondFilterPage> createState() => _DiamondFilterPageState();
}

class _DiamondFilterPageState extends State<DiamondFilterPage> {
  final List<String> labs = ['GIA', 'HRD', 'In-House'];

  final List<String> shapes = ['BR', 'CU', 'EM', 'MQ', 'OV', 'PR', 'PS', 'RAD'];

  final List<String> colors = ['D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M'];

  final List<String> clarities = ['FL', 'IF', 'VVS1', 'VVS2', 'VS1', 'VS2', 'SI1', 'SI2', 'I1'];

  List<Diamond> diamonds = [];

  FilterCubit filterCubit = GetIt.I<FilterCubit>();
  String? selectedLab;
  String? selectedShape;
  String? selectedColor;
  String? selectedClarity;
  double? caratFrom;
  double? caratTo;

  @override
  void initState() {
    filterCubit.getDiamonds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diamond Filter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(Sizes.s16.w),
        child: Column(
          children: [
            // Carat Range Input
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Carat From'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        caratFrom = double.tryParse(value);
                      });
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Carat To'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        caratTo = double.tryParse(value);
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: Sizes.s16.h),

            // Lab Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Lab'),
              items: labs.map((lab) {
                return DropdownMenuItem(
                  value: lab,
                  child: Text(lab),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLab = value;
                });
              },
            ),
            SizedBox(height: Sizes.s16.h),

            // Shape Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Shape'),
              items: shapes.map((shape) {
                return DropdownMenuItem(
                  value: shape,
                  child: Text(shape),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedShape = value ;
                });
              },
            ),
            SizedBox(height: Sizes.s16.h),

            // Color Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Color'),
              items: colors.map((color) {
                return DropdownMenuItem(
                  value: color,
                  child: Text(color),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedColor = value;
                });
              },
            ),
            SizedBox(height: Sizes.s16.h),

            // Clarity Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Clarity'),
              items: clarities.map((clarity) {
                return DropdownMenuItem(
                  value: clarity,
                  child: Text(clarity),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedClarity = value;
                });
              },
            ),
            SizedBox(height: Sizes.s32.h),


          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          filterCubit.filterDiamonds(
            caratFrom: caratFrom,
            caratTo: caratTo,
            lab: selectedLab,
            shape: selectedShape,
            color: selectedColor,
            clarity: selectedClarity,
          );
Navigator.pushNamed(context, Routes.resultPage);
        },
        child: Container(
          height: Sizes.s80.h,
          margin: EdgeInsets.all(Sizes.s16.w),
          decoration: BoxDecoration(
            color: AppColors.primary,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, -3),
              ),
            ],
            borderRadius: BorderRadius.circular(Sizes.s16.radius),
            border: Border.all(color: AppColors.border,width: 2),
          ),
          child: Center(
           child: Text( "Filter Diamonds",style: TextStyle(color: Colors.white,fontSize: Sizes.s20.sp),),
          ),
        ),
      ),
    );
  }
}