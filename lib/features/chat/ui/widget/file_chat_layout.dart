import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import '../../../../core/layouts/icon_layout.dart';
import '../../model/file_model.dart';

class FileContainerBox extends StatelessWidget {
  const FileContainerBox(
      {super.key, required this.fileDataInfo, this.textColor = Colors.white});

  final FileModel fileDataInfo;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint(fileDataInfo.filePath);
        OpenFile.open(fileDataInfo.filePath);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconContainerBox(
              icon: const Icon(Icons.file_copy),
              backGroungColor: Colors.grey.shade400,
              width: 80,
              height: 80,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileDataInfo.name,
                  style: TextStyle(fontSize: 16, color: textColor),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${fileDataInfo.size.toStringAsPrecision(3)} Mb',
                  style: TextStyle(fontSize: 16, color: textColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
