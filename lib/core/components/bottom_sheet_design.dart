import 'package:flutter/material.dart';
import 'package:programming_course/utils/constants/colors.dart';

class BottomDraggAbleSheet extends StatefulWidget {
  const BottomDraggAbleSheet({super.key, required this.child, this.controller});

  final Widget child;
  final DraggableScrollableController? controller;

  @override
  State<BottomDraggAbleSheet> createState() => _BottomDraggAbleSheetState();
}

class _BottomDraggAbleSheetState extends State<BottomDraggAbleSheet> {
  final DraggableScrollableController controller =
      DraggableScrollableController();
  final sheet = GlobalKey();

  DraggableScrollableSheet get dragSheet =>
      (sheet.currentWidget as DraggableScrollableSheet);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DraggableScrollableSheet(
          key: sheet,
          controller: controller,
          initialChildSize: 0.04,
          maxChildSize: 0.8,
          minChildSize: 0.04,
          expand: true,
          snap: true,
          snapSizes: const [0.04, 0.5],
          builder: (context, scrollController) {
            return DecoratedBox(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppDefineColors.kShadowColor,
                        blurRadius: 15,
                        spreadRadius: 1,
                        offset: Offset(0, 2)),
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(22),
                      topLeft: Radius.circular(22))),
              child: SingleChildScrollView(
                controller: scrollController,
                child: widget.child,
              ),
            );
          },
        );
      },
    );
  }
}
