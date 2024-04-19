// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/api_manager.dart' as _i3;
import '../data/data_source/category_data_source_contract.dart' as _i4;
import '../data/data_source_impl/category_data_source_impl.dart' as _i5;
import '../data/repository_impl/category_repository_impl.dart' as _i7;
import '../domain/repository/category_repository_contract.dart' as _i6;
import '../domain/use_cases/get_categories_usecase.dart' as _i8;
import '../ui/tabs/home_tab/home_tab_view_model.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.CategoryDataSource>(
        () => _i5.CategoryOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i6.CategoryRpositoryContract>(
        () => _i7.CategoryRepositoryImpl(gh<_i4.CategoryDataSource>()));
    gh.factory<_i8.GetCategoriesUseCase>(
        () => _i8.GetCategoriesUseCase(gh<_i6.CategoryRpositoryContract>()));
    gh.factory<_i9.HomeTabViewModel>(
        () => _i9.HomeTabViewModel(gh<_i8.GetCategoriesUseCase>()));
    return this;
  }
}
