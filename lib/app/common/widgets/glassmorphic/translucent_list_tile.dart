import 'package:flutter/material.dart';
import 'translucent_panel.dart';

class TranslucentListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color bgColor;
  final Color color;
  final double opacity;

  const TranslucentListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.bgColor = Colors.transparent,
    this.color = Colors.white,
    this.opacity = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    return TranslucentPanel(
      child: Material(
        color: bgColor.withOpacity(opacity),
        borderRadius: BorderRadius.circular(15.0),
        child: ListTile(
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          onTap: onTap,
          textColor: color,
          iconColor: color,
        ),
      ),
    );
  }
}
