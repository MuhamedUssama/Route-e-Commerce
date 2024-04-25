import 'package:e_commerce/domain/use_cases/get_sub_categories_on_category_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_categories_on_category_states.dart';

class SubCategoriesOnCategoryViewModel
    extends Cubit<SubCategoriesOnCategoryStates> {
  GetSubCategoriesOnCategoryUsecase subCategoriesUseCase;

  SubCategoriesOnCategoryViewModel(this.subCategoriesUseCase)
      : super(LoadingState());

  void getSubCategoriesOnCategory(String? id) async {
    emit(LoadingState());

    try {
      var subCategories = await subCategoriesUseCase.invoke(id);
      emit(SuccessState(subCategories));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
