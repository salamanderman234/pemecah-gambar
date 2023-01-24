// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicer/bloc/image_splitter_bloc.dart';
import 'package:slicer/services/image_splitter.dart';

class ImagePage extends StatelessWidget {
  final String url;
  late List<ui.Image> imageList = <ui.Image>[];
  ImagePage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ui.Image>>(
        future: splitImage(url),
        builder: (context, AsyncSnapshot<List<ui.Image>> snapshot) {
          if (snapshot.hasData) {
            imageList = List<ui.Image>.from(snapshot.data!);
            return ListView(
              children: List.generate(
                imageList.length,
                (index) {
                  RawImage rawImage = RawImage(
                    image: imageList[index],
                  );
                  return rawImage;
                },
              ),
            );
          }
          return const Text("tai");
        },
      ),
    );
  }
}
