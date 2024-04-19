import 'package:e_commerce/domain/models/categories/category.dart';
import 'package:e_commerce/domain/use_cases/get_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetCategoriesUseCase getCategoriesUseCase;

  HomeTabViewModel(this.getCategoriesUseCase) : super(LoadingState());

  void initPage() async {
    emit(LoadingState());

    try {
      var categories = await getCategoriesUseCase.invoke();
      emit(SuccessState(categories));
    } catch (error) {
      emit(ErrorState(error.toString()));
    }
  }
}

sealed class HomeTabStates {}

class LoadingState extends HomeTabStates {}

class ErrorState extends HomeTabStates {
  String? errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends HomeTabStates {
  List<Category>? categoryList;
  SuccessState(this.categoryList);
}
