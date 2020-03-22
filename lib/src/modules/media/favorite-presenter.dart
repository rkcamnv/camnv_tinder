import 'package:camnv_tinder/src/data/model/user.dart';
import 'package:camnv_tinder/src/utils/injection.dart';

abstract class FavoritePageContract {
  void unFavorite(User user);
  void showFavorires(List<User> users);
  void showError(String message);
}

class FavoritePagePresenter {
  FavoritePageContract _view;
  UserRepository _repository;

  FavoritePagePresenter(this._view) {
    _repository = new Injector().userRepository;
  }

  void loadFavoritePeople() {
    assert(_view != null);
    _repository.getAllUser().then((users) {
      _view.showFavorires(users);
    }).catchError((onError) {
      _view.showError(onError.toString());
    });
  }
}
