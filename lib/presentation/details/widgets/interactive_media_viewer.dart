import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:interactiveviewer_gallery/interactiveviewer_gallery.dart';

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
        InteractiveviewerGallery(
          sources: [image],
          initIndex: 0,
          itemBuilder: (_, index, __) {
            return Hero(
              tag: id,
              child: CachedNetworkImage(
                imageUrl: image,
              ),
            );
          },
          onPageChanged: (pageIndex) {},
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
