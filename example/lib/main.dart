import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_painter/image_painter.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'delegate.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Painter Example',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF1C1C1E),
          disabledColor: const Color(0xFF2B2B2D),
          textTheme: const TextTheme().apply(
            bodyColor: const Color(0xFFFFFFFF),
            displayColor: const Color(0xFFFFFFFF),
          ),
          dialogTheme: const DialogTheme(
            backgroundColor: Color(0xFF1C1C1E),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1C1C1E),
          ),
          drawerTheme: const DrawerThemeData(
            backgroundColor: Color(0xFF1C1C1E),
          ),
          colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            background: Color(0xFF1C1C1E),
            onBackground: Color(0xFF1C1C1E),
            error: Color(0xFFFF3B30),
            onError: Color(0xFFFF3B30),
            primary: Color(0xFF0C6F4B), //cursor and button hover color
            onPrimary: Color(0xFFFFFFFF),
            secondary: Color(0xFF0C6F4B),
            onSecondary: Color(0xFF0C6F4B),
            surface: Color(0xFFFFFFFF),
            onSurface: Color(0xFFFFFFFF),
            tertiary: Color(0xFF3A3A3C),
          )),
      home: const ImagePainterExample(),
    );
  }
}

class ImagePainterExample extends StatefulWidget {
  const ImagePainterExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImagePainterExampleState createState() => _ImagePainterExampleState();
}

class _ImagePainterExampleState extends State<ImagePainterExample> {
  final _imageKey = GlobalKey<ImagePainterState>();
  final _key = GlobalKey<ScaffoldState>();

  void saveImage() async {
    final image = await _imageKey.currentState?.exportImage();
    if (image == null) {
      return;
    }
    final directory = (await getApplicationDocumentsDirectory()).path;
    await Directory('$directory/sample').create(recursive: true);
    final fullPath =
        '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
    final imgFile = File(fullPath);
    imgFile.writeAsBytesSync(image);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[700],
        padding: const EdgeInsets.only(left: 10),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Image Exported successfully.",
                style: TextStyle(color: Colors.white)),
            TextButton(
              onPressed: () => OpenFile.open(fullPath),
              child: Text(
                "Open",
                style: TextStyle(
                  color: Colors.blue[200],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ImagePainter.asset(
      "assets/trest2.png",
      closeWidget: Icon(Icons.close),
      key: _imageKey,
      scalable: true,
      controlsAtTop: true,
      initialStrokeWidth: 4,
      textDelegate: DutchTextDelegate(),
      colors: const [
        Color(0xFF0C6F4B),
        Color(0xFFFF3B30),
        Color(0xFFFF3B31),
        Color(0xFFFF3B32),
        Color(0xFFFF3B33),
        Color(0xFFFF3B34),
        Color(0xFFFFFFFF),
        Color(0xFF1C1C1E),
      ],
      initialColor: const Color(0xFF0C6F4B),
      initialPaintMode: PaintMode.none,
      onSave: (p0) async {
        final String path = (await getApplicationDocumentsDirectory()).path;
        var newFile = await File(path + "/testi2.png").writeAsBytes(p0);

        print("yesss");
        print(newFile.path);
// copy the file to a new path
      },
    );
  }
}
