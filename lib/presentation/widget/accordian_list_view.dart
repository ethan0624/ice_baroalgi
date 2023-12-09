import 'package:flutter/material.dart';
import 'package:incheon_knowhow/presentation/widget/app_expansion_tile.dart';

class AccordianListView extends StatefulWidget {
  final int itemCount;
  final int initialExpanedIndex;
  final Color separatorColor;
  final Widget Function(BuildContext context, int index) titleBuilder;
  final Widget Function(BuildContext context, int index) contentBuilder;

  const AccordianListView({
    super.key,
    required this.itemCount,
    required this.titleBuilder,
    required this.contentBuilder,
    this.initialExpanedIndex = -1,
    this.separatorColor = const Color(0xFFCCCCCC),
  });

  @override
  State<AccordianListView> createState() => _AccordianListViewState();
}

class _AccordianListViewState extends State<AccordianListView> {
  int _expanedIndex = -1;

  _initial() {
    setState(() {
      _expanedIndex = widget.initialExpanedIndex;
    });
  }

  _onPressed(int index, bool isExpaned) {
    setState(() {
      _expanedIndex = isExpaned ? index : -1;
    });
  }

  @override
  void initState() {
    super.initState();

    _initial();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        return AppExpansionTile(
          isExpaned: index == _expanedIndex,
          title: widget.titleBuilder(context, index),
          content: widget.contentBuilder(context, index),
          onExpansionChanged: (isExpaned) => _onPressed(index, isExpaned),
        );
      },
    );
  }
}
