import 'package:e_commerce/domain/models/categories/category.dart';
import 'package:e_commerce/domain/repository/category_repository_contract.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  CategoryRpositoryContract categoryRpositoryContract;

  HomeTabViewModel(this.categoryRpositoryContract) : super(LoadingState());

  void initPage() {
    emit(LoadingState());
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
