import 'package:bookly/core/widget/custom_error_widget.dart';
import 'package:bookly/core/widget/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/view%20model/Newest_book/newest_book_cubit.dart';
import 'package:bookly/features/home/presentation/view%20model/Newest_book/newest_book_state.dart';
import 'package:bookly/features/home/presentation/views/widget/best_saller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSallerListView extends StatelessWidget {
  const BestSallerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if (state is NewestBookSuccess) {
          return ListView.builder(
            // physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, indext) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: BestSallerListViewItem(
                  bookModel: state.books[indext]
                  ),
              );
            },
          );
        }else if (state is NewestBookFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
