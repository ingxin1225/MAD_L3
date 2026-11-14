import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final bool isLandscape;

  const HeaderImageWidget({
    super.key,
    this.isLandscape = false,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/rajang_river.jpg',
      width: double.infinity,
      height: isLandscape ? null : 230,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: isLandscape ? double.infinity : 230,
          width: double.infinity,
          color: Colors.blueGrey,
          alignment: Alignment.center,
          child: const Icon(
            Icons.directions_boat,
            size: 72,
            color: Colors.white,
          ),
        );
      },
    );
  }
}