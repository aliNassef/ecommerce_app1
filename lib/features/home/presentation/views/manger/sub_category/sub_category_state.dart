import '../../../../data/models/sub_category_model/datum.dart';

class SubCategoryState {}

final class SubCategoryInitial extends SubCategoryState {}

class SubCategoryLoading extends SubCategoryState {}

class SubCategorySuccess extends SubCategoryState {
  final List<Datum> subCategories;

  SubCategorySuccess({required this.subCategories});
}

class SubCategoryFailure extends SubCategoryState {
  final String errMessage;

  SubCategoryFailure({required this.errMessage});
}
