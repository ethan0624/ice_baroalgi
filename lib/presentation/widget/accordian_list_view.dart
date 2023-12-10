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
  final List<int> _expanedIndexs = [];

  _initial() {
    setState(() {
      if (widget.initialExpanedIndex > -1) {
        _expanedIndexs.add(widget.initialExpanedIndex);
      }
    });
  }

  _onPressed(int index, bool isExpaned) {
    setState(() {
      if (isExpaned) {
        if (_expanedIndexs.contains(index)) return;

        _expanedIndexs.add(index);
      } else {
        _expanedIndexs.remove(index);
      }
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
          isExpaned: _expanedIndexs.contains(index),
          title: widget.titleBuilder(context, index),
          content: widget.contentBuilder(context, index),
          onExpansionChanged: (isExpaned) => _onPressed(index, isExpaned),
        );
      },
    );
  }
}
