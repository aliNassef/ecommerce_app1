import 'package:ecommerce_app/features/home/data/repos/home_repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  final HomeRepo homeRepo;
  fetchCategories() async {
    emit(LoadingCategories());
    var items = await homeRepo.getCategory();
    items.fold(
      (l) => emit(SuccessFetchCategories(
        categories: l,
      )),
      (r) => emit(FailureFetchCategories(errMessage: r)),
    );
  }
}
