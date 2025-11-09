import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inilabs_assignment/shared/components/user_input_field/src/custom_text_selection_toolbar.dart';
import 'package:inilabs_assignment/shared/components/user_input_field/src/input_decoration.dart';

class UserInputField extends StatelessWidget {
  const UserInputField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.onTapSuffixIcon,
    this.showSuffixIcon = false, // Added new parameter
    this.maxLength = 50,
    this.textAlign = TextAlign.start,
    this.showPrefixIcon = true,
    this.validator,
    this.onChanged,
    this.borderRadius,
    this.prefixIconPath,
    this.prefixIconColor,
    this.inputFormatters,
    this.contentPadding,
    this.onFieldSubmitted,
    this.isError = false,
    this.errorBorderColor,
    this.focusNode,
    this.fillColor,
    this.keyboardType,
    this.hintStyle,
    this.borderColor,
    this.borderWidth,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.suffixIconColor,
    this.errorText,
  });

  final TextEditingController textEditingController;

  final String hintText;

  final BorderRadius? borderRadius;

  final void Function(String)? onChanged;

  final void Function(String)? onFieldSubmitted;

  final String? prefixIconPath;

  final Color? prefixIconColor;

  final Color? suffixIconColor;

  final EdgeInsetsGeometry? contentPadding;

  final List<TextInputFormatter>? inputFormatters;

  final bool isError;

  final Color? errorBorderColor;

  final FocusNode? focusNode;

  final Color? fillColor;

  final TextInputType? keyboardType;

  final TextStyle? hintStyle;

  final Color? borderColor;

  final double? borderWidth;

  final Color? focusedBorderColor;

  final Color? enabledBorderColor;

  final Color? disabledBorderColor;

  final VoidCallback? onTapSuffixIcon;

  final bool showPrefixIcon;

  final bool showSuffixIcon; // Added new property

  final int maxLength;
  final String? Function(String?)? validator;
  final TextAlign textAlign;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final bool hasLengthFormatter =
        inputFormatters?.any(
          (formatter) => formatter is LengthLimitingTextInputFormatter,
        ) ??
        false;

    final List<TextInputFormatter> formatters = [
      if (!hasLengthFormatter) LengthLimitingTextInputFormatter(maxLength),
      ...(inputFormatters ?? []),
    ];

    return TextFormField(
      style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400),

      focusNode: focusNode,
      textAlign: textAlign,
      validator: validator,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      cursorColor: theme.colorScheme.primary,
      keyboardType: keyboardType ?? TextInputType.text,
      contextMenuBuilder: (context, editableTextState) {
        return CustomTextSelectionToolbar(
          anchors: editableTextState.contextMenuAnchors,
          editableTextState: editableTextState,
        );
      },
      controller: textEditingController,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: formatters,
      decoration: userInputDecoration(
        context: context,
        hintText: hintText,

        contentPadding:
            contentPadding ??
            (showPrefixIcon
                ? const EdgeInsets.only(right: 15)
                : const EdgeInsets.only(left: 20, right: 15)),
        prefixIconColor: prefixIconColor ?? theme.colorScheme.primary,
        prefixIconPath: prefixIconPath ?? '',
        showPrefixIcon: showPrefixIcon,
        showSuffixIcon: showSuffixIcon,
        suffixIconColor: suffixIconColor,
        onTapSuffixIcon: onTapSuffixIcon,

        fillColor: fillColor ?? theme.inputDecorationTheme.fillColor,
        borderRadius: borderRadius ?? BorderRadius.circular(25),
        borderColor: borderColor ?? Theme.of(context).colorScheme.primary,
        borderWidth: borderWidth,
        focusedBorderColor: focusedBorderColor ?? borderColor,
        enabledBorderColor: enabledBorderColor ?? borderColor,
        disabledBorderColor: disabledBorderColor ?? borderColor,
        errorBorderColor: isError ? (errorBorderColor ?? Colors.red) : null,
        focusedErrorBorderColor: isError
            ? (errorBorderColor ?? Colors.red)
            : null,
        hintStyle: hintStyle,
        errorText: errorText,
      ),
    );
  }
}
