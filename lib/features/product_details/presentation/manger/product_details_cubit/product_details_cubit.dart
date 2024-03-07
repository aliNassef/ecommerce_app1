import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  int increment = 1;
  int colorIndex = 0;
  int sizeIndex = 0;
  incremrt() {
    increment++;
    emit(ChangeProductAmount());
  }

  decrement() {
    if (increment > 1) {
      increment--;
      emit(ChangeProductAmount());
    }
  }

  choosingSize(int index) {
    sizeIndex = index;
    emit(ChooseSizeSuccess());
  }
}
