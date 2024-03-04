import 'package:flutter/cupertino.dart';

class BaseProvider with ChangeNotifier{
  bool _isDispose = false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void showLoading(){
    if(!_isDispose){
      _isLoading = true;
      notifyListeners();
    }
  }

  void hideLoading(){
    if(!_isDispose){
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _isDispose = true;
    super.dispose();
  }
}