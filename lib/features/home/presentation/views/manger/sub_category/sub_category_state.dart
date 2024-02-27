import 'package:ecommerce_app/features/home/data/models/sub_category_model/sub_category_model.dart';

class SubCategoryState {}

final class SubCategoryInitial extends SubCategoryState {}

class SubCategoryLoading extends SubCategoryState {}

class SubCategorySuccess extends SubCategoryState {
  final List<SubCategoryModel> subCategories;

  SubCategorySuccess({required this.subCategories});
}

class SubCategoryFailure extends SubCategoryState {
  final String errMessage;

  SubCategoryFailure({required this.errMessage});
}
