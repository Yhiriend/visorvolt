import 'package:flutter/material.dart';
import '../styles/styles.dart';

class ButtonVisorvolt extends StatefulWidget {
  final String text;
  final String type; // success, cancel, default, etc.
  final Future<void> Function()? onPressed;

  const ButtonVisorvolt({
    Key? key,
    required this.text,
    required this.type,
    this.onPressed,
  }) : super(key: key);

  @override
  _ButtonVisorvoltState createState() => _ButtonVisorvoltState();
}

class _ButtonVisorvoltState extends State<ButtonVisorvolt> {
  bool _isLoading = false;

  void _handlePress() async {
    if (widget.onPressed != null) {
      setState(() {
        _isLoading = true;
      });

      await widget.onPressed!();

      setState(() {
        _isLoading = false;
      });
    }
  }

  Color _getLoaderColor() {
    if (widget.type.endsWith('_outlined')) {
      switch (widget.type) {
        case 'success_outlined':
          return AppStyles.successColor;
        case 'cancel_outlined':
          return AppStyles.cancelColor;
        case 'default_outlined':
          return AppStyles.primaryColor;
        case 'error_outlined':
          return AppStyles.errorColor;
        default:
          return AppStyles.defaultLoaderColor;
      }
    } else {
      return AppStyles.defaultLoaderColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle;

    switch (widget.type) {
      case 'success':
        buttonStyle = AppStyles.successButtonStyle;
        break;
      case 'cancel':
        buttonStyle = AppStyles.cancelButtonStyle;
        break;
      case 'default':
        buttonStyle = AppStyles.defaultButtonStyle;
        break;
      case 'success_outlined':
        buttonStyle = AppStyles.successOutlinedButtonStyle;
        break;
      case 'cancel_outlined':
        buttonStyle = AppStyles.cancelOutlinedButtonStyle;
        break;
      case 'default_outlined':
        buttonStyle = AppStyles.defaultOutlinedButtonStyle;
        break;
      case 'error':
        buttonStyle = AppStyles.errorButtonStyle;
        break;
      case 'error_outlined':
        buttonStyle = AppStyles.errorOutlinedButtonStyle;
        break;
      default:
        buttonStyle = AppStyles.defaultButtonStyle;
    }

    return SizedBox(
      width: double.infinity, // Ocupa el 100% del contenedor
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: _handlePress,
        child: SizedBox(
          height: 36.0, // Ajusta la altura según tus necesidades
          child: _isLoading
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 24.0, // Ajusta el ancho del loader
                height: 24.0, // Ajusta la altura del loader
                child: CircularProgressIndicator(
                  color: _getLoaderColor(),
                  strokeWidth: 2.0,
                ),
              ),
              SizedBox(width: 8),
              Text(widget.text),
            ],
          )
              : Center(child: Text(widget.text)),
        ),
      ),
    );
  }
}
