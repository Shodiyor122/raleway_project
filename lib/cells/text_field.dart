import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ralewayapp/theme/style.dart';

enum TextInputFieldType {
  primary,
  obscure,
  large,
  phone,
  number,
  cardNumber,
  cardDate
}

class TextInputField extends StatefulWidget {
  final TextInputFieldType? type;
  final String? placeholder;
  final String? title;
  final String? error;
  final bool obscureText;
  final bool autofocus;
  final bool autocorrect;
  final bool readonly;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final GestureTapCallback? onTap;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final Color? backgroundColor;
  final double? height;
  final String? hintText;
  final bool? enabled;
  final Function()? onEditingComplete;
  final Widget? prefixIcon;

  const TextInputField.primary({
    @required this.controller,
    Key? key,
    this.placeholder,
    this.title,
    this.error,
    this.autofocus = false,
    this.autocorrect = false,
    this.readonly = false,
    this.enabled = true,
    this.onChange,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.backgroundColor,
    this.height,
    this.hintText,
    this.onEditingComplete,
    this.prefixIcon,
  })  : type = TextInputFieldType.primary,
        obscureText = false,
        super(key: key);

  const TextInputField.cardNumber({
    @required this.controller,
    Key? key,
    this.placeholder,
    this.title,
    this.error,
    this.autofocus = false,
    this.autocorrect = false,
    this.readonly = false,
    this.enabled = true,
    this.onChange,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.backgroundColor,
    this.height,
    this.hintText,
    this.onEditingComplete,
    this.prefixIcon,
  })  : type = TextInputFieldType.cardNumber,
        obscureText = false,
        super(key: key);

  const TextInputField.cardDate({
    @required this.controller,
    Key? key,
    this.placeholder,
    this.title,
    this.error,
    this.autofocus = false,
    this.autocorrect = false,
    this.readonly = false,
    this.enabled = true,
    this.onChange,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.backgroundColor,
    this.height,
    this.hintText,
    this.onEditingComplete,
    this.prefixIcon,
  })  : type = TextInputFieldType.cardDate,
        obscureText = false,
        super(key: key);

  const TextInputField.obscure({
    Key? key,
    this.placeholder,
    this.title,
    this.error,
    this.autofocus = false,
    this.autocorrect = false,
    this.readonly = false,
    @required this.controller,
    this.enabled = true,
    this.onChange,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.backgroundColor,
    this.height,
    this.hintText,
    this.onEditingComplete,
    this.prefixIcon,
  })  : type = TextInputFieldType.obscure,
        obscureText = true,
        super(key: key);

  const TextInputField.large({
    @required this.controller,
    Key? key,
    this.placeholder,
    this.title,
    this.error,
    this.autofocus = false,
    this.autocorrect = false,
    this.readonly = false,
    this.onChange,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.suffixIcon,
    this.enabled = true,
    this.maxLines,
    this.maxLength,
    this.backgroundColor,
    this.hintText,
    this.onEditingComplete,
    this.prefixIcon,
  })  : type = TextInputFieldType.large,
        height = null,
        obscureText = false,
        minLines = 5,
        super(key: key);

  const TextInputField.phone({
    @required this.controller,
    Key? key,
    this.placeholder,
    this.title,
    this.error,
    this.autofocus = false,
    this.autocorrect = false,
    this.readonly = false,
    this.onChange,
    this.onTap,
    this.keyboardType = TextInputType.number,
    this.focusNode,
    this.enabled = true,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.backgroundColor,
    this.height,
    this.hintText,
    this.onEditingComplete,
    this.prefixIcon,
  })  : type = TextInputFieldType.phone,
        obscureText = false,
        super(key: key);

  const TextInputField.number({
    @required this.controller,
    Key? key,
    this.placeholder,
    this.title,
    this.error,
    this.enabled = true,
    this.autofocus = false,
    this.autocorrect = false,
    this.readonly = false,
    this.onChange,
    this.onTap,
    this.keyboardType = TextInputType.number,
    this.focusNode,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.backgroundColor,
    this.height,
    this.hintText,
    this.onEditingComplete,
    this.prefixIcon,
  })  : type = TextInputFieldType.number,
        obscureText = false,
        super(key: key);

