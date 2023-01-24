import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as imglib;
import 'package:slicer/services/image_getter.dart';

Future<List<Image>> splitImage(String url) async {
  int howMuchPart = 6;
  // convert image to image from image package
  Uint8List imageBit = await NetworkImageGetter(url);
  imglib.Image? image = imglib.decodeImage(imageBit);

  int x = 0, y = 0;
  int width = (image!.width / howMuchPart).round();
  int height = (image.height / howMuchPart).round();

  // split image to parts
  List<imglib.Image> parts = <imglib.Image>[];
  for (int i = 0; i < howMuchPart; i++) {
    for (int j = 0; j < howMuchPart; j++) {
      parts.add(
          imglib.copyCrop(image, x: x, y: y, width: width, height: height));
      x += width;
    }
    x = 0;
    y += height;
  }

  // convert image from image package to Image Widget to display
  List<Image> output = <Image>[];
  for (var img in parts) {
    output.add(await convertImageToFlutterUi(img));
  }
  return output;
}

Future<Image> convertImageToFlutterUi(imglib.Image image) async {
  if (image.format != imglib.Format.uint8 || image.numChannels != 4) {
    final cmd = imglib.Command()
      ..image(image)
      ..convert(format: imglib.Format.uint8, numChannels: 4);
    final rgba8 = await cmd.getImageThread();
    if (rgba8 != null) {
      image = rgba8;
    }
  }

  ImmutableBuffer buffer =
      await ImmutableBuffer.fromUint8List(image.toUint8List());

  ImageDescriptor id = ImageDescriptor.raw(buffer,
      height: image.height,
      width: image.width,
      pixelFormat: PixelFormat.rgba8888);

  Codec codec = await id.instantiateCodec(
      targetHeight: image.height, targetWidth: image.width);

  FrameInfo fi = await codec.getNextFrame();
  Image uiImage = fi.image;

  return uiImage;
}
