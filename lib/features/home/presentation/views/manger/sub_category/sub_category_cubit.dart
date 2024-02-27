import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repos/sub_category_repo/sub_category_repo.dart';
import 'sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit(this.subCategoryRepo) : super(SubCategoryInitial());
  final SubCategoryRepo subCategoryRepo;

  fetchAllSubCategories() async {
    emit(SubCategoryLoading());
    final data = await subCategoryRepo.fetchAllSubCategories();
    data.fold(
      (l) => emit(
        SubCategorySuccess(subCategories: l),
      ),
      (r) => emit(
        SubCategoryFailure(errMessage: r),
      ),
    );
  }
}
