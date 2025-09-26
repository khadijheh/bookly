import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widget/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widget/books_actions.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_list_view_item.dart';
import 'package:flutter/widgets.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: CustonListViewItem(
            imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail,
          ),
        ),
        const SizedBox(height: 26),

        Text(
          bookModel.volumeInfo.title!,
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),

        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors!.first,
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 13),
        BookRating(
          count: bookModel.volumeInfo.pageCount,
          rating: bookModel.volumeInfo.pageCount,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),

         BooksActions(bookModel: bookModel,),
      ],
    );
  }
}
