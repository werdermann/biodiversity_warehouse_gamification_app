# App starten

1. Flutter-Tutorial (https://docs.flutter.dev/get-started/install) zum Aufsetzen der Entwicklungsumgebung folgen.

2. Android-Studio (https://docs.flutter.dev/get-started/editor?tab=androidstudio) installieren.

3. Mithilfe von `flutter doctor` im Terminal überprüfen, ob Umgebung installiert ist. (Für die Entwicklung von iOS-Anwendungen, wird ein Apple-Computer benötigt.)

4. Projekt in Android-Studio öffnen und im Terminal des Projektverzeichnis `flutter pub get` aufrufen, um die Pakete des Projekts zu laden.

5. `baseUrl`-Variable in der `Constants`-Klasse an Emulator anpassen. Android-Emulatoren sollten die Netzwerkadresse `10.0.2.2` und iOS-Emulatoren `127.0.0.1` besitzen. 