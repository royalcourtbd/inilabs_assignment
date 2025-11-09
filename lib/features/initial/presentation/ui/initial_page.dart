import 'package:flutter/material.dart';
import 'package:inilabs_assignment/core/di/service_locator.dart';
import 'package:inilabs_assignment/core/static/svg_path.dart';
import 'package:inilabs_assignment/core/static/ui_const.dart';
import 'package:inilabs_assignment/core/widgets/presentable_widget_builder.dart';
import 'package:inilabs_assignment/features/initial/presentation/presenter/initial_presenter.dart';
import 'package:inilabs_assignment/shared/components/app_switch/app_switch.dart';
import 'package:inilabs_assignment/shared/components/submit_button.dart';
import 'package:inilabs_assignment/shared/components/user_input_field/src/user_input_field_widget.dart';

class InitialPage extends StatelessWidget {
  InitialPage({super.key});

  final InitialPresenter initialPagePresenter = locate<InitialPresenter>();

  @override
  Widget build(BuildContext context) {
    return PresentableWidgetBuilder(
      presenter: initialPagePresenter,
      builder: () {
        return Scaffold(
          appBar: AppBar(
            title: Text('Search GitHub User'),
            actions: [
              AppSwitch(
                initialValue: initialPagePresenter.themePresenter.isDarkMode,
                onChanged: (value) =>
                    initialPagePresenter.themePresenter.toggleTheme(),
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
                  textEditingController:
                      initialPagePresenter.textEditingController,
                  prefixIconPath: SvgPath.icSearch,
                  hintText: 'Enter github username',
                ),
                gapH20,
                SubmitButton(
                  title: 'Search User',
                  textColor: Colors.white,
                  buttonColor: Theme.of(context).primaryColor,
                  onTap: () => initialPagePresenter.searchUser(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
