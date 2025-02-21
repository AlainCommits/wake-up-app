# Weck-Anruf App - Windows Installations-Guide

## Teil 1: Code herunterladen und einrichten

### GitHub Projekt herunterladen
1. Öffne einen Browser und geh zu diesem Link:
   ```
   https://github.com/AlainCommits/wake-up-app
   ```
2. Klicke auf den grünen "Code" Button
3. Klicke auf "Download ZIP"
4. Die Datei wird als "wake-up-app-main.zip" heruntergeladen
5. Entpacke die ZIP-Datei:
   - Rechtsklick auf die ZIP-Datei
   - "Alle extrahieren..." wählen
   - Wähle einen Ordner aus, wo du das Projekt haben möchtest
   - Klicke "Extrahieren"

### Projekt in Android Studio öffnen
1. Starte Android Studio
2. Klicke auf "Open"
3. Suche den Ordner, wo du das Projekt entpackt hast
4. Wähle den "wake-up-app-main" Ordner aus
5. Klicke auf "OK"
6. Warte bis Android Studio das Projekt lädt
   - Es erscheint "Gradle Build Running" unten
   - Das kann ein paar Minuten dauern
7. Wenn Android Studio fragt "Trust and Open Project?":
   - Haken bei "Trust project" setzen
   - Auf "Trust and Open" klicken

## Teil 2: Voraussetzungen installieren

### Android Studio installieren (falls noch nicht geschehen)
1. Öffne www.developer.android.com/studio im Browser
2. Klicke auf den großen grünen "Download Android Studio" Button
3. Lade die .exe Datei herunter
4. Doppelklicke auf die heruntergeladene Datei
5. Klicke dich durch die Installation:
   - "Next" klicken
   - Installation Location bestätigen (Standard ist okay)
   - "Next" klicken
   - "Install" klicken
   - Warten bis die Installation fertig ist
   - "Next" klicken
   - "Finish" klicken
6. Beim ersten Start von Android Studio:
   - "Next" bei "Welcome" klicken
   - "Standard" Installation wählen
   - "Next" klicken
   - Warten bis alles heruntergeladen ist (dauert einige Minuten)
   - "Finish" klicken

### Flutter installieren
1. Geh zu flutter.dev/docs/get-started/install/windows
2. Klicke auf "Flutter SDK"
3. Lade die .zip Datei herunter
4. Erstelle einen Ordner "C:\flutter"
5. Entpacke die ZIP-Datei dort hinein
6. Flutter zur PATH-Variable hinzufügen:
   - Windows-Taste + R drücken
   - "systempropertiesadvanced" eingeben
   - Enter drücken
   - Auf "Umgebungsvariablen" klicken
   - Unter "Benutzervariablen" auf "Path" doppelklicken
   - Auf "Neu" klicken
   - "C:\flutter\bin" eingeben
   - OK klicken
   - Alle Fenster mit OK schließen
7. Computer neu starten

## Teil 3: App auf dein Handy bringen

Du hast zwei Möglichkeiten:

### Methode 1: Über Android Studio (empfohlen)
1. Schließe dein Handy per USB an
2. Aktiviere USB-Debugging auf deinem Handy:
   - Geh zu Einstellungen
   - Scroll ganz nach unten zu "Über das Telefon"
   - Tippe 7 mal auf "Build-Nummer"
   - Geh zurück und finde "Entwickleroptionen"
   - Schalte "USB-Debugging" ein
3. In Android Studio:
   - Warte bis das Projekt vollständig geladen ist
   - Dein Handy sollte oben in der Geräteliste erscheinen
   - Klicke auf den grünen "Play" Button
   - Die App wird automatisch gebaut und installiert

### Methode 2: Mit dem build.bat Skript
1. Geh in den Projektordner
2. Doppelklicke auf `build.bat`
3. Folge den Anweisungen im Fenster

Das Skript macht automatisch:
- Prüft ob Flutter installiert ist
- Lädt Abhängigkeiten herunter
- Baut die App
- Installiert sie auf deinem Handy

## Probleme? Hier sind die Lösungen:

### Android Studio erkennt Flutter nicht
1. In Android Studio:
   - File → Settings
   - Suche nach "Flutter"
   - Bei "Flutter SDK path" gib ein: C:\flutter
   - Klicke "OK"
   - Warte auf den Neustart

### "Flutter wird nicht erkannt"
1. Prüfe ob Flutter richtig installiert ist:
   - Öffne cmd
   - Tippe: `flutter doctor`
2. Wenn der Befehl nicht funktioniert:
   - Computer neu starten
   - PATH-Variable nochmal prüfen

### Handy wird nicht erkannt
1. USB-Debugging nochmal aus- und einschalten
2. Anderes USB-Kabel probieren
3. In den Entwickleroptionen:
   - "USB-Debugging" aus- und wieder einschalten
   - "USB-Konfiguration" auf "Dateiübertragung" stellen

## Fertig? So benutzt du die App:

1. Starte die App auf deinem Handy
2. Tippe auf das + Symbol
3. Wähle eine Uhrzeit für den Weckruf
4. Gib eine Telefonnummer ein
5. Fertig! Die App wird zur eingestellten Zeit anrufen

Brauchst du Hilfe? Schreib mir einfach! 😊
