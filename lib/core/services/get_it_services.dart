

import 'package:get_it/get_it.dart';
import 'package:roadshare/core/services/auth_service.dart';
import 'package:roadshare/features/auth/data/repos/auth_repo_imp.dart';
import 'package:roadshare/features/auth/domin/repos/auth_repo.dart';
import 'package:roadshare/features/auth/presentation/cubit/cubit/sign_in_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  ///services
 // getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(),
  );
  //getIt.registerLazySingleton<NotificationService>(
  //  () => NotificationService(getIt<ApiService>()),
//);
  // getIt.registerLazySingleton<ConnectivityService>(
  //   () => ConnectivityService(),
  // );

  ///auth
  getIt.registerLazySingleton<AuthRepoImp>(
    () => AuthRepoImp(
       // apiService: getIt<ApiService>(),
        firebaseAuthService: getIt<FirebaseAuthService>()),
      );
    getIt.registerLazySingleton<AuthRepo>(() => getIt<AuthRepoImp>());
     //getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<AuthRepo>()));
   getIt.registerFactory<SignInCubit>(() => SignInCubit(getIt<AuthRepo>()));
 // getIt.registerFactory<ServicesCubit>(() => ServicesCubit(getIt<AuthRepo>()));
  //home
  // getIt.registerLazySingleton<HomeRepo>(() => getIt<HomeRepoImp>());
  // getIt.registerLazySingleton<HomeRepoImp>(
  //     () => HomeRepoImp(apiService: getIt<ApiService>()));
  // getIt.registerFactory<BannerCubit>(() => BannerCubit(getIt<HomeRepo>()));
  // getIt
  //     .registerFactory<CountriesCubit>(() => CountriesCubit(getIt<HomeRepo>()));
  // getIt.registerFactory<CitiesCubit>(() => CitiesCubit(getIt<HomeRepo>()));

  // ///products
  // getIt.registerLazySingleton<ProductsRepo>(() => getIt<ProductsRepoImp>());
  // getIt.registerLazySingleton<ProductsRepoImp>(
  //   () => ProductsRepoImp(
  //     apiService: getIt<ApiService>(),
  //   ),
  // );
  // getIt
  //     .registerFactory<ProductCubit>(() => ProductCubit(getIt<ProductsRepo>()));
  // getIt.registerFactory<SingleproductCubit>(
  //     () => SingleproductCubit(getIt<ProductsRepo>()));

  // ///category
  // getIt.registerLazySingleton<CategoryRepo>(() => getIt<CategoryRepoImp>());
  // getIt.registerFactory<CategoryCubit>(
  //     () => CategoryCubit(getIt<CategoryRepo>()));

  // getIt.registerLazySingleton<CategoryRepoImp>(
  //     () => CategoryRepoImp(apiService: getIt<ApiService>()));

  // ///brands
  // getIt.registerLazySingleton<BrandsRepo>(() => getIt<BrandsRepoImp>());
  // getIt.registerLazySingleton<BrandsRepoImp>(
  //     () => BrandsRepoImp(apiService: getIt<ApiService>()));
  // getIt.registerFactory<BrandsCubit>(() => BrandsCubit(getIt<BrandsRepo>()));

  // ///services
  // getIt.registerFactory<ServiceDetailsCubit>(
  //     () => ServiceDetailsCubit(getIt<AuthRepo>()));

  // ///profile
  // getIt.registerLazySingleton<UserProfileRepo>(
  //     () => getIt<UserProfileRepoImp>());
  // getIt.registerLazySingleton<UserProfileRepoImp>(
  //   () => UserProfileRepoImp(apiService: getIt<ApiService>()),
  // );
  // getIt.registerLazySingleton<UserProfileCubit>(
  //     () => UserProfileCubit(getIt<UserProfileRepo>()));
  //     ///Orders
    
  // getIt.registerLazySingleton<OrderRepo>(
  //     () => getIt<OrderRepoImp>());
  // getIt.registerLazySingleton<OrderRepoImp>(
  //   () => OrderRepoImp(apiService: getIt<ApiService>()),
  // );
  // getIt.registerLazySingleton<OrdersCubit>(
  //     () => OrdersCubit(getIt<OrderRepo>()));


  // ///cart
  // getIt.registerLazySingleton<CartRepo>(() => getIt<CartRepoImp>());

  // getIt.registerLazySingleton<CartRepoImp>(
  //   () => CartRepoImp(
  //     apiService: getIt<ApiService>(),
  //   ),
  // );
  // getIt.registerFactory<CartCubit>(() => CartCubit(getIt<CartRepo>()));

  // ///Notifications
  // getIt.registerLazySingleton<NotificationRepo>(
  //     () => getIt<NotificationRepoImp>());
  // getIt.registerLazySingleton<NotificationRepoImp>(
  //   () => NotificationRepoImp(
  //     getIt<ApiService>(),
  //   ),
  // );
  // getIt.registerFactory<NotificationsCubit>(
  //     () => NotificationsCubit(getIt<NotificationRepo>()));

  // ///search
  // getIt.registerLazySingleton<SearchRepo>(() => getIt<SearchRepoImp>());
  // getIt.registerLazySingleton<SearchRepoImp>(() => SearchRepoImp(
  //       apiService: getIt<ApiService>(),
  //     ));
  // getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt<SearchRepo>()));
}
