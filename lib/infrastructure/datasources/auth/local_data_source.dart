import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/core/store/db_store.dart';
import 'package:saiyo_pets/domain/entities/oauth/oauth_token.dart';

@lazySingleton
class LocalDataSource {
  LocalDataSource({required this.dbStore}) {
    dbStore.initStore(OauthTokenAdapter());
  }

  final IDbStore dbStore;

  final String storeIdentifier = 'auth';

  Future<void> setAuthToken({required OauthToken oauthToken}) async {
    await dbStore.set<OauthToken>(
      storeIdentifier: storeIdentifier,
      key: 0,
      value: oauthToken,
    );
  }

  Future<OauthToken?> getAuthToken() async {
    return dbStore.get<OauthToken>(
      storeIdentifier: storeIdentifier,
      key: 0,
    );
  }
}
