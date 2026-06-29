@echo off
echo Installing PyInstaller (skips if already installed)...
pip install pyinstaller

echo Building GameList Visual Editor.exe...
pyinstaller --onefile --windowed --name "GameList Visual Editor" gamelist_visual_editor.py

echo.
echo Done. Find it in the dist folder.
pause
