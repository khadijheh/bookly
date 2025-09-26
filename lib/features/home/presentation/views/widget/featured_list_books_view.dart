import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widget/custom_error_widget.dart';
import 'package:bookly/core/widget/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/view%20model/feature_book/feature_book_cubit.dart';
import 'package:bookly/features/home/presentation/view%20model/feature_book/feature_book_state.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedListBooksView extends StatelessWidget {
  const FeaturedListBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBookCubit, FeatureBookState>(
      builder: (context, state) {
        if (state is FeatureBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics:const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) { 
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: GestureDetector(
                      onTap: (){
                      GoRouter.of(context).push(AppRouter.kBokDetailsView,extra: state.books[index] );

            },
                    child: CustonListViewItem(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail??'',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeatureBooksFailure) {
          return CustomErrorWidget(errMessage: state.errormessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
