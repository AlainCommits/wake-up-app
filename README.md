# Weck-Anruf App - Installations-Guide

Hey! Hier ist deine Schritt-für-Schritt Anleitung, wie du die Weck-Anruf App auf deinem Computer entwickelst und auf dein Handy bekommst.

## Teil 1: Android Studio installieren (für den Handy-Emulator)

1. Geh auf die Android Studio Website:
   - Öffne deinen Browser
   - Geh zu: https://developer.android.com/studio
   - Klick auf den großen grünen "Download Android Studio" Button
   - Wähle die Version für dein Betriebssystem (Windows/Mac)

2. Android Studio installieren:
   - Doppelklick auf die heruntergeladene Datei
   - Folge dem Installations-Assistenten (klick einfach immer auf "Weiter"/"Next")
   - Am Ende klickst du auf "Fertig"/"Finish"

3. Android Studio zum ersten Mal starten:
   - Starte Android Studio
   - Beim ersten Start erscheint ein Setup-Assistent
   - Wähle "Standard" Installation
   - Klick dich durch den Assistenten (immer "Next")
   - Das dauert ein paar Minuten und lädt einige zusätzliche Komponenten herunter

## Teil 2: Flutter installieren

1. Flutter herunterladen:
   - Geh zu: https://docs.flutter.dev/get-started/install
   - Scroll runter bis "Get the Flutter SDK"
   - Lade die ZIP-Datei für dein Betriebssystem herunter

2. Flutter einrichten:
   - Erstelle einen Ordner "flutter" in "C:\flutter" (Windows) oder "~/flutter" (Mac)
   - Entpacke die ZIP-Datei in diesen Ordner
   - WICHTIG: Merke dir diesen Pfad!

3. Flutter zur PATH-Variable hinzufügen:
   
   Für Windows:
   - Drücke Windows-Taste + R
   - Tippe "systempropertiesadvanced" und drücke Enter
   - Klick auf "Umgebungsvariablen"
   - Unter "Benutzervariablen" wähle "Path"
   - Klick auf "Neu"
   - Füge den Pfad "C:\flutter\bin" hinzu
   - OK klicken und alle Fenster schließen

   Für Mac:
   - Öffne Terminal
   - Tippe: `open -e ~/.zshrc`
   - Füge diese Zeile hinzu: `export PATH="$PATH:~/flutter/bin"`
   - Speichern und Terminal neu starten

4. Überprüfen der Installation:
   - Öffne ein neues Terminal/Kommandozeile
   - Tippe: `flutter doctor`
   - Dies zeigt dir, ob alles korrekt installiert ist

## Teil 3: Handy-Emulator erstellen

1. Android Studio öffnen:
   - Starte Android Studio
   - Klick auf "Tools" → "Device Manager"
   - Klick auf "Create Device"

2. Emulator konfigurieren:
   - Wähle "Pixel 6" (oder ein anderes Handy)
   - Klick "Next"
   - Wähle die neueste Android Version (z.B. "API 33")
   - Klick auf "Download" neben der Android Version
   - Warte bis der Download fertig ist
   - Klick "Next" und dann "Finish"

## Die einfache Methode: Build-Skripte benutzen! 🚀

Ich habe dir zwei einfache Skripte vorbereitet, mit denen du die App ganz leicht installieren kannst:

### Wenn du Windows hast:
1. Doppelklicke einfach auf die Datei `build.bat`
2. Ein schwarzes Fenster öffnet sich
3. Folge den Anweisungen im Fenster
4. Warte bis alles fertig ist

### Wenn du Mac oder Linux hast:
1. Öffne ein Terminal
2. Geh in den wake_up_app Ordner
3. Tippe diese zwei Befehle:
   ```bash
   chmod +x build.sh
   ./build.sh
   ```
4. Folge den Anweisungen im Terminal

Die Skripte machen automatisch alles für dich:
- Prüfen ob Flutter richtig installiert ist
- Laden alle nötigen Dateien herunter
- Bauen die App
- Installieren sie auf deinem Handy (wenn es angeschlossen ist)

## Die manuelle Methode (wenn die Skripte nicht funktionieren)

1. App-Ordner vorbereiten:
   - Entpacke den "wake_up_app" Ordner den du von mir bekommen hast
   - Öffne ein Terminal/Kommandozeile
   - Navigiere in den Ordner (mit dem `cd` Befehl)
   - Tippe: `flutter pub get`

2. App im Emulator starten:
   - Starte den Emulator aus Android Studio
   - Im Terminal, immer noch im wake_up_app Ordner, tippe:
   - `flutter run`
   - Warte bis die App startet (das kann beim ersten Mal etwas dauern)

## App auf dein echtes Handy bringen

1. Entwickleroptionen auf deinem Handy aktivieren:
   - Geh zu den Einstellungen
   - Scroll ganz nach unten zu "Über das Telefon"
   - Tippe 7 mal schnell auf "Build-Nummer"
   - Du siehst eine Nachricht "Du bist jetzt ein Entwickler"

2. USB-Debugging aktivieren:
   - Geh zurück zu Einstellungen
   - Scroll nach unten zu "Entwickleroptionen"
   - Aktiviere "USB-Debugging"

3. Handy mit Computer verbinden:
   - Verbinde dein Handy per USB-Kabel
   - Auf deinem Handy erscheint eine Meldung "USB-Debugging zulassen?"
   - Wähle "Zulassen"

4. App installieren:
   - Im Terminal, im wake_up_app Ordner, tippe:
   - `flutter build apk`
   - Dann: `flutter install`
   - Die App wird auf dein Handy installiert

## Häufige Probleme und Lösungen

1. "Flutter command not found":
   - Überprüfe, ob du Flutter korrekt zur PATH-Variable hinzugefügt hast
   - Starte dein Terminal/Kommandozeile neu

2. Emulator startet nicht:
   - Überprüfe in Android Studio unter "Tools" → "SDK Manager"
   - Stelle sicher, dass du die Android SDK installiert hast

3. App baut nicht:
   - Führe `flutter clean` aus
   - Dann `flutter pub get`
   - Versuche es erneut mit `flutter run`

4. Build-Skript funktioniert nicht:
   - Versuche die manuelle Installation wie oben beschrieben
   - Oft hilft es auch, den Computer neu zu starten

Komm einfach auf mich zu, wenn du Hilfe brauchst! 😊# wake-up-app
