import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar(
      {this.title,
      this.elevation,
      this.backAction,
      this.backgroundColor,
      this.color,
      this.fontWeight,
      this.systemUiOverlayStyle,
      this.actions,
      this.hideBack = false,
      Key? key})
      : super(key: key);

  final List<Widget>? actions;

  /// 返回的动作，默认是返回，如果实现了要在方法里pop
  final VoidCallback? backAction;

  /// 背景颜色，默认为 Colors.white
  final Color? backgroundColor;

  /// 字体颜色和返回按钮icon的颜色，默认为ColorHelper.gBlackColor - #191919
  final Color? color;

  /// 下横线
  final double? elevation;

  /// 标题字体的权重，默认为 FontWeight.w500
  final FontWeight? fontWeight;

  /// 是否隐藏返回按钮，默认为false
  final bool? hideBack;

  /// 状态栏字体的白色或黑色 Brightness.light-字体黑色，Brightness.dark-字体白色
  /// 默认为 Brightness.light
  final SystemUiOverlayStyle? systemUiOverlayStyle;

  /// 标题
  final String? title;

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TitleText(
        titleContent: widget.title,
        titleColor: widget.color,
        titleFontWeight: widget.fontWeight,
      ),
      elevation: widget.elevation ?? 0.5,
      leadingWidth: widget.hideBack! ? 0 : 43,
      leading: widget.hideBack!
          ? Container()
          : Container(
              margin: const EdgeInsets.only(left: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Image.asset('assets/images/back_arrow_icon.png',
                    width: 24, color: widget.color ?? const Color(0xFF324458)),
                onTap: () {
                  if (widget.backAction != null) {
                    widget.backAction!();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
      actions: widget.actions,
      systemOverlayStyle:
          widget.systemUiOverlayStyle ?? SystemUiOverlayStyle.dark,

      /// 为了适配安卓标题居中
      centerTitle: true,
      backgroundColor: widget.backgroundColor ?? Colors.white,
      iconTheme: const IconThemeData(),
    );
  }
}

class TitleText extends StatelessWidget {
  //默认标准黑色
  final Color? titleColor;

  final String? titleContent;
  //默认标准粗体
  final FontWeight? titleFontWeight;

  const TitleText(
      {super.key, this.titleContent, this.titleColor, this.titleFontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleContent ?? "",
      maxLines: 1,
      style: TextStyle(
        color: titleColor ?? const Color(0xFF324458),
        fontSize: 17.0,
        fontWeight: titleFontWeight ?? FontWeight.bold,
      ),
    );
  }
}
