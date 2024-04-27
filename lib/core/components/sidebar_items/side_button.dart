import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class SideBarButton extends StatelessWidget {
  const SideBarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: const BoxConstraints(
        maxWidth: 40.0,
        maxHeight: 40.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: const [
            BoxShadow(
              color: AppDefineColors.kShadowColor,
              offset: Offset(0, 12),
              blurRadius: 16.0,
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 14.0,
        ),
        child: Image.asset(
          'asset/icons/icon-sidebar.png',
          color: AppDefineColors.kPrimaryLabelColor,
        ),
      ),
    );
  }
}
