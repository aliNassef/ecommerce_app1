import 'package:ecommerce_app/features/home/data/repos/home_repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_state.dart';

class BrandCategoryCubit extends Cubit<BrandCategoryState> {
  BrandCategoryCubit(this.homeRepo) : super(BrandCategoryInitial());
  final HomeRepo homeRepo;

  fetchAllBrandCategories() async {
    emit(LoadingBrandCategories());
    final data = await homeRepo.getBrands();
    data.fold(
      (l) => emit(
        SuccessFetchBrandCategories(categories: l),
      ),
      (r) => emit(
        FailureFetchBrandCategories(errMessage: r),
      ),
    );
  }
}
