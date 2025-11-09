import 'package:flutter/material.dart';
import 'package:inilabs_assignment/core/di/service_locator.dart';
import 'package:inilabs_assignment/core/static/svg_path.dart';
import 'package:inilabs_assignment/core/static/ui_const.dart';
import 'package:inilabs_assignment/features/initial/presentation/presenter/initial_presenter.dart';
import 'package:inilabs_assignment/shared/components/app_switch/app_switch.dart';
import 'package:inilabs_assignment/shared/components/submit_button.dart';
import 'package:inilabs_assignment/shared/components/user_input_field/src/user_input_field_widget.dart';

class InitialPage extends StatelessWidget {
  InitialPage({super.key});

  final InitialPresenter presenter = locate<InitialPresenter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Repository', style: TextStyle(color: Colors.white)),

        backgroundColor: Colors.blue,
        actions: [
          AppSwitch(
            initialValue: false,
            onChanged: (value) {
              // Handle switch change
            },
          ),
          gapW20,
        ],
      ),
      body: Padding(
        padding: padding20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserInputField(
              textEditingController: presenter.textEditingController,
              prefixIconPath: SvgPath.icSearch,
              hintText: 'Enter repository User name',
            ),
            gapH20,
            SubmitButton(
              title: 'Search Repo',
              textColor: Colors.white,
              buttonColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
