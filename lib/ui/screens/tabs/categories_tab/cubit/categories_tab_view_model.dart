import 'package:e_commerce/ui/screens/tabs/categories_tab/cubit/categories_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/use_cases/get_categories_usecase.dart';

@injectable
class CategoriesTabViewModel extends Cubit<CategoriesTabStates> {
  GetCategoriesUseCase getCategoriesUseCase;

  @factoryMethod
  CategoriesTabViewModel(this.getCategoriesUseCase) : super(LoadingState());

  void initPage() async {
    emit(LoadingState());

    try {
      var categories = await getCategoriesUseCase.invoke();
      emit(SuccessState(categories));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
