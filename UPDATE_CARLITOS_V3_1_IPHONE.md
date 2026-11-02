# Carlitos Strong V3.1 — Exercise Video Links

## What changed

Every exercise now has a **▶ Video demo ↗** link directly below its illustration and coaching cue. For the default program, the link opens a tailored **YouTube search for a demonstration**, not a single pre-approved video. This is intentional: no unreliable YouTube video IDs are hardcoded. A parent should choose an age-appropriate demonstration from a qualified coach. Videos require internet access.

You can also set a **direct video URL** per exercise: **Edit plan → Choose day → Tap exercise name → Direct exercise video link (optional) → Save exercise**. Accepts HTTPS video URLs. With a link configured, the workout card says **▶ Watch video** and opens that exact page. When you add a new exercise, its video link defaults to an exercise-name YouTube search unless you supply a URL.

The existing illustrations, unlimited weeks, records, progress charts and optional cloud sync are unchanged. Local V2 backup migration and V3 storage keys are preserved. Video links can sync with customized exercise plans if cloud sync has been set up.

## Update directly from your iPhone

1. Save/download **Carlitos_Strong_V3_1_Video_Update.zip** to the iPhone **Files** app and tap it once to unzip.
2. In **Safari** (not the GitHub mobile app), open https://github.com/cbarros74/Cacos-Training/upload/main
3. Tap **Choose your files** → **Browse** → select the **two files inside the unzipped folder**: `index.html` and `sw.js`. Do not upload the ZIP itself.
4. Verify the new uploads have exactly the same filenames and are in the repository **root**, alongside `manifest.webmanifest` and the icons, not inside another directory.
5. Tap **Commit changes** on the `main` branch. This replaces the existing `index.html` and `sw.js`.
6. Open https://cbarros74.github.io/Cacos-Training/ in Safari and refresh. The small header should say **V3.1**, and each exercise card should show **▶ Video demo ↗**.
7. For the Home Screen app: close and reopen it to load the updated page; if necessary, visit the site in Safari first and refresh. Do not delete the Home Screen app or clear website data to force an update when you have workout records.

## Tips

- Tap **▶ Video demo** on each exercise; this opens YouTube results tailored to that exercise and is not an embedded video.
- To make it open one **specific coaching video**, copy its URL, then go to **Edit plan** and paste it into that exercise's **Direct exercise video link** field. Save.
- Parent supervision is recommended for youth strength training. Keep video demonstrations age-appropriate and technique-focused; start with light resistance.
- You do not need to create another GitHub repository, install software, or pay for GitHub Pages.
- If the previous V2 app is still installed and has records later, export a backup before updating. The updated file still migrates V2 records.
