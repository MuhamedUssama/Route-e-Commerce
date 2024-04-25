import 'package:e_commerce/domain/use_cases/get_sub_categories_on_category_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'sub_categories_on_category_states.dart';

@injectable
class SubCategoriesOnCategoryViewModel
    extends Cubit<SubCategoriesOnCategoryStates> {
  GetSubCategoriesOnCategoryUsecase subCategoriesUseCase;

  @factoryMethod
  SubCategoriesOnCategoryViewModel(this.subCategoriesUseCase)
      : super(SubCategoriesLoadingState());

  void getSubCategoriesOnCategory(String? id) async {
    emit(SubCategoriesLoadingState());

    try {
      var subCategories = await subCategoriesUseCase.invoke(id);
      emit(SubCategoriesSuccessState(subCategories));
    } catch (e) {
      emit(SubCategoriesErrorState(e.toString()));
    }
  }
}
