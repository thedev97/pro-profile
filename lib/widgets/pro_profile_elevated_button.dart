import '../core/pro_profile_export.dart';
import 'pro_profile_base_button.dart';

class ProProfileElevatedButton extends ProProfileBaseButton {
  const ProProfileElevatedButton(
      {super.key,
      this.decoration,
      this.leftIcon,
      this.rightIcon,
      super.margin,
      super.onPressed,
      super.buttonStyle,
      super.alignment,
      super.buttonTextStyle,
      super.isDisabled,
      super.height,
      super.width,
      required super.text});

  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget)
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: height ?? 55.0,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: NeumorphicButton(
          style: ProProfileDecoration.elevatedButtonDecoration,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(text,
                  style: buttonTextStyle ??
                      ProProfileTextStyles.titleMediumSemiBold_1),
              rightIcon ?? const SizedBox.shrink()
            ],
          ),
        ),
      );
}
