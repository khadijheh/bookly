import 'package:bookly/features/home/data/model/book_model/book_model.dart';

import 'book_details_section.dart';
import 'custom_book_detail_app_bar.dart';
import 'similar_book_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                BookDetailsSection(bookModel: bookModel,),
                Expanded(child: const SizedBox(height: 50)),
                SimilarBookSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
