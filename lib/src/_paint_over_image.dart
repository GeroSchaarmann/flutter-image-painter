import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart' hide Image;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '_controller.dart';
import '_image_painter.dart';
import 'delegates/text_delegate.dart';
import 'widgets/_color_widget.dart';
import 'widgets/_range_slider.dart';

export '_image_painter.dart';

///[ImagePainter] widget.
@immutable
class ImagePainter extends StatefulWidget {
  const ImagePainter._({
    Key? key,
    this.assetPath,
    this.networkUrl,
    this.byteArray,
    this.file,
    this.height,
    this.width,
    this.placeHolder,
    this.isScalable,
    this.brushIcon,
    this.clearAllIcon,
    this.colorIcon,
    this.undoIcon,
    this.isSignature = false,
    this.controlsAtTop = true,
    this.signatureBackgroundColor,
    this.colors,
    this.initialPaintMode,
    this.initialStrokeWidth,
    this.initialColor,
    this.onColorChanged,
    this.onStrokeWidthChanged,
    this.onPaintModeChanged,
    this.onSave,
    this.loadingWidget,
    this.textDelegate,
    required this.closeWidget,
  }) : super(key: key);

  ///Constructor for loading image from network url.
  factory ImagePainter.network(
    String url, {
    required Key key,
    double? height,
    double? width,
    Widget? placeholderWidget,
    bool? scalable,
    List<Color>? colors,
    Widget? brushIcon,
    Widget? undoIcon,
    Widget? clearAllIcon,
    Widget? colorIcon,
    PaintMode? initialPaintMode,
    double? initialStrokeWidth,
    Color? initialColor,
    ValueChanged<PaintMode>? onPaintModeChanged,
    ValueChanged<Color>? onColorChanged,
    ValueChanged<double>? onStrokeWidthChanged,
    TextDelegate? textDelegate,
    bool? controlsAtTop,
    Function(Uint8List)? onSave,
    Widget? loadingWidget,
    required Widget closeWidget,
  }) {
    return ImagePainter._(
      key: key,
      networkUrl: url,
      height: height,
      width: width,
      placeHolder: placeholderWidget,
      isScalable: scalable,
      colors: colors,
      brushIcon: brushIcon,
      undoIcon: undoIcon,
      colorIcon: colorIcon,
      clearAllIcon: clearAllIcon,
      initialPaintMode: initialPaintMode,
      initialColor: initialColor,
      initialStrokeWidth: initialStrokeWidth,
      onPaintModeChanged: onPaintModeChanged,
      onColorChanged: onColorChanged,
      onStrokeWidthChanged: onStrokeWidthChanged,
      textDelegate: textDelegate,
      controlsAtTop: controlsAtTop ?? true,
      onSave: onSave,
      closeWidget: closeWidget,
      loadingWidget: loadingWidget,
    );
  }

  ///Constructor for loading image from assetPath.
  factory ImagePainter.asset(
    String path, {
    required Key key,
    required Widget closeWidget,
    double? height,
    double? width,
    bool? scalable,
    Widget? placeholderWidget,
    List<Color>? colors,
    Widget? brushIcon,
    Widget? undoIcon,
    Widget? clearAllIcon,
    Widget? colorIcon,
    PaintMode? initialPaintMode,
    double? initialStrokeWidth,
    Color? initialColor,
    ValueChanged<PaintMode>? onPaintModeChanged,
    ValueChanged<Color>? onColorChanged,
    ValueChanged<double>? onStrokeWidthChanged,
    TextDelegate? textDelegate,
    bool? controlsAtTop,
    Function(Uint8List)? onSave,
    Widget? loadingWidget,
  }) {
    return ImagePainter._(
      key: key,
      assetPath: path,
      height: height,
      width: width,
      isScalable: scalable ?? false,
      placeHolder: placeholderWidget,
      colors: colors,
      brushIcon: brushIcon,
      undoIcon: undoIcon,
      colorIcon: colorIcon,
      clearAllIcon: clearAllIcon,
      initialPaintMode: initialPaintMode,
      initialColor: initialColor,
      initialStrokeWidth: initialStrokeWidth,
      onPaintModeChanged: onPaintModeChanged,
      onColorChanged: onColorChanged,
      onStrokeWidthChanged: onStrokeWidthChanged,
      textDelegate: textDelegate,
      controlsAtTop: controlsAtTop ?? true,
      onSave: onSave,
      closeWidget: closeWidget,
      loadingWidget: loadingWidget,
    );
  }

