import '../../../data/models/categorey_model/categorey_model.dart';

class BrandCategoryState {}

final class BrandCategoryInitial extends BrandCategoryState {}

class LoadingBrandCategories extends BrandCategoryState {}

class SuccessFetchBrandCategories extends BrandCategoryState {
  final List<CategoreyModel> categories;

  SuccessFetchBrandCategories({required this.categories});
}

class FailureFetchBrandCategories extends BrandCategoryState {
  final String errMessage;

  FailureFetchBrandCategories({required this.errMessage});
}
