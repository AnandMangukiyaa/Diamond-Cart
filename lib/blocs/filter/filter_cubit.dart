import 'package:diamond_cart/blocs/filter/filter_state.dart';
import 'package:diamond_cart/mock_data.dart';
import 'package:diamond_cart/model/diamond.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState(diamonds: []));
  List<Diamond> filteredDiamonds = [];
  // Method to filter diamonds
  void filterDiamonds({
    double? caratFrom,
    double? caratTo,
    String? lab,
    String? shape,
    String? color,
    String? clarity,
  }) {
    final diamonds = diamondFromJson(data);

    // Apply filters
    var filteredDiamonds = diamonds.where((diamond) {
      if (caratFrom != null && (diamond.carat ?? 0) < caratFrom) return false;
      if (caratTo != null && (diamond.carat ?? 0) > caratTo) return false;
      if (lab != null && diamond.lab != lab) return false;
      if (shape != null && diamond.shape != shape) return false;
      if (color != null && diamond.color != color) return false;
      if (clarity != null && diamond.clarity != clarity) return false;
      return true;
    }).toList();
    this.filteredDiamonds = filteredDiamonds;
    print(filteredDiamonds.length);
    emit(FilterState(diamonds: filteredDiamonds));
  }

  void getDiamonds() async{
    try {
      final diamonds = await diamondFromJson(data);
      emit(FilterState(diamonds: diamonds));
    } on Exception catch (e) {
      print("getDiamonds: $e");
    }
  }
}

