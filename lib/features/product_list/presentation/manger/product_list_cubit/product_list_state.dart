import 'package:ecommerce_app/features/product_list/data/models/product_list_model/datum.dart';

abstract class ProductListState {}

final class ProductListInitial extends ProductListState {}

final class ProductListLoading extends ProductListState {}

final class ProductListSuccessFetch extends ProductListState {
  final List<Datum> products;

  ProductListSuccessFetch({required this.products});
}

final class ProductListFailureFetch extends ProductListState {
  final String errMessage;

  ProductListFailureFetch({required this.errMessage});
}
