import 'package:flutter/material.dart';
import 'package:rockets/app/helpers/sizes/edge_insets.dart';
import 'package:rockets/app/helpers/sizes/spacers.dart';
import 'package:rockets/app/theme/app_theme.dart';

class DescriptionContainer extends StatelessWidget {
  final AppEdgeInsets? padding;
  final String? header;
  final String? subheader;
  final List<String>? paragraph;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? width;
  final Color textColor;

  const DescriptionContainer({
    Key? key,
    this.header,
    this.subheader,
    this.paragraph,
    this.padding,
    this.width,
    this.textColor = Colors.black,
    this.crossAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: padding ?? AppEdgeInsets.all(context, Sizes.xs),
        width: width,
        child: Column(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: [
            if (header != null) Sizes.m.spacer(),
            if (header != null)
              Text(
                header!,
                style: AppTheme.currentTheme.textTheme.titleLarge?.copyWith(color: textColor),
              ),
            if (header != null && subheader != null) Sizes.s.spacer(),
            if (subheader != null)
              Text(
                subheader!,
                style: AppTheme.currentTheme.textTheme.titleSmall?.copyWith(color: textColor),
              ),
            if (subheader != null && paragraph != null) Sizes.s.spacer(),
            ParagraphText(
              text: paragraph!,
              textColor: textColor,
            )
          ],
        ),
      ),
    );
  }
}

class ParagraphText extends StatelessWidget {
  final List<String?> text;
  final Color? textColor;
  const ParagraphText({super.key, required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = AppTheme.currentTheme.textTheme.bodyMedium?.copyWith(color: textColor);
    return text.length == 1
        ? Text(
            "${text[0] ?? "Null paragraph text string"}\n\n",
            style: textStyle,
          )
        : RichText(
            text: TextSpan(
              children: text.map((str) {
                return TextSpan(text: '$str\n\n', style: textStyle);
              }).toList(),
            ),
          );
  }
}