  ///Constructor for loading image from [File].
  factory ImagePainter.file(
    File file, {
    required Key key,
    double? height,
    double? width,
    bool? scalable,
    Widget? placeholderWidget,
    List<Color>? colors,
    Widget? brushIcon,
    Widget? undoIcon,
    Widget? clearAllIcon,
    Widget? colorIcon,
    PaintMode? initialPaintMode,
    double? initialStrokeWidth,
    Color? initialColor,
    ValueChanged<PaintMode>? onPaintModeChanged,
    ValueChanged<Color>? onColorChanged,
    ValueChanged<double>? onStrokeWidthChanged,
    TextDelegate? textDelegate,
    bool? controlsAtTop,
    Function(Uint8List)? onSave,
    required Widget closeWidget,
    Widget? loadingWidget,
  }) {
    return ImagePainter._(
      key: key,
      file: file,
      height: height,
      width: width,
      placeHolder: placeholderWidget,
      colors: colors,
      isScalable: scalable ?? false,
      brushIcon: brushIcon,
      undoIcon: undoIcon,
      colorIcon: colorIcon,
      clearAllIcon: clearAllIcon,
      initialPaintMode: initialPaintMode,
      initialColor: initialColor,
      initialStrokeWidth: initialStrokeWidth,
      onPaintModeChanged: onPaintModeChanged,
      onColorChanged: onColorChanged,
      onStrokeWidthChanged: onStrokeWidthChanged,
      textDelegate: textDelegate,
      controlsAtTop: controlsAtTop ?? true,
      onSave: onSave,
      closeWidget: closeWidget,
      loadingWidget: loadingWidget,
    );
  }

  ///Constructor for loading image from memory.
  factory ImagePainter.memory(
    Uint8List byteArray, {
    required Key key,
    double? height,
    double? width,
    bool? scalable,
    Widget? placeholderWidget,
    List<Color>? colors,
    Widget? brushIcon,
    Widget? undoIcon,
    Widget? clearAllIcon,
    Widget? colorIcon,
    PaintMode? initialPaintMode,
    double? initialStrokeWidth,
    Color? initialColor,
    ValueChanged<PaintMode>? onPaintModeChanged,
    ValueChanged<Color>? onColorChanged,
    ValueChanged<double>? onStrokeWidthChanged,
    TextDelegate? textDelegate,
    bool? controlsAtTop,
    Function(Uint8List)? onSave,
    required Widget closeWidget,
    Widget? loadingWidget,
  }) {
    return ImagePainter._(
      key: key,
      byteArray: byteArray,
      height: height,
      width: width,
      placeHolder: placeholderWidget,
      isScalable: scalable ?? false,
      colors: colors,
      brushIcon: brushIcon,
      undoIcon: undoIcon,
      colorIcon: colorIcon,
      clearAllIcon: clearAllIcon,
      initialPaintMode: initialPaintMode,
      initialColor: initialColor,
      initialStrokeWidth: initialStrokeWidth,
      onPaintModeChanged: onPaintModeChanged,
      onColorChanged: onColorChanged,
      onStrokeWidthChanged: onStrokeWidthChanged,
      textDelegate: textDelegate,
      controlsAtTop: controlsAtTop ?? true,
      onSave: onSave,
      closeWidget: closeWidget,
      loadingWidget: loadingWidget,
    );
  }

