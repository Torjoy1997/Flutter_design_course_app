import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 28),
      child: Container(
        padding: const EdgeInsets.only(
            top: 12.5, bottom: 13.5, right: 14.5, left: 20.5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: AppDefineColors.kShadowColor,
                  blurRadius: 16,
                  offset: Offset(0, 4))
            ]),
        width: 60,
        height: 60,
        child: Image.asset('asset/icons/icon-play.png'),
      ),
    );
  }
}
