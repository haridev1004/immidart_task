// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:immidart_task/src/core/services/hive.dart' as _i3;
import 'package:immidart_task/src/features/home/domain/repository/post_repo.dart'
    as _i4;
import 'package:injectable/injectable.dart' as _i2;

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
    gh.lazySingleton<_i3.HiveService>(() => _i3.HiveService());
    gh.lazySingleton<_i4.PostRepository>(() => _i4.PostRepository(
          gh<_i5.Dio>(),
          gh<_i3.HiveService>(),
        ));
    return this;
  }
}
