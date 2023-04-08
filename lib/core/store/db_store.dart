import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class IDbStore {
  Future<void> init();
  Future<void> initStore<T>(TypeAdapter<T> adapter);
  Future<E?> get<E>({
    required String storeIdentifier,
    required String key,
  });
  Future<void> set<E>({
    required String storeIdentifier,
    required String key,
    required E value,
  });
  Future<void> clear<E>({
    required String storeIdentifier,
  });
  Future<void> close();
}

@LazySingleton(as: IDbStore)
class DbStore implements IDbStore {
  @override
  Future<void> init() async {
    await Hive.initFlutter();
  }

  @override
  Future<void> initStore<T>(TypeAdapter<T> adapter) async {
    Hive.registerAdapter(adapter);
  }

  @override
  Future<E?> get<E>({
    required String storeIdentifier,
    required String key,
  }) async {
    final box = await _getBox<E>(storeIdentifier);
    return box.get(key);
  }

  @override
  Future<void> set<E>({
    required String storeIdentifier,
    required String key,
    required E value,
  }) async {
    final box = await _getBox<E>(storeIdentifier);
    return box.put(key, value);
  }

  @override
  Future<void> clear<E>({
    required String storeIdentifier,
  }) async {
    final box = await _getBox<E>(storeIdentifier);
    await box.clear();
  }

  @override
  Future<void> close() async {
    return Hive.close();
  }

  Future<Box<E>> _getBox<E>(String storeIdentifier) async {
    return Hive.isBoxOpen(storeIdentifier)
        ? Hive.box<E>(storeIdentifier)
        : await Hive.openBox<E>(storeIdentifier);
  }
}
