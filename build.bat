@echo off
echo 🚀 Weck-Anruf App Build Script
echo -----------------------------

REM Prüfe ob Flutter installiert ist
where flutter >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Flutter ist nicht installiert!
    echo Bitte folge zuerst der Installationsanleitung in der README.md
    pause
    exit /b 1
)

echo ✅ Flutter gefunden

REM Abhängigkeiten installieren
echo 📦 Installiere Abhängigkeiten...
call flutter pub get
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Fehler beim Installieren der Abhängigkeiten
    pause
    exit /b 1
)
echo ✅ Abhängigkeiten erfolgreich installiert

REM App bauen
echo 🔨 Baue die App...
call flutter build apk
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Fehler beim Bauen der App
    pause
    exit /b 1
)
echo ✅ App erfolgreich gebaut
echo 📱 Die APK findest du hier: build\app\outputs\flutter-apk\app-release.apk

REM Prüfe ob ein Gerät verbunden ist
echo 🔍 Suche nach verbundenen Geräten...
flutter devices > devices.tmp
findstr /i "android" devices.tmp >nul
if %ERRORLEVEL% EQU 0 (
    echo 📱 Gerät gefunden!
    echo ⏳ Installiere App auf dem Gerät...
    call flutter install
    if %ERRORLEVEL% EQU 0 (
        echo ✅ App erfolgreich installiert!
        echo 🎉 Du kannst die App jetzt auf deinem Gerät benutzen
    ) else (
        echo ❌ Fehler beim Installieren der App
        echo Versuche die APK manuell zu installieren:
        echo 1. Kopiere die APK auf dein Handy
        echo 2. Öffne die APK auf deinem Handy
        echo 3. Folge den Anweisungen zur Installation
    )
) else (
    echo ⚠️ Kein Gerät gefunden
    echo Bitte verbinde dein Handy per USB oder starte den Emulator
    echo Die APK findest du hier: build\app\outputs\flutter-apk\app-release.apk
)

del devices.tmp
pause