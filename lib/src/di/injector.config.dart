// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:immidart_task/src/core/services/hive.dart' as _i594;
import 'package:immidart_task/src/core/services/storage.dart' as _i29;
import 'package:immidart_task/src/features/home/domain/repository/post_repo.dart'
    as _i143;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i594.HiveService>(() => _i594.HiveService());
    gh.singleton<_i29.SecureStorageService>(
      () => _i29.SecureStorageService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i143.UserRepository>(
      () => _i143.UserRepository(gh<_i361.Dio>(), gh<_i594.HiveService>()),
    );
    return this;
  }
}
