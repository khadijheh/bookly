import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_list_view_item.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import 'book_rating.dart';
import 'package:flutter/material.dart';

class BestSallerListViewItem extends StatelessWidget {
  const BestSallerListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBokDetailsView,extra:  bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              CustonListViewItem(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??"",
              ),
              // AspectRatio(
              //   aspectRatio: 2.5 / 4,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(16),
              //       image: const DecorationImage(
              //         fit: BoxFit.fill,
              //         image: AssetImage(AssetsData.book1),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        bookModel.volumeInfo.title!,
                        style: Styles.textStyle20.copyWith(
                          fontFamily: kGtsectraFine,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 3),

                    Text(bookModel.volumeInfo.authors![0], style: Styles.textStyle14),
                    const SizedBox(height: 3),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Free",
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        BookRating(rating:  bookModel.volumeInfo.pageCount??0,count: bookModel.volumeInfo.pageCount??0,),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
