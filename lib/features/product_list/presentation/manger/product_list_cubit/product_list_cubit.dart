import 'package:ecommerce_app/features/product_list/data/repo/product_list_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit(this.productRepo) : super(ProductListInitial());
  final ProductListRepo productRepo;

  getAllProducts() async {
    emit(ProductListLoading());
    var response = await productRepo.getAllProduct();
    response.fold(
      (l) => emit(
        ProductListSuccessFetch(products: l),
      ),
      (r) => emit(
        ProductListFailureFetch(errMessage: r),
      ),
    );
  }
}
