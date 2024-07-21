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
import '../data/data_source/sign_up_data_source.dart' as _i17;
import '../data/data_source/sub_categories_on_category_data_source.dart'
    as _i23;
import '../data/data_source_impl/brands_data_source_impl.dart' as _i5;
import '../data/data_source_impl/category_data_source_impl.dart' as _i9;
import '../data/data_source_impl/products_data_source_impl.dart' as _i16;
import '../data/data_source_impl/sign_up_data_source_impl.dart' as _i18;
import '../data/data_source_impl/sub_categories_on_category_data_source_impl.dart'
    as _i24;
import '../data/repository_impl/brands_repository_impl.dart' as _i7;
import '../data/repository_impl/category_repository_impl.dart' as _i11;
import '../data/repository_impl/product_repository_impl.dart' as _i30;
import '../data/repository_impl/sign_up_repository_impl.dart' as _i20;
import '../data/repository_impl/sub_categories_on_category_repository_impl.dart'
    as _i26;
import '../domain/repository/brand_repository_contract.dart' as _i6;
import '../domain/repository/category_repository_contract.dart' as _i10;
import '../domain/repository/product_repository_contract.dart' as _i29;
import '../domain/repository/sign_up_repository.dart' as _i19;
import '../domain/repository/sub_categories_on_category_repository_contract.dart'
    as _i25;
import '../domain/use_cases/get_brands_usecase.dart' as _i12;
import '../domain/use_cases/get_categories_usecase.dart' as _i13;
import '../domain/use_cases/get_most_selling_products_usecase.dart' as _i32;
import '../domain/use_cases/get_products_catalog.dart' as _i33;
import '../domain/use_cases/get_sub_categories_on_category_usecase.dart'
    as _i28;
import '../domain/use_cases/sign_up_usecase.dart' as _i21;
import '../ui/screens/auth/sign_up/sign_up_view_model.dart' as _i22;
import '../ui/screens/products/products_by/product_catalog_view_model.dart'
    as _i35;
import '../ui/screens/tabs/categories_tab/cubits/categories/categories_tab_view_model.dart'
    as _i27;
import '../ui/screens/tabs/categories_tab/cubits/sub_categories/sub_categories_on_category_view_model.dart'
    as _i31;
import '../ui/screens/tabs/home_tab/home_tab_view_model.dart' as _i34;
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
    gh.factory<_i17.SignUpDataSource>(
        () => _i18.SignUpDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i19.SignUpRepository>(
        () => _i20.SignUpRepositoryImpl(gh<_i17.SignUpDataSource>()));
    gh.factory<_i21.SignUpUseCase>(
        () => _i21.SignUpUseCase(gh<_i19.SignUpRepository>()));
    gh.factory<_i22.SignUpViewModel>(
        () => _i22.SignUpViewModel(gh<_i21.SignUpUseCase>()));
    gh.factory<_i23.SubCategoriesOnCategoryDataSource>(
        () => _i24.SubCategoriesOnCategoryDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i25.SubCategoriesOnCategoryRepositoryContract>(() =>
        _i26.SubCategoriesOnCategoryRepoImpl(
            gh<_i23.SubCategoriesOnCategoryDataSource>()));
    gh.factory<_i27.CategoriesTabViewModel>(
        () => _i27.CategoriesTabViewModel(gh<_i13.GetCategoriesUseCase>()));
    gh.factory<_i28.GetSubCategoriesOnCategoryUsecase>(() =>
        _i28.GetSubCategoriesOnCategoryUsecase(
            gh<_i25.SubCategoriesOnCategoryRepositoryContract>()));
    gh.factory<_i29.ProductRepositoryContract>(
        () => _i30.ProductRepositoryImpl(gh<_i15.ProductsDataSource>()));
    gh.factory<_i31.SubCategoriesOnCategoryViewModel>(() =>
        _i31.SubCategoriesOnCategoryViewModel(
            gh<_i28.GetSubCategoriesOnCategoryUsecase>()));
    gh.factory<_i32.GetMostSellingProductsUseCase>(() =>
        _i32.GetMostSellingProductsUseCase(
            gh<_i29.ProductRepositoryContract>()));
    gh.factory<_i33.GetProductsCatalogUseCase>(() =>
        _i33.GetProductsCatalogUseCase(gh<_i29.ProductRepositoryContract>()));
    gh.factory<_i34.HomeTabViewModel>(() => _i34.HomeTabViewModel(
          gh<_i13.GetCategoriesUseCase>(),
          gh<_i12.GetBrandsUseCase>(),
          gh<_i32.GetMostSellingProductsUseCase>(),
        ));
    gh.factory<_i35.ProductsCatalogViewModel>(() =>
        _i35.ProductsCatalogViewModel(gh<_i33.GetProductsCatalogUseCase>()));
    return this;
  }
}
