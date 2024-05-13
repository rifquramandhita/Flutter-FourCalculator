import 'package:four_calculator/core/provider/base_provider.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeNotifier extends BaseProvider {
  bool _isDone = true;
  String _fullInput = "";
  String _resultInput = "";

  String get fullInput => _fullInput;

  String get resultInput => _resultInput;

  bool get isDone => _isDone;

  addInput(String param) {
    if (_isDone) {
      if(param == '.' && _resultInput.contains('.')){
        _fullInput = _resultInput;
      } else{
        _fullInput = _resultInput + param;
      }
      _isDone = false;
    } else {
      if ((param == "+" || param == "×" || param == "÷" || param == '-') &&
          (_fullInput.endsWith("+-") ||
              _fullInput.endsWith("--") ||
              _fullInput.endsWith("×-") ||
              _fullInput.endsWith("÷-"))) {
        _fullInput =
            _fullInput.substring(0, _fullInput.length - 2) + param.toString();
      } else if ((param == "+" || param == "×" || param == "÷") &&
          (_fullInput.endsWith("+") ||
              _fullInput.endsWith("-") ||
              _fullInput.endsWith("×") ||
              _fullInput.endsWith("÷") ||
              _fullInput.endsWith("."))) {
        _fullInput =
            _fullInput.substring(0, _fullInput.length - 1) + param.toString();
      } else if(param == '.'){
        List<String> numberArray = _fullInput.split(RegExp(r'[\+\-\×\÷]'));
        final lastNumber = numberArray[numberArray.length-1];
        if(!lastNumber.contains(".")){
          if(lastNumber.isEmpty) _fullInput += '0'+param.toString();
          else _fullInput += param.toString();
        }
      }else {
        _fullInput += param.toString();
      }
    }
    eval();
    notifyListeners();
  }

  delete() {
    _fullInput = _fullInput.substring(0, _fullInput.length - 1);
    eval();
    notifyListeners();
  }

  clear() {
    _fullInput = "";
    eval();
    notifyListeners();
  }

  eval() {
    if (_fullInput.length > 0) {
      final parser = Parser();
      try {
        final exp = parser.parse(_mapExpression(_fullInput));
        _resultInput =
            exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
        if (_resultInput.endsWith(".0"))
          _resultInput = _resultInput.substring(0, _resultInput.length - 2);
      } catch (e) {
        _resultInput = "";
      }
    } else {
      _resultInput = '';
    }
  }

  done() {
    _isDone = true;
    notifyListeners();
  }

  String _mapExpression(String param) {
    return param
        .replaceAll("×", "*")
        .replaceAll("÷", "/")
        .replaceAll('%', '/100');
  }
}