  ///Constructor for signature painting.
  factory ImagePainter.signature({
    required Key key,
    Color? signatureBgColor,
    double? height,
    double? width,
    List<Color>? colors,
    Widget? brushIcon,
    Widget? undoIcon,
    Widget? clearAllIcon,
    Widget? colorIcon,
    ValueChanged<PaintMode>? onPaintModeChanged,
    ValueChanged<Color>? onColorChanged,
    ValueChanged<double>? onStrokeWidthChanged,
    TextDelegate? textDelegate,
    bool? controlsAtTop,
    Function(Uint8List)? onSave,
    required Widget closeWidget,
    Widget? loadingWidget,
  }) {
    return ImagePainter._(
      key: key,
      height: height,
      width: width,
      isSignature: true,
      isScalable: false,
      colors: colors,
      signatureBackgroundColor: signatureBgColor ?? Colors.white,
      brushIcon: brushIcon,
      undoIcon: undoIcon,
      colorIcon: colorIcon,
      clearAllIcon: clearAllIcon,
      onPaintModeChanged: onPaintModeChanged,
      onColorChanged: onColorChanged,
      onStrokeWidthChanged: onStrokeWidthChanged,
      textDelegate: textDelegate,
      controlsAtTop: controlsAtTop ?? true,
      onSave: onSave,
      closeWidget: closeWidget,
      loadingWidget: loadingWidget,
    );
  }

  ///Only accessible through [ImagePainter.network] constructor.
  final String? networkUrl;

  ///Only accessible through [ImagePainter.memory] constructor.
  final Uint8List? byteArray;

  ///Only accessible through [ImagePainter.file] constructor.
  final File? file;

  ///Only accessible through [ImagePainter.asset] constructor.
  final String? assetPath;

  ///Height of the Widget. Image is subjected to fit within the given height.
  final double? height;

  ///Width of the widget. Image is subjected to fit within the given width.
  final double? width;

  ///Widget to be shown during the conversion of provided image to [ui.Image].
  final Widget? placeHolder;

  ///Defines whether the widget should be scaled or not. Defaults to [false].
  final bool? isScalable;

  ///Flag to determine signature or image;
  final bool isSignature;

  ///Signature mode background color
  final Color? signatureBackgroundColor;

  ///List of colors for color selection
  ///If not provided, default colors are used.
  final List<Color>? colors;

  ///Icon Widget of strokeWidth.
  final Widget? brushIcon;

  ///Widget of Color Icon in control bar.
  final Widget? colorIcon;

  ///Widget for Undo last action on control bar.
  final Widget? undoIcon;

  ///Widget for clearing all actions on control bar.
  final Widget? clearAllIcon;

  ///Define where the controls is located.
  ///`true` represents top.
  final bool controlsAtTop;

  ///Initial PaintMode.
  final PaintMode? initialPaintMode;

  //the initial stroke width
  final double? initialStrokeWidth;

  //the initial color
  final Color? initialColor;

  final ValueChanged<Color>? onColorChanged;

  final ValueChanged<double>? onStrokeWidthChanged;

  final ValueChanged<PaintMode>? onPaintModeChanged;

  //the text delegate
  final TextDelegate? textDelegate;

  final Function(Uint8List)? onSave;

  final Widget closeWidget;
  final Widget? loadingWidget;

  @override
  ImagePainterState createState() => ImagePainterState();
}

