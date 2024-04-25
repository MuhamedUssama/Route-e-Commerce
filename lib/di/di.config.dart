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
import '../data/data_source/brands_data_source.dart' as _i4;
import '../data/data_source/category_data_source_contract.dart' as _i8;
import '../data/data_source/products_data_source.dart' as _i15;
import '../data/data_source/sub_categories_on_category_data_source.dart'
    as _i17;
import '../data/data_source_impl/brands_data_source_impl.dart' as _i5;
import '../data/data_source_impl/category_data_source_impl.dart' as _i9;
import '../data/data_source_impl/products_data_source_impl.dart' as _i16;
import '../data/data_source_impl/sub_categories_on_category_data_source_impl.dart'
    as _i18;
import '../data/repository_impl/brands_repository_impl.dart' as _i7;
import '../data/repository_impl/category_repository_impl.dart' as _i11;
import '../data/repository_impl/product_repository_impl.dart' as _i24;
import '../data/repository_impl/sub_categories_on_category_repository_impl.dart'
    as _i20;
import '../domain/repository/brand_repository_contract.dart' as _i6;
import '../domain/repository/category_repository_contract.dart' as _i10;
import '../domain/repository/product_repository_contract.dart' as _i23;
import '../domain/repository/sub_categories_on_category_repository_contract.dart'
    as _i19;
import '../domain/use_cases/get_brands_usecase.dart' as _i12;
import '../domain/use_cases/get_categories_usecase.dart' as _i13;
import '../domain/use_cases/get_most_selling_products_usecase.dart' as _i26;
import '../domain/use_cases/get_sub_categories_on_category_usecase.dart'
    as _i22;
import '../ui/screens/tabs/categories_tab/cubits/categories/categories_tab_view_model.dart'
    as _i21;
import '../ui/screens/tabs/categories_tab/cubits/sub_categories/sub_categories_on_category_view_model.dart'
    as _i25;
import '../ui/screens/tabs/home_tab/home_tab_view_model.dart' as _i27;
import '../ui/screens/tabs/main_screen_view_model.dart' as _i14;

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
    gh.factory<_i4.BrandsDataSource>(
        () => _i5.BrandsOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i6.BrandsRepositoryContract>(
        () => _i7.BrandsRepositoryImpl(gh<_i4.BrandsDataSource>()));
    gh.factory<_i8.CategoryDataSource>(
        () => _i9.CategoryOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i10.CategoryRpositoryContract>(
        () => _i11.CategoryRepositoryImpl(gh<_i8.CategoryDataSource>()));
    gh.factory<_i12.GetBrandsUseCase>(
        () => _i12.GetBrandsUseCase(gh<_i6.BrandsRepositoryContract>()));
    gh.factory<_i13.GetCategoriesUseCase>(
        () => _i13.GetCategoriesUseCase(gh<_i10.CategoryRpositoryContract>()));
    gh.factory<_i14.MainScreenViewModel>(() => _i14.MainScreenViewModel());
    gh.factory<_i15.ProductsDataSource>(
        () => _i16.ProductDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i17.SubCategoriesOnCategoryDataSource>(
        () => _i18.SubCategoriesOnCategoryDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i19.SubCategoriesOnCategoryRepositoryContract>(() =>
        _i20.SubCategoriesOnCategoryRepoImpl(
            gh<_i17.SubCategoriesOnCategoryDataSource>()));
    gh.factory<_i21.CategoriesTabViewModel>(
        () => _i21.CategoriesTabViewModel(gh<_i13.GetCategoriesUseCase>()));
    gh.factory<_i22.GetSubCategoriesOnCategoryUsecase>(() =>
        _i22.GetSubCategoriesOnCategoryUsecase(
            gh<_i19.SubCategoriesOnCategoryRepositoryContract>()));
    gh.factory<_i23.ProductRepositoryContract>(
        () => _i24.ProductRepositoryImpl(gh<_i15.ProductsDataSource>()));
    gh.factory<_i25.SubCategoriesOnCategoryViewModel>(() =>
        _i25.SubCategoriesOnCategoryViewModel(
            gh<_i22.GetSubCategoriesOnCategoryUsecase>()));
    gh.factory<_i26.GetMostSellingProductsUseCase>(() =>
        _i26.GetMostSellingProductsUseCase(
            gh<_i23.ProductRepositoryContract>()));
    gh.factory<_i27.HomeTabViewModel>(() => _i27.HomeTabViewModel(
          gh<_i13.GetCategoriesUseCase>(),
          gh<_i12.GetBrandsUseCase>(),
          gh<_i26.GetMostSellingProductsUseCase>(),
        ));
    return this;
  }
}
