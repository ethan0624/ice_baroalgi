import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/config/constrants.dart';

class AppExpansionTile extends StatelessWidget {
  final bool isExpaned;
  final Widget title;
  final Widget content;
  final Color separatorColor;
  final ValueChanged<bool>? onExpansionChanged;
  const AppExpansionTile({
    super.key,
    required this.title,
    required this.content,
    this.isExpaned = false,
    this.separatorColor = const Color(0xFFEFEFEF),
    this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onExpansionChanged?.call(!isExpaned);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultMarginValue, vertical: 12),
            child: Row(
              children: [
                Expanded(child: title),
                AnimatedRotation(
                  turns: isExpaned ? 0.25 : 0.75,
                  duration: AnimationDuration.shortest,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1, color: separatorColor),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultMarginValue, vertical: 14),
              color: const Color(0xfff5f5f5),
              child: content,
            ),
            crossFadeState: isExpaned
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: AnimationDuration.shortest,
          ),
        ],
      ),
    );
  }
}
