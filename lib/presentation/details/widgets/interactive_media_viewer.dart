import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:saiyo_pets/presentation/details/widgets/details_body.dart';

class InteractiveMediaViewer extends StatelessWidget {
  const InteractiveMediaViewer({
    super.key,
    required this.id,
    required this.image,
  });

  final String id;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: PhotoView(
            errorBuilder: (context, error, stackTrace) =>
                const ImageErrorView(),
            imageProvider: CachedNetworkImageProvider(
              image,
            ),
            minScale: 0.5,
            maxScale: 5.0,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 80.0,
          child: Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
