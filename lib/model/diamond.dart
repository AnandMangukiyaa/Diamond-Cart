import 'dart:convert';

import 'package:hive/hive.dart';

part 'diamond.g.dart'; // This will be generated
List<Diamond> diamondFromJson(dynamic str) => List<Diamond>.from(str.map((x) => Diamond.fromJson(x)));

String diamondToJson(List<Diamond> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
@HiveType(typeId: 0) // Unique ID for the type
class Diamond {
  @HiveField(0)
  num? qty;

  @HiveField(1)
  num? lotId;

  @HiveField(2)
  String? size;

  @HiveField(3)
  num? carat;

  @HiveField(4)
  String? lab;

  @HiveField(5)
  String? shape;

  @HiveField(6)
  String? color;

  @HiveField(7)
  String? clarity;

  @HiveField(8)
  String? cut;

  @HiveField(9)
  String? polish;

  @HiveField(10)
  String? symmetry;

  @HiveField(11)
  String? fluorescence;

  @HiveField(12)
  num? discount;

  @HiveField(13)
  num? perCaratRate;

  @HiveField(14)
  num? finalAmount;

  @HiveField(15)
  String? keyToSymbol;

  @HiveField(16)
  String? labComment;

  Diamond({
    this.qty,
    this.lotId,
    this.size,
    this.carat,
    this.lab,
    this.shape,
    this.color,
    this.clarity,
    this.cut,
    this.polish,
    this.symmetry,
    this.fluorescence,
    this.discount,
    this.perCaratRate,
    this.finalAmount,
    this.keyToSymbol,
    this.labComment,
  });

  factory Diamond.fromJson(Map<String, dynamic> json) => Diamond(
    qty: json["Qty"],
    lotId: json["Lot ID"],
    size: json["Size"],
    carat: json["Carat"].toDouble(),
    lab: json["Lab"],
    shape: json["Shape"],
    color: json["Color"],
    clarity: json["Clarity"],
    cut: json["Cut"],
    polish: json["Polish"],
    symmetry: json["Symmetry"],
    fluorescence: json["Fluorescence"],
    discount: json["Discount"].toDouble(),
    perCaratRate: json["Per Carat Rate"].toDouble(),
    finalAmount: json["Final Amount"].toDouble(),
    keyToSymbol: json["Key To Symbol"],
    labComment: json["Lab Comment"],
  );

  Map<String, dynamic> toJson() => {
    "Qty": qty,
    "Lot ID": lotId,
    "Size": size,
    "Carat": carat,
    "Lab": lab,
    "Shape": shape,
    "Color": color,
    "Clarity": clarity,
    "Cut": cut,
    "Polish": polish,
    "Symmetry": symmetry,
    "Fluorescence": fluorescence,
    "Discount": discount,
    "Per Carat Rate": perCaratRate,
    "Final Amount": finalAmount,
    "Key To Symbol": keyToSymbol,
    "Lab Comment": labComment,
  };
}