import 'package:flutter/material.dart';
import 'package:four_calculator/app/presentation/home/home_notifier.dart';
import 'package:four_calculator/core/widget/custom_filled_button.dart';
import 'package:four_calculator/core/widget/custom_filled_button_icon.dart';
import 'package:four_calculator/core/widget/custom_loading_widget.dart';
import 'package:four_calculator/injection_container.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  late HomeNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeNotifier>(
      create: (context) => sl(),
      builder: (context, child) => _build(context),
    );
  }

  _build(BuildContext context) {
    notifier = Provider.of<HomeNotifier>(context);
    return Scaffold(
        appBar: _appBarBuild(),
        body:
            (notifier.isLoading) ? CustomLoadingWidget() : _bodyBuild(context));
  }

  _appBarBuild() {
    return AppBar(
      title: Text("Four Calculator"),
    );
  }

  _bodyBuild(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Text(
            notifier.fullInput,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.end,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Text(
            notifier.resultInput,
            style: TextStyle(fontSize: 50, color: (notifier.isDone) ? Colors.black : Colors.grey),
            textAlign: TextAlign.end,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          color: Colors.grey[200],
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomFilledButton(
                    onPress: (notifier.fullInput.length > 0) ? () => _onPressInputButton("×") : null,
                    text: "×",
                    backgroundColor: Colors.orange,
                  ),
                  CustomFilledButton(
                      onPress: (notifier.fullInput.length > 0) ?  () => _onPressInputButton("÷") : null,
                      text: "÷",
                      backgroundColor: Colors.orange),
                  CustomFilledButton(
                      onPress: (notifier.fullInput.length > 0) ? () => _onPressInputButton("+") : null,
                      text: "+",
                      backgroundColor: Colors.orange),
                  CustomFilledButton(
                      onPress: (notifier.fullInput.length > 0) ? () => _onPressInputButton("-") : null,
                      text: "-",
                      backgroundColor: Colors.orange),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomFilledButton(
                      onPress: () => _onPressInputButton("7"),
                      text: "7",
                      backgroundColor: Colors.blue),
                  CustomFilledButton(
                      onPress: () => _onPressInputButton("8"),
                      text: "8",
                      backgroundColor: Colors.blue),
                  CustomFilledButton(
                      onPress: () => _onPressInputButton("9"),
                      text: "9",
                      backgroundColor: Colors.blue),
                  CustomFilledIconButton(
                    onPress: (notifier.fullInput.length > 0)
                        ? _onPressDeleteButton
                        : null,
                    icons: Icons.backspace,
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomFilledButton(
                      onPress: () => _onPressInputButton("4"),
                      text: "4",
                      backgroundColor: Colors.blue),
                  CustomFilledButton(
                      onPress: () => _onPressInputButton("5"),
                      text: "5",
                      backgroundColor: Colors.blue),
                  CustomFilledButton(
                      onPress: () => _onPressInputButton("6"),
                      text: "6",
                      backgroundColor: Colors.blue),
                  CustomFilledButton(
                      onPress: (notifier.fullInput.length > 0)
                          ? _onPressClearButton
                          : null,
                      text: "C",
                      backgroundColor: Colors.red),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomFilledButton(
                      onPress: () => _onPressInputButton("1"),
                      text: "1",
                      backgroundColor: Colors.blue),
                  CustomFilledButton(
                      onPress: () => _onPressInputButton("2"),
                      text: "2",
                      backgroundColor: Colors.blue),
                  CustomFilledButton(
                      onPress: () => _onPressInputButton("3"),
                      text: "3",
                      backgroundColor: Colors.blue),
                  CustomFilledButton(
                      onPress: (notifier.fullInput.length > 0) ? () => _onPressInputButton("%") : null,
                      text: "%",
                      backgroundColor: Colors.orange),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomFilledButton(
                      onPress: () => _onPressInputButton("00"),
                      text: "00",
                      backgroundColor: Colors.blue),
                  CustomFilledButton(
                      onPress: () => _onPressInputButton("0"),
                      text: "0",
                      backgroundColor: Colors.blue),
                  CustomFilledButton(
                      onPress: () => _onPressInputButton("."),
                      text: ".",
                      backgroundColor: Colors.blue),
                  CustomFilledButton(
                      onPress: () => _onPressDoneButton(),
                      text: "=",
                      backgroundColor: Colors.green),
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        )
      ],
    );
  }

  _onPressInputButton(String param) {
    notifier.addInput(param);
  }

  // _onPressOperationButton(String param){
  //   notifier.addOperation(param);
  // }

  _onPressDeleteButton() {
    notifier.delete();
  }

  _onPressClearButton() {
    notifier.clear();
  }

  _onPressDoneButton() {
    notifier.done();
  }
}
