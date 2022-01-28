import 'package:flutter_boilerplate/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/app_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.hintText,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    Key? key,
    this.textEditingController,
    this.onTap,
    this.lightTheme = false,
    this.contentPadding,
    this.disableEditing = false,
    this.defaultText,
    this.floatingHintEnabled = true,
  }) : super(key: key);

  final String hintText;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? textEditingController;
  final GestureTapCallback? onTap;
  final bool lightTheme;
  final EdgeInsetsGeometry? contentPadding;
  final bool disableEditing;
  final String? defaultText;
  final bool floatingHintEnabled;

  @override
  State<StatefulWidget> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _textController;
  late bool _textControllerFromParent;
  late FocusNode _textFocusNode;
  bool isHintVisible = false;

  @override
  void initState() {
    _textFocusNode =
        widget.disableEditing ? AlwaysDisabledFocusNode() : FocusNode();

    _textControllerFromParent = widget.textEditingController != null;
    _textController = widget.textEditingController ?? TextEditingController();
    _textController.text = widget.defaultText ?? '';

    _textController.addListener(() {
      _handleTextAndFocusChange();
    });
    _textFocusNode.addListener(() {
      _handleTextAndFocusChange();
    });
    super.initState();
  }

  @override
  void dispose() {
    // If text controller was created from parent widget then don't dispose the controller here.
    if (!_textControllerFromParent) {
      _textController.dispose();
    }
    _textFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.floatingHintEnabled && isHintVisible,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: widget.contentPadding ??
                EdgeInsets.symmetric(
                    horizontal
                        : AppConstants.defaultButtonTextSize),
            child: Text(
              widget.hintText,
              style: TextStyle(
                color: widget.lightTheme ? AppStyles.primary200Color : AppStyles.blue900Color,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        TextField(
          controller: _textController,
          focusNode: _textFocusNode,
          textCapitalization: widget.textCapitalization,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          enabled: !widget.disableEditing,
          style: TextStyle(
            color: widget.lightTheme ? AppStyles.black : AppStyles.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          decoration: InputDecoration(
            contentPadding: widget.contentPadding,
            fillColor: widget.lightTheme ? AppStyles.white : null,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: widget.hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(64.0),
              borderSide: BorderSide(
                color: widget.lightTheme ? AppStyles.grey400Color : AppStyles.blue900Color,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(64.0),
              borderSide: BorderSide(
                color: widget.lightTheme ? AppStyles.grey400Color : AppStyles.blue900Color,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(64.0),
              borderSide: BorderSide(
                color: widget.lightTheme ? AppStyles.grey400Color : AppStyles.blue900Color,
              ),
            ),
            labelStyle: TextStyle(
              color: widget.lightTheme ? AppStyles.black : AppStyles.white,
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
            hintStyle: TextStyle(
              color: widget.lightTheme ? AppStyles.black : AppStyles.white,
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
          ),
          onTap: widget.onTap,
        ),
      ],
    );
  }

  void _handleTextAndFocusChange() {
    setState(() {
      isHintVisible =
          _textFocusNode.hasFocus || _textController.text.isNotEmpty;
    });
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
