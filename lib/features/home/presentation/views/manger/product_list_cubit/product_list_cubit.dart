import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit() : super(ProductListInitial());

  fetchProductList() {
    emit(ProductListTapped());
  }
}
