
// ignore_for_file: avoid_print

import '../models/login_model.dart';
import '../resources/userApi.dart';

import '../resources/session.dart';
import '../state/login_state.dart';
import 'package:get_storage/get_storage.dart';
import '../../helper/getStorage.dart' as constants;

abstract class LoginPresenterAbstract {
  set view(LoginState view) {}
  void loginClicked() {}
}

class LoginPresenter implements LoginPresenterAbstract {
  final LoginModel _loginModel = LoginModel();
  late LoginState _loginState;

  @override
  void loginClicked() {
    _loginModel.isloading = true;
    _loginState.refreshData(_loginModel);
    UserApi.connectToApi(
            _loginModel.username.text.trim(), _loginModel.password.text.trim())
        .then((value) async {
      await GetStorage().write(constants.idUser, value.dataLogin!.dataMurid!.id.toString());
      print('=== ${value.dataLogin!.dataMurid!.id.toString()}');
      print('=== ${value.dataLogin!.dataMurid!.name.toString()}');
      await GetStorage().write(constants.email, value.dataLogin!.dataMurid!.email.toString());
      await GetStorage().write(constants.namaUser, value.dataLogin!.dataMurid!.name.toString());
      await GetStorage().write(constants.image, value.dataLogin!.dataMurid!.picture.toString());
      Session.setId(value.dataLogin!.dataMurid!.id.toString());
        Session.setName(value.dataLogin!.dataMurid!.name.toString());
        Session.setEmail(value.dataLogin!.dataMurid!.email.toString());
      _loginModel.isloading = false;
      _loginState.refreshData(_loginModel);
      _loginState.onSuccess("yey, Berhasil :D");
    }).catchError((onError) {
      print(onError);
      _loginState.onError(onError);
      _loginModel.isloading = false;
      _loginState.refreshData(_loginModel);
    });
  }

  @override
  set view(LoginState view) {
    // ignore: todo
    // TODO: implement view
    _loginState = view;
    _loginState.refreshData(_loginModel);
  }
}
