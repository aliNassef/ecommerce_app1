import '../../../data/models/categorey_model/categorey_model.dart';

class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

class LoadingCategories extends CategoriesState {}

class SuccessFetchCategories extends CategoriesState {
  final List<CategoreyModel> categories;

  SuccessFetchCategories({required this.categories});
}

class FailureFetchCategories extends CategoriesState {
  final String errMessage;

  FailureFetchCategories({required this.errMessage});
}
