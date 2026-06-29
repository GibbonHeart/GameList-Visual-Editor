[README.md](https://github.com/user-attachments/files/29457317/README.md)
# GameList-Visual-Editor
Allows you to adjust Onion OS game box art covering your game list text on Miyoo handhelds - live preview, batch image processing, font size editor. Mini / Mini Plus / Flip / Mini Flip.

If you've used Done Set 3 or any other Miyoo Mix-style art pack, you've probably run into this: the artwork sits at a fixed size on top of the screen, and depending on your theme and font size, it can eat into the title text above or below it. There's no setting buried in Onion to fix this - it's baked into how the (closed source) MainUI renders things. This tool works around it from the asset side instead: shrink the art, fade it, and/or shrink the list font, until it stops covering what you actually want to read.

<img width="655" height="578" alt="image" src="https://github.com/user-attachments/assets/f1093872-11ef-403f-b2d7-a471b5a714c2" />

<img width="426" height="320" alt="image" src="https://github.com/user-attachments/assets/31afe1e9-eade-41b9-92ab-d286409097bc" />

<img width="425" height="319" alt="image" src="https://github.com/user-attachments/assets/36e0644b-3da2-4a47-bea5-a856c3e1379a" />


## Features

- Live preview that updates instantly as you adjust height, opacity, or font size - built from real measurements taken off Onion's own theme files (screen size, header/footer bar height, max artwork size, list row height), not guesswork
- Device dropdown for Mini / Mini Plus / Flip / Mini Flip, since they don't all share the same screen resolution
- Preview against the built-in sample image, or load one of your own real PNGs to check against
- Batch-processes your actual `Imgs` folders: point it at your whole `Roms` folder and it finds and handles every system underneath automatically, no need to do it one folder at a time
- Game list font size editor for your theme's `config.json`, with automatic backup before any change and a one-click restore if you change your mind
- Remembers your last-used folders and settings between runs
- Saves a text summary of every batch run automatically

<img width="718" height="994" alt="Screenshot 2026-06-29 201304" src="https://github.com/user-attachments/assets/950abd3d-dfb8-4ae3-9f89-255c8f99c62b" />


## Getting it running

There are two ways to do this - pick whichever you're comfortable with.

### Option A: Just use the .exe (Windows, no Python needed)

Grab it from the **Releases** page on the right side of this repo, not from the source files themselves - it's not committed into the repo directly, just attached to releases.

One thing worth knowing: PyInstaller-built `.exe` files (which is how this one's made) quite often get **falsely flagged by Windows Defender or other antivirus** as suspicious. This is a known, common false positive with that build tool specifically, not a sign anything's actually wrong. If you'd rather not take that on faith, see Option B below - running from source means nothing's hidden from you.

### Option B: Run it from source yourself

This works on Windows, Mac, or Linux, and means you're running the exact code in this repo, nothing compiled or hidden.

1. Install Python if you don't have it already (python.org - on Windows, tick "Add Python to PATH" during install)
2. Install one extra package:
   ```
   pip install pillow
   ```
   Tkinter (the GUI part) comes bundled with Python already - nothing else to install.
3. Download `gamelist_visual_editor.py` from this repo
4. Run it:
   ```
   python gamelist_visual_editor.py
   ```

That's it - same tool, same result, just running from code you can open and read yourself first if you want.

## Using it

1. Pick your device from the dropdown - this changes the screen size used for the preview.
2. Play with the height/opacity/font sliders until the mockup looks right. There's a built-in sample image, or click "Use my own image" to check against one of your real ones.
3. For testing, pick a "Source folder" and point it at a game image of your choice 
4. Create a test output folder, then hit run.
5. If you also want the font size changed, point the bottom section at your theme's `config.json` and save.

### About source/output folders - read this part

You can point both Source and Output at the **same `Roms` folder**, and it'll process every system in place in one go - this is the fastest way to do your whole library at once.

Doing it this way has **no backup**. The font-size tool makes a `.bak` copy automatically before changing anything; the image batch processor does not. If you're not 100% sure on your settings yet, either:
- point Output at a separate empty folder first and check the results, or
- you may genuinely want to back up all your images in their own respective folders

Once you're confident in your settings, Roms-to-Roms is the quickest way to redo everything at once, i.e. source folder select roms and output folder select roms too

<img width="530" height="154" alt="image" src="https://github.com/user-attachments/assets/4d30b162-8610-42ea-99d6-32c5f17f13d7" />

## Sidenotes

- The live preview is a best-effort mockup. The numbers behind it (screen size, header/footer height, max artwork size) are measured directly from Onion's own official theme files, and the centering behavior was corrected against photos of an actual device - but MainUI itself is a closed-source binary, so there's a limit to how precisely this can ever be confirmed from the outside. Treat it as "very close," not "pixel-perfect guaranteed" on every possible theme.
- The Mini Flip's screen resolution is real and confirmed, but its header/footer bar heights are a proportional estimate, not measured from real assets like the other three devices.

## Building the .exe (for maintainers/contributors)

The `.exe` attached to Releases isn't built automatically - to produce a new one, run `build_exe.bat` on a Windows machine with Python installed. It uses PyInstaller to bundle everything into `dist/GameList Visual Editor.exe`, which then gets uploaded as a Release asset.

## License

Unlicense - public domain, do whatever you want with it.
