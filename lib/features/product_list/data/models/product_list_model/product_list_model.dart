import 'package:equatable/equatable.dart';

import 'datum.dart';

class ProductListModel extends Equatable {
  final List<Datum>? data;

  const ProductListModel({this.data});

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [data];
}
