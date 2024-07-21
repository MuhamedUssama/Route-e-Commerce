// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/api_manager.dart' as _i5;
import '../data/data_source/brands_data_source.dart' as _i6;
import '../data/data_source/category_data_source_contract.dart' as _i10;
import '../data/data_source/login_data_source.dart' as _i16;
import '../data/data_source/products_data_source.dart' as _i18;
import '../data/data_source/sign_up_data_source.dart' as _i20;
import '../data/data_source/sub_categories_on_category_data_source.dart'
    as _i26;
import '../data/data_source_impl/brands_data_source_impl.dart' as _i7;
import '../data/data_source_impl/category_data_source_impl.dart' as _i11;
import '../data/data_source_impl/login_data_source_impl.dart' as _i17;
import '../data/data_source_impl/products_data_source_impl.dart' as _i19;
import '../data/data_source_impl/sign_up_data_source_impl.dart' as _i21;
import '../data/data_source_impl/sub_categories_on_category_data_source_impl.dart'
    as _i27;
import '../data/repository_impl/brands_repository_impl.dart' as _i9;
import '../data/repository_impl/category_repository_impl.dart' as _i13;
import '../data/repository_impl/product_repository_impl.dart' as _i33;
import '../data/repository_impl/sign_up_repository_impl.dart' as _i23;
import '../data/repository_impl/sub_categories_on_category_repository_impl.dart'
    as _i29;
import '../domain/repository/brand_repository_contract.dart' as _i8;
import '../domain/repository/category_repository_contract.dart' as _i12;
import '../domain/repository/product_repository_contract.dart' as _i32;
import '../domain/repository/sign_up_repository.dart' as _i22;
import '../domain/repository/sub_categories_on_category_repository_contract.dart'
    as _i28;
import '../domain/use_cases/get_brands_usecase.dart' as _i14;
import '../domain/use_cases/get_categories_usecase.dart' as _i15;
import '../domain/use_cases/get_most_selling_products_usecase.dart' as _i35;
import '../domain/use_cases/get_products_catalog.dart' as _i36;
import '../domain/use_cases/get_sub_categories_on_category_usecase.dart'
    as _i31;
import '../domain/use_cases/sign_up_usecase.dart' as _i24;
import '../helpers/network_connection.dart' as _i4;
import '../ui/screens/auth/sign_up/sign_up_view_model.dart' as _i25;
import '../ui/screens/products/products_by/product_catalog_view_model.dart'
    as _i38;
import '../ui/screens/tabs/categories_tab/cubits/categories/categories_tab_view_model.dart'
    as _i30;
import '../ui/screens/tabs/categories_tab/cubits/sub_categories/sub_categories_on_category_view_model.dart'
    as _i34;
import '../ui/screens/tabs/home_tab/home_tab_view_model.dart' as _i37;
import '../ui/screens/tabs/main_screen_view_model.dart' as _i3;

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
    gh.factory<_i3.MainScreenViewModel>(() => _i3.MainScreenViewModel());
    gh.singleton<_i4.NewtworkConnections>(() => _i4.NewtworkConnections());
    gh.singleton<_i5.ApiManager>(
        () => _i5.ApiManager(gh<_i4.NewtworkConnections>()));
    gh.factory<_i6.BrandsDataSource>(
        () => _i7.BrandsOnlineDataSource(gh<_i5.ApiManager>()));
    gh.factory<_i8.BrandsRepositoryContract>(
        () => _i9.BrandsRepositoryImpl(gh<_i6.BrandsDataSource>()));
    gh.factory<_i10.CategoryDataSource>(
        () => _i11.CategoryOnlineDataSource(gh<_i5.ApiManager>()));
    gh.factory<_i12.CategoryRpositoryContract>(
        () => _i13.CategoryRepositoryImpl(gh<_i10.CategoryDataSource>()));
    gh.factory<_i14.GetBrandsUseCase>(
        () => _i14.GetBrandsUseCase(gh<_i8.BrandsRepositoryContract>()));
    gh.factory<_i15.GetCategoriesUseCase>(
        () => _i15.GetCategoriesUseCase(gh<_i12.CategoryRpositoryContract>()));
    gh.factory<_i16.LoginDataSource>(
        () => _i17.LoginDataSourceImpl(gh<_i5.ApiManager>()));
    gh.factory<_i18.ProductsDataSource>(
        () => _i19.ProductDataSourceImpl(gh<_i5.ApiManager>()));
    gh.factory<_i20.SignUpDataSource>(
        () => _i21.SignUpDataSourceImpl(gh<_i5.ApiManager>()));
    gh.factory<_i22.SignUpRepository>(
        () => _i23.SignUpRepositoryImpl(gh<_i20.SignUpDataSource>()));
    gh.factory<_i24.SignUpUseCase>(
        () => _i24.SignUpUseCase(gh<_i22.SignUpRepository>()));
    gh.factory<_i25.SignUpViewModel>(
        () => _i25.SignUpViewModel(gh<_i24.SignUpUseCase>()));
    gh.factory<_i26.SubCategoriesOnCategoryDataSource>(
        () => _i27.SubCategoriesOnCategoryDataSourceImpl(gh<_i5.ApiManager>()));
    gh.factory<_i28.SubCategoriesOnCategoryRepositoryContract>(() =>
        _i29.SubCategoriesOnCategoryRepoImpl(
            gh<_i26.SubCategoriesOnCategoryDataSource>()));
    gh.factory<_i30.CategoriesTabViewModel>(
        () => _i30.CategoriesTabViewModel(gh<_i15.GetCategoriesUseCase>()));
    gh.factory<_i31.GetSubCategoriesOnCategoryUsecase>(() =>
        _i31.GetSubCategoriesOnCategoryUsecase(
            gh<_i28.SubCategoriesOnCategoryRepositoryContract>()));
    gh.factory<_i32.ProductRepositoryContract>(
        () => _i33.ProductRepositoryImpl(gh<_i18.ProductsDataSource>()));
    gh.factory<_i34.SubCategoriesOnCategoryViewModel>(() =>
        _i34.SubCategoriesOnCategoryViewModel(
            gh<_i31.GetSubCategoriesOnCategoryUsecase>()));
    gh.factory<_i35.GetMostSellingProductsUseCase>(() =>
        _i35.GetMostSellingProductsUseCase(
            gh<_i32.ProductRepositoryContract>()));
    gh.factory<_i36.GetProductsCatalogUseCase>(() =>
        _i36.GetProductsCatalogUseCase(gh<_i32.ProductRepositoryContract>()));
    gh.factory<_i37.HomeTabViewModel>(() => _i37.HomeTabViewModel(
          gh<_i15.GetCategoriesUseCase>(),
          gh<_i14.GetBrandsUseCase>(),
          gh<_i35.GetMostSellingProductsUseCase>(),
        ));
    gh.factory<_i38.ProductsCatalogViewModel>(() =>
        _i38.ProductsCatalogViewModel(gh<_i36.GetProductsCatalogUseCase>()));
    return this;
  }
}
