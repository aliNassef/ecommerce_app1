import 'package:equatable/equatable.dart';

import 'datum.dart';
<<<<<<< HEAD

class ProductListModel extends Equatable {
  final List<Datum>? data;

  const ProductListModel({this.data});

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
=======
import 'metadata.dart';

class ProductListModel extends Equatable {
  final int? results;
  final Metadata? metadata;
  final List<Datum>? data;

  const ProductListModel({this.results, this.metadata, this.data});

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
>>>>>>> main
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
<<<<<<< HEAD
=======
        'results': results,
        'metadata': metadata?.toJson(),
>>>>>>> main
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
<<<<<<< HEAD
  List<Object?> get props => [data];
=======
  List<Object?> get props => [results, metadata, data];
>>>>>>> main
}