///
class ImagePainterState extends State<ImagePainter> {
  final _repaintKey = GlobalKey();
  ui.Image? _image;
  late Controller _controller;
  late final ValueNotifier<bool> _isLoaded;
  late final TextEditingController _textController;
  late final TransformationController _transformationController;
  bool isLoading = false;
  int _strokeMultiplier = 1;
  late TextDelegate textDelegate;
  @override
  void initState() {
    super.initState();
    _isLoaded = ValueNotifier<bool>(false);
    _controller = Controller();
    if (widget.isSignature) {
      _controller.update(
        mode: PaintMode.freeStyle,
        color: Colors.black,
      );
    } else {
      _controller.update(
        mode: widget.initialPaintMode,
        strokeWidth: widget.initialStrokeWidth,
        color: widget.initialColor,
      );
    }
    _resolveAndConvertImage();

    _textController = TextEditingController();
    _transformationController = TransformationController();
    textDelegate = widget.textDelegate ?? TextDelegate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _isLoaded.dispose();
    _textController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  Paint get _paint => _controller.brush;

  bool get isEdited => _controller.paintHistory.isNotEmpty;

  Size get imageSize =>
      Size(_image?.width.toDouble() ?? 0, _image?.height.toDouble() ?? 0);

  ///Converts the incoming image type from constructor to [ui.Image]
  Future<void> _resolveAndConvertImage() async {
    if (widget.networkUrl != null) {
      _image = await _loadNetworkImage(widget.networkUrl!);
      if (_image == null) {
        throw ("${widget.networkUrl} couldn't be resolved.");
      } else {
        _setStrokeMultiplier();
      }
    } else if (widget.assetPath != null) {
      final img = await rootBundle.load(widget.assetPath!);
      _image = await _convertImage(Uint8List.view(img.buffer));
      if (_image == null) {
        throw ("${widget.assetPath} couldn't be resolved.");
      } else {
        _setStrokeMultiplier();
      }
    } else if (widget.file != null) {
      final img = await widget.file!.readAsBytes();
      _image = await _convertImage(img);
      if (_image == null) {
        throw ("Image couldn't be resolved from provided file.");
      } else {
        _setStrokeMultiplier();
      }
    } else if (widget.byteArray != null) {
      _image = await _convertImage(widget.byteArray!);
      if (_image == null) {
        throw ("Image couldn't be resolved from provided byteArray.");
      } else {
        _setStrokeMultiplier();
      }
    } else {
      _isLoaded.value = true;
    }
  }

  ///Dynamically sets stroke multiplier on the basis of widget size.
  ///Implemented to avoid thin stroke on high res images.
  _setStrokeMultiplier() {
    if ((_image!.height + _image!.width) > 1000) {
      _strokeMultiplier = (_image!.height + _image!.width) ~/ 1000;
    }
    _controller.update(strokeMultiplier: _strokeMultiplier);
  }

  ///Completer function to convert asset or file image to [ui.Image] before drawing on custompainter.
  Future<ui.Image> _convertImage(Uint8List img) async {
    final completer = Completer<ui.Image>();
    ui.decodeImageFromList(img, (image) {
      _isLoaded.value = true;
      return completer.complete(image);
    });
    return completer.future;
  }

  ///Completer function to convert network image to [ui.Image] before drawing on custompainter.
  Future<ui.Image> _loadNetworkImage(String path) async {
    final completer = Completer<ImageInfo>();
    var img = NetworkImage(path);
    img.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((info, _) => completer.complete(info)));
    final imageInfo = await completer.future;
    _isLoaded.value = true;
    return imageInfo.image;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoaded,
      builder: (_, loaded, __) {
        if (loaded) {
          return widget.isSignature ? _paintSignature() : _paintImage();
        } else {
          return Container(
            height: widget.height ?? double.maxFinite,
            width: widget.width ?? double.maxFinite,
            child: Center(
              child: widget.placeHolder ?? const CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  ///paints image on given constrains for drawing if image is not null.
  Widget _paintImage() {
    var bottomPadding = MediaQuery.of(context).padding.bottom;
    if (bottomPadding < 16) {
      bottomPadding = 16;
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _buildTopRow(),
      ),
      bottomNavigationBar: _buildControls(bottomPadding),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    child: InteractiveViewer(
                      maxScale: 4,
                      minScale: 1,
                      child: FittedBox(
                        alignment: FractionalOffset.center,
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return InteractiveViewer(
                              transformationController:
                                  _transformationController,
                              maxScale: 4,
                              minScale: 1,
                              panEnabled: _controller.mode == PaintMode.none,
                              scaleEnabled: widget.isScalable!,
                              onInteractionUpdate: _scaleUpdateGesture,
                              onInteractionEnd: _scaleEndGesture,
                              child: CustomPaint(
                                size: imageSize,
                                willChange: true,
                                isComplex: true,
                                painter: DrawImage(
                                  image: _image,
                                  controller: _controller,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (isLoading)
              Positioned.fill(
                  child: Container(
                color: (Theme.of(context).dialogTheme.backgroundColor ??
                        Colors.black)
                    .withOpacity(0.6),
                child: Center(
                  child: widget.loadingWidget != null
                      ? widget.loadingWidget
                      : Text("Loading..."),
                ),
              )),
          ],
        ),
      ),
    );
  }

  Widget _paintSignature() {
    return Stack(
      children: [
        RepaintBoundary(
          key: _repaintKey,
          child: ClipRect(
            child: Container(
              width: widget.width ?? double.maxFinite,
              height: widget.height ?? double.maxFinite,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return InteractiveViewer(
                    transformationController: _transformationController,
                    panEnabled: false,
                    scaleEnabled: false,
                    onInteractionStart: _scaleStartGesture,
                    onInteractionUpdate: _scaleUpdateGesture,
                    onInteractionEnd: _scaleEndGesture,
                    child: CustomPaint(
                      willChange: true,
                      isComplex: true,
                      painter: DrawImage(
                        isSignature: true,
                        backgroundColor: widget.signatureBackgroundColor,
                        controller: _controller,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  tooltip: textDelegate.undo,
                  icon: widget.undoIcon ??
                      Icon(Icons.reply,
                          color: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(1)),
                  onPressed: () => _controller.undo()),
              IconButton(
                tooltip: textDelegate.clearAllProgress,
                icon: widget.clearAllIcon ??
                    Icon(Icons.clear,
                        color: Theme.of(context)
                            .colorScheme
                            .surface
                            .withOpacity(1)),
                onPressed: () => _controller.clear(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _scaleStartGesture(ScaleStartDetails onStart) {
    final _zoomAdjustedOffset =
        _transformationController.toScene(onStart.localFocalPoint);
    if (!widget.isSignature) {
      _controller.setStart(_zoomAdjustedOffset);
      _controller.addOffsets(_zoomAdjustedOffset);
    }
  }

  ///Fires while user is interacting with the screen to record painting.
  void _scaleUpdateGesture(ScaleUpdateDetails onUpdate) {
    final _zoomAdjustedOffset =
        _transformationController.toScene(onUpdate.localFocalPoint);
    _controller.setInProgress(true);
    if (_controller.start == null) {
      _controller.setStart(_zoomAdjustedOffset);
    }
    _controller.setEnd(_zoomAdjustedOffset);
    if (_controller.mode == PaintMode.freeStyle) {
      _controller.addOffsets(_zoomAdjustedOffset);
    }
    if (_controller.onTextUpdateMode) {
      _controller.paintHistory
          .lastWhere((element) => element.mode == PaintMode.text)
          .offset = [_zoomAdjustedOffset];
    }
  }

  ///Fires when user stops interacting with the screen.
  void _scaleEndGesture(ScaleEndDetails onEnd) {
    _controller.setInProgress(false);
    if (_controller.start != null &&
        _controller.end != null &&
        (_controller.mode == PaintMode.freeStyle)) {
      _controller.addOffsets(null);
      _addFreeStylePoints();
      _controller.offsets.clear();
    } else if (_controller.start != null &&
        _controller.end != null &&
        _controller.mode != PaintMode.text) {
      _addEndPoints();
    }
    _controller.resetStartAndEnd();
  }

  void _addEndPoints() => _addPaintHistory(
        PaintInfo(
          offset: <Offset?>[_controller.start, _controller.end],
          paint: _paint,
          mode: _controller.mode,
        ),
      );

  void _addFreeStylePoints() => _addPaintHistory(
        PaintInfo(
          offset: <Offset?>[..._controller.offsets],
          paint: _paint,
          mode: PaintMode.freeStyle,
        ),
      );

  ///Provides [ui.Image] of the recorded canvas to perform action.
  Future<ui.Image> _renderImage() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final painter = DrawImage(image: _image, controller: _controller);
    final size = Size(_image!.width.toDouble(), _image!.height.toDouble());
    painter.paint(canvas, size);
    return recorder
        .endRecording()
        .toImage(size.width.floor(), size.height.floor());
  }

  // PopupMenuItem _showOptionsRow() {
  //   return PopupMenuItem(
  //     enabled: false,
  //     child: Center(
  //       child: SizedBox(
  //         child: Wrap(
  //           children: paintModes(textDelegate)
  //               .map(
  //                 (item) => SelectionItems(
  //                   data: item,
  //                   isSelected: _controller.mode == item.mode,
  //                   onTap: () {
  //                     if (widget.onPaintModeChanged != null &&
  //                         item.mode != null) {
  //                       widget.onPaintModeChanged!(item.mode!);
  //                     }
  //                     _controller.setMode(item.mode!);
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               )
  //               .toList(),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  PopupMenuItem _showRangeSlider() {
    return PopupMenuItem(
      enabled: false,
      child: SizedBox(
        width: double.maxFinite,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return RangedSlider(
              value: _controller.strokeWidth,
              onChanged: (value) {
                _controller.setStrokeWidth(value);
                if (widget.onStrokeWidthChanged != null) {
                  widget.onStrokeWidthChanged!(value);
                }
              },
            );
          },
        ),
      ),
    );
  }

  PopupMenuItem _showColorPicker() {
    return PopupMenuItem(
        enabled: false,
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: (widget.colors ?? editorColors).map((color) {
              return ColorItem(
                isSelected: color == _controller.color,
                color: color,
                onTap: () {
                  _controller.setColor(color);
                  if (widget.onColorChanged != null) {
                    widget.onColorChanged!(color);
                  }
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        ));
  }

  ///Generates [Uint8List] of the [ui.Image] generated by the [renderImage()] method.
  ///Can be converted to image file by writing as bytes.
  Future<Uint8List?> exportImage() async {
    late ui.Image _convertedImage;

    if (widget.isSignature) {
      final _boundary = _repaintKey.currentContext!.findRenderObject()
          as RenderRepaintBoundary;
      _convertedImage = await _boundary.toImage(pixelRatio: 3);
    } else if (widget.byteArray != null && _controller.paintHistory.isEmpty) {
      return widget.byteArray;
    } else {
      _convertedImage = await _renderImage();
    }
    final byteData =
        await _convertedImage.toByteData(format: ui.ImageByteFormat.png);
    return byteData?.buffer.asUint8List();
  }

  void _addPaintHistory(PaintInfo info) {
    if (info.mode != PaintMode.none) {
      _controller.addPaintInfo(info);
    }
  }

  // void _openTextDialog() {
  //   _controller.setMode(PaintMode.text);
  //   final fontSize = 6 * _controller.strokeWidth;

  //   TextDialog.show(
  //     context,
  //     _textController,
  //     fontSize,
  //     _controller.color,
  //     textDelegate,
  //     onFinished: (context) {
  //       if (_textController.text != '') {
  //         setState(
  //           () {
  //             _addPaintHistory(
  //               PaintInfo(
  //                 mode: PaintMode.text,
  //                 text: _textController.text,
  //                 paint: _paint,
  //                 offset: [],
  //               ),
  //             );
  //           },
  //         );
  //         _textController.clear();
  //       }
  //       Navigator.of(context).pop();
  //     },
  //   );
  // }
  Widget _buildTopRow() {
    return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Row(
        children: [
          widget.closeWidget,
          const Spacer(),
          IconButton(
            splashRadius: 20,
            tooltip: textDelegate.save,
            icon: Icon(Icons.save_outlined,
                color: Theme.of(context).colorScheme.surface.withOpacity(1)),
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              if (widget.onSave != null) {
                var exportedImage = await exportImage();
                if (exportedImage != null) {
                  await widget.onSave!(exportedImage);
                }
              }
              setState(() {
                isLoading = false;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildControls(double bottomPadding) {
    return Container(
      height: bottomPadding + 54,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomActionBox(
            label: textDelegate.noneZoom,
            isActive: _controller.mode == PaintMode.none,
            iconData: Icons.zoom_out_map,
            bottomPadding: bottomPadding,
            action: () {
              if (widget.onPaintModeChanged != null) {
                widget.onPaintModeChanged!(PaintMode.none);
              }
              setState(() {
                _controller.setMode(PaintMode.none);
              });
            },
          ),
          BottomActionBox(
            label: textDelegate.drawing,
            isActive: _controller.mode == PaintMode.freeStyle,
            bottomPadding: bottomPadding,
            iconData: Icons.edit,
            action: () {
              if (widget.onPaintModeChanged != null) {
                widget.onPaintModeChanged!(PaintMode.freeStyle);
              }
              setState(() {
                _controller.setMode(PaintMode.freeStyle);
              });
            },
          ),
          Flexible(
            fit: FlexFit.tight,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return PopupMenuButton(
                  splashRadius: 2,
                  color: Theme.of(context).disabledColor,
                  padding: const EdgeInsets.all(0),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: BottomBox(
                    bottomPadding: bottomPadding,
                    label: textDelegate.changeColor,
                    isActive: false,
                    child: Container(
                      padding: const EdgeInsets.all(7.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        color: _controller.color,
                      ),
                    ),
                  ),
                  itemBuilder: (_) => [_showColorPicker()],
                );
              },
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: PopupMenuButton(
              splashRadius: 20,
              tooltip: textDelegate.changeBrushSize,
              color: Theme.of(context).disabledColor,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: BottomBox(
                bottomPadding: bottomPadding,
                label: textDelegate.changeBrushSize,
                child: Icon(Icons.brush,
                    size: 20,
                    color:
                        Theme.of(context).colorScheme.surface.withOpacity(1)),
              ),
              itemBuilder: (_) => [_showRangeSlider()],
            ),
          ),
          BottomActionBox(
            bottomPadding: bottomPadding,
            label: textDelegate.undo,
            iconData: Icons.reply,
            action: () => _controller.undo(),
          ),
        ],
      ),
    );
  }
}

class BottomBox extends StatelessWidget {
  final Widget child;
  final String label;
  final bool isActive;
  final double bottomPadding;
  const BottomBox({
    Key? key,
    required this.child,
    required this.label,
    required this.bottomPadding,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 12,
          ),
          Center(child: Container(height: 20, child: child)),
          Spacer(),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: isActive
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surface,
                ),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: bottomPadding)
        ],
      ),
    );
  }
}

class BottomActionBox extends StatelessWidget {
  final IconData iconData;
  final String label;
  final bool isActive;
  final Function action;
  final double bottomPadding;

  const BottomActionBox({
    Key? key,
    required this.iconData,
    required this.label,
    this.isActive = false,
    required this.action,
    required this.bottomPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.tight,
        child: GestureDetector(
          onTap: () => action(),
          child: BottomBox(
            label: label,
            isActive: isActive,
            bottomPadding: bottomPadding,
            child: Icon(
              iconData,
              size: 20,
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surface,
            ),
          ),
        ));
  }
}
