import 'package:bookly/core/widget/custom_error_widget.dart';
import 'package:bookly/core/widget/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/view%20model/similar_book/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/view%20model/similar_book/similar_books_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
                  return SizedBox(
          height: MediaQuery.of(context).size.height * .12,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.bookModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: CustonListViewItem(imageUrl: state.bookModel[index].volumeInfo.imageLinks!.thumbnail),
              );
            },
          ),
        );
        }else if(state is SimilarBooksFailure ){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else {
          return CustomLoadingIndicator();
        }

      },
    );
  }
}
