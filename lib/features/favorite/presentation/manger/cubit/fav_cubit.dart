import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
}
