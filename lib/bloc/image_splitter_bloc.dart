import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicer/services/image_splitter.dart';

class ImageSplitterBloc extends Bloc<String, List<Image>> {
  ImageSplitterBloc() : super(<Image>[]) {
    on<String>((event, emit) async {
      if (event.isNotEmpty) {
        emit(await splitImage(event));
      }
    });
  }
}
