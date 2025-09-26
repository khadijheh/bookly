import 'package:bookly/core/widget/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustonListViewItem extends StatelessWidget {
  const CustonListViewItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          placeholder:(context,url)=>const CustomLoadingIndicator(),
          errorWidget: (context, url, erorr) => Icon(Icons.error_outline),
        ),
      ),
    );
  }
}
