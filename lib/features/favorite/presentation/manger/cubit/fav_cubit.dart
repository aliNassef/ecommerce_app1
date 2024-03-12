import 'package:ecommerce_app/features/favorite/data/models/fav_model/fav_model.dart';
import 'package:ecommerce_app/features/favorite/data/repo/fav_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.favRepo) : super(FavInitial());
  final FavRepo favRepo;

  getFavProducts({required String id}) async {
    emit(FavLoading());
    final result = await favRepo.getFavProducts(id: id);
    result.fold(
      (l) => emit(FavLoaded(favModel: l)),
      (r) => emit(FavFailure(errMessage: r)),
    );
  }
}
