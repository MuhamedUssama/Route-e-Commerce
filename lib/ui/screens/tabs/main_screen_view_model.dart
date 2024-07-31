import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainScreenViewModel extends Cubit<MainScreenStates> {
  @factoryMethod
  MainScreenViewModel() : super(HomeTabState());

  void onTabClick(int tabIndex) {
    if (tabIndex == 0) {
      emit(HomeTabState());
    } else if (tabIndex == 1) {
      emit(CategoriesTabState());
    } else if (tabIndex == 2) {
      emit(FavouriteTabState());
    } else if (tabIndex == 3) {
      emit(UserTabState());
    }
  }
}

sealed class MainScreenStates {}

class HomeTabState extends MainScreenStates {}

class CategoriesTabState extends MainScreenStates {}

class FavouriteTabState extends MainScreenStates {}

class UserTabState extends MainScreenStates {}