  @override
  _TextInputFieldState createState() => _TextInputFieldState(
        focusNode ?? FocusNode(),
        obscureText,
        autofocus,
      );
}

class _TextInputFieldState extends State<TextInputField> {
  FocusNode focusNode;
  bool obscureText;
  bool focused;

  _TextInputFieldState(
    this.focusNode,
    this.obscureText,
    this.focused,
  );

  get borderWidth => widget.error != null || focused ? 1.5 : 1.0;

  get borderColor => widget.error != null
      ? Style.colors.error
      : (focused ? Style.colors.primary : Style.colors.grey0p5);

  late bool isObscureTextField;

  @override
  void initState() {
    super.initState();
    isObscureTextField = obscureText;
    focusNode.addListener(onFocusChange);
  }

  void onFocusChange() {
    if (!mounted) return;
    setState(() {
      focused = focusNode.hasFocus;
    });
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  Widget get visibilityIcon => IconButton(
      onPressed: toggle,
      icon: Icon(
        obscureText ? Icons.visibility : Icons.visibility_off,
        color: focused ? Style.colors.primary : Style.colors.grey4,
      ),
      padding: const EdgeInsets.all(0));

  Widget get errorText => Text(widget.error!,
      style: Style.minTextw5.copyWith(color: Style.colors.error));

  Widget get textField => Theme(
      data: ThemeData(
        fontFamily: Style.fontFamily,
        primaryColor: Style.colors.primary,
        hintColor: Style.colors.grey0p5,
      ),
      child: Material(
          color: Colors.transparent,
          child: TextField(
              cursorColor: Style.colors.primary,
              keyboardAppearance: Style.appBrightness,
              readOnly: widget.readonly,
              autocorrect: widget.autocorrect,
              autofocus: widget.autofocus,
              controller: widget.controller,
              focusNode: focusNode,
              key: widget.key,
              keyboardType: widget.keyboardType,
              obscureText: obscureText,
              onChanged: widget.onChange,
              onTap: widget.onTap,
              maxLength: widget.maxLength,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              enabled: widget.enabled,
              onSubmitted: (String text) => widget.onEditingComplete,
              onEditingComplete: widget.onEditingComplete,
              inputFormatters: widget.type?.inputFormatter,
              decoration: InputDecoration(
                  alignLabelWithHint: widget.minLines! > 1,
                  prefixText:
                      widget.type == TextInputFieldType.phone ? "+998" : null,
                  prefixStyle: Style.bodyw4,
                  labelText: widget.title ?? widget.placeholder,
                  labelStyle: Style.bodyw4.copyWith(
                    color: focused ? Style.colors.primary : Style.colors.grey5,
                  ),
                  hintText: widget.hintText,
                  hintStyle: Style.bodyw4.copyWith(color: Style.colors.grey5),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  prefixIcon: widget.prefixIcon,
                  prefixIconConstraints:
                      const BoxConstraints(minHeight: 20, minWidth: 20),
                  suffixIcon: isObscureTextField
                      ? visibilityIcon
                      : widget.suffixIcon))));

  @override
  Widget build(BuildContext context) {
    Column column =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Style.colors.white,
            borderRadius: Style.border8,
            border: Border.all(width: borderWidth, color: borderColor),
          ),
          child: textField)
    ]);

    if (widget.error != null) {
      column.children.addAll([const SizedBox(height: 4.0), errorText]);
    }

    return column;
  }
}

/// --- Extension ---

extension on TextInputFieldType {
  List<TextInputFormatter>? get inputFormatter {
    List<TextInputFormatter>? inputFormatter;
    switch (this) {
      case TextInputFieldType.phone:
        inputFormatter = [MaskTextInputFormatter(mask: ' ## ### ## ##')];
        break;
      case TextInputFieldType.cardNumber:
        inputFormatter = [MaskTextInputFormatter(mask: '#### #### #### ####')];
        break;

      case TextInputFieldType.cardDate:
        inputFormatter = [MaskTextInputFormatter(mask: '##/##')];
        break;
      case TextInputFieldType.number:
        inputFormatter = <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
        ];
        break;
      default:
        inputFormatter = null;
        break;
    }

    return inputFormatter;
  }
}
