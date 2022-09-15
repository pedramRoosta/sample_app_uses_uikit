import 'package:bahag_ui_kit/widgets/helpers/dialog_helper.dart';
import 'package:bahag_ui_kit/widgets/helpers/toaster_helper.dart';
import 'package:flutter/material.dart';
import 'package:bahag_ui_kit/bahag_ui_kit.dart';
import 'package:sample_app_uses_uikit/constants/constants.dart';

class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({super.key});

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  final textCtrl = TextEditingController();
  final textValidatorCtrl = TextEditingController();
  final textLimitationCtrl = TextEditingController();

  static const simpleText = 'Simple text';
  static const textGroupTitle = 'Texts';
  static const buttonGroupTitle = 'Buttons';
  static const dialogGroupTitle = 'Dialogs';
  static const toastGroupTitle = 'Toasts';
  static const textFieldsGroupTitle = 'Text fields';
  static const submitButtonText = 'Submit';
  static const marginBetweenSets = 5.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _rowBuilder(
            groupTitle: textGroupTitle,
            widgets: [
              const AppText(text: simpleText),
              AppText.withShimmer(),
            ],
          ),
          _rowBuilder(
            groupTitle: buttonGroupTitle,
            widgets: [
              const AppButton(
                color: Colors.blue,
                title: submitButtonText,
              ),
              AppButton.withIcon(
                color: Colors.blue,
                icon: Icons.shopping_cart,
              ),
              AppButton.withShimmer(),
            ],
          ),
          _fieldsetBuilder(
            widget: Row(
              children: [
                const Flexible(
                  child: AppCardTile(
                    coverImage: Constants.image4,
                    coverTitle: 'image Title',
                    title: '24.5 €',
                    subTitle: 'sub title',
                  ),
                ),
                Flexible(child: AppCardTile.withShimmer()),
              ],
            ),
          ),
          _fieldsetBuilder(
            widget: Column(
              children: [
                AppListTile(
                  title: 'imageTitle',
                  subtitle: 'subTitle',
                  onTap: () {},
                ),
                AppListTile.withShimmer(),
              ],
            ),
          ),
          _rowBuilder(
            groupTitle: textFieldsGroupTitle,
            widgets: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    AppTextInput.plain(
                        controller: textCtrl, label: 'TextInput'),
                    AppTextInput.withLimitation(
                      controller: textLimitationCtrl,
                      label: 'Textinput with Max character to 3',
                      maxCharacterLimit: 3,
                    ),
                    AppTextInput.withValidation(
                      controller: textValidatorCtrl,
                      label: 'Textinput with Validator',
                      validator: (value) {
                        if (value == 'emp') {
                          return 'The string should not equal to null';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          _rowBuilder(
            groupTitle: dialogGroupTitle,
            widgets: [
              AppButton(
                title: 'Open a simple Dialog',
                onTap: () {
                  DialogHelper.show<String>(
                    context: context,
                    title: 'Simple dialog',
                    body: const AppText(
                      text: 'this is considered as the body for the dialog',
                    ),
                  );
                },
              ),
            ],
          ),
          _rowBuilder(
            groupTitle: toastGroupTitle,
            widgets: [
              AppButton(
                title: 'Display simple toast message',
                onTap: () {
                  Toaster.showToast(
                    context: context,
                    caption: 'Info',
                    message: 'Simple message',
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _fieldsetBuilder({required Widget widget, String? groupTitle}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: marginBetweenSets),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 0.4),
              borderRadius: BorderRadius.circular(5),
            ),
            child: widget,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              color: Colors.white,
              child: AppText(
                text: groupTitle ?? '',
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowBuilder({required List<Widget> widgets, String? groupTitle}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: marginBetweenSets),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 0.4),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: e,
                      ))
                  .toList(),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              color: Colors.white,
              child: AppText(
                text: groupTitle ?? '',
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
