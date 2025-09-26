import '../../../../../core/utils/style.dart';
import 'similar_books_list_view.dart';
import 'package:flutter/widgets.dart';

class SimilarBookSection extends StatelessWidget {
  const SimilarBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "You can also like",
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 10),
        const SimilarBooksListView(),
        const SizedBox(height: 40),
      ],
    );
  }
}
