#!/bin/bash

echo "🚀 Weck-Anruf App Build Script"
echo "-----------------------------"

# Prüfe ob Flutter installiert ist
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter ist nicht installiert!"
    echo "Bitte folge zuerst der Installationsanleitung in der README.md"
    exit 1
fi

echo "✅ Flutter gefunden"

# Abhängigkeiten installieren
echo "📦 Installiere Abhängigkeiten..."
flutter pub get

if [ $? -eq 0 ]; then
    echo "✅ Abhängigkeiten erfolgreich installiert"
else
    echo "❌ Fehler beim Installieren der Abhängigkeiten"
    exit 1
fi

# App bauen
echo "🔨 Baue die App..."
flutter build apk

if [ $? -eq 0 ]; then
    echo "✅ App erfolgreich gebaut"
    echo "📱 Die APK findest du hier: build/app/outputs/flutter-apk/app-release.apk"
else
    echo "❌ Fehler beim Bauen der App"
    exit 1
fi

# Prüfe ob ein Gerät verbunden ist
echo "🔍 Suche nach verbundenen Geräten..."
DEVICES=$(flutter devices)

if [[ $DEVICES == *"android"* ]] || [[ $DEVICES == *"sdk"* ]]; then
    echo "📱 Gerät gefunden!"
    echo "⏳ Installiere App auf dem Gerät..."
    flutter install
    
    if [ $? -eq 0 ]; then
        echo "✅ App erfolgreich installiert!"
        echo "🎉 Du kannst die App jetzt auf deinem Gerät benutzen"
    else
        echo "❌ Fehler beim Installieren der App"
        echo "Versuche die APK manuell zu installieren:"
        echo "1. Kopiere die APK auf dein Handy"
        echo "2. Öffne die APK auf deinem Handy"
        echo "3. Folge den Anweisungen zur Installation"
    fi
else
    echo "⚠️ Kein Gerät gefunden"
    echo "Bitte verbinde dein Handy per USB oder starte den Emulator"
    echo "Die APK findest du hier: build/app/outputs/flutter-apk/app-release.apk"
fi