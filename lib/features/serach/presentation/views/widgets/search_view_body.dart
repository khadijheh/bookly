import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/serach/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/features/serach/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearchTextField(),
          const SizedBox(height: 15),
          Text(
            'Result Search',
            style: Styles.textStyle18.copyWith(fontFamily: kGtsectraFine),
          ),
          const SizedBox(height: 15),

          Expanded(child: SaerchResultListView()),
        ],
      ),
    );
  }
}
