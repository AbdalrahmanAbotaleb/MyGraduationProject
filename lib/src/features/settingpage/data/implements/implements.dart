
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class SettingpageRepositoryImp implements SettingpageRepository{

        final SettingpageRemoteDataSource remoteDataSource;
        SettingpageRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    