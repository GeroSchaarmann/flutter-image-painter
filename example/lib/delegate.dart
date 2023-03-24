import 'package:image_painter/image_painter.dart';

class DutchTextDelegate implements TextDelegate {
  @override
  String get arrow => "Pfeil";

  @override
  String get changeBrushSize => "Stiftdicke ändern";

  @override
  String get changeColor => "Farbe ändern";

  @override
  String get changeMode => "Modus ändern";

  @override
  String get circle => "Kreis";

  @override
  String get clearAllProgress => "Alles Entfernen";

  @override
  String get dashLine => "Gestrichelte Linie";

  @override
  String get done => "Fertig";

  @override
  String get drawing => "Zeichnen";

  @override
  String get line => "Linie";

  @override
  String get noneZoom => "Zoomen";

  @override
  String get rectangle => "Rechteck";

  @override
  String get text => "Text";

  @override
  String get undo => "Zurücksetzen";
}
