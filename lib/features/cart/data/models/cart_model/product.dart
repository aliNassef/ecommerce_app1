import 'package:ecommerce_app/features/product_list/data/models/product_list_model/datum.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? count;
  final String? id;
  final Datum? product;
  final int? price;

  const Product({this.count, this.id, this.product, this.price});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        count: json['count'] as int?,
        id: json['_id'] as String?,
        product: json['product'] == null
            ? null
            : Datum.fromJson(json['product'] as Map<String, dynamic>),
        price: json['price'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        '_id': id,
        'product': product?.toJson(),
        'price': price,
      };

  @override
  List<Object?> get props => [count, id, product, price];
}
