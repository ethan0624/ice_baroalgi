import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class RelatedResultView extends StatelessWidget {
  final String keyword;
  final List<String> results;
  final ValueChanged<int>? onTap;
  final VoidCallback? onSearch;
  const RelatedResultView({
    super.key,
    required this.keyword,
    this.results = const [],
    this.onTap,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              keyword,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...results.mapIndexed(
            (index, e) => InkWell(
              onTap: () => onTap?.call(index),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextHighlight(
                      text: '$keyword역 뒷역',
                      words: {
                        keyword: HighlightedWord(
                          textStyle: context.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      },
                      textStyle: context.textTheme.bodyMedium,
                    ),
                    const RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_outward,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onSearch,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextHighlight(
                    text: '$keyword을 포함한 검색어 결과 노출',
                    words: {
                      keyword: HighlightedWord(
                        textStyle: context.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    },
                    textStyle: context.textTheme.bodyMedium,
                  ),
                  const RotatedBox(
                    quarterTurns: 3,
                    child: Icon(
                      Icons.arrow_outward,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
