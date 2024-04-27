import 'dart:math';

import 'package:flutter/material.dart';

class CertificateViewer extends StatefulWidget {
  const CertificateViewer({super.key});

  @override
  State<CertificateViewer> createState() => _CertificateViewerState();
}

class _CertificateViewerState extends State<CertificateViewer> {
  late Widget certificateViewer;
  final List<String> certificatePaths = [
    'asset/certificates/certificate-01.png',
    'asset/certificates/certificate-02.png',
    'asset/certificates/certificate-03.png',
  ];
  @override
  void initState() {
    super.initState();
    List<Widget> imageChildren = [];

    certificatePaths.asMap().forEach((index, certificate) {
      int angleDegree = 0;
      if (index == certificatePaths.length - 1) {
        angleDegree = 0;
      } else {
        angleDegree = Random().nextInt(10) - 5;
      }
      imageChildren.add(
        Transform.rotate(
          angle: angleDegree * (pi / 180),
          child: Image.asset(
            certificate,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );
    });

    certificateViewer = Stack(
      children: imageChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: certificateViewer,
    );
  }
}
