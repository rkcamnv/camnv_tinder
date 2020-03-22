import 'package:camnv_tinder/src/data/model/user.dart';
import 'package:camnv_tinder/src/services/user.dart';

enum Flavor { MOCK, PROD }

class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  UserRepository get userRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return RandomUserRepository();
      default:
        return RandomUserRepository();
    }
  }
}
