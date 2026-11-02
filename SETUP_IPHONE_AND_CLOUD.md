# Carlitos Strong V3 — iPhone and Cloud Sync Guide

## A. Upgrade your EXISTING GitHub Pages website

Your existing repository is **cbarros74/Cacos-Training**, with branch **main**, deployed from **/(root)**.

1. **BEFORE UPDATING:** On the currently installed Carlitos Strong app on EACH iPhone where there are records, open **Progress / Guide → Export Backup** and save each JSON file in **Files / iCloud Drive**. Old web-app storage can sometimes be separate from Safari storage. Never uninstall the old Home Screen icon before confirming the backup.
2. Download the provided **Carlitos_Strong_V3_GitHub_Update.zip** into Files and tap the ZIP to extract it.
3. On your iPhone, open **Safari**, sign into [your repository](https://github.com/cbarros74/Cacos-Training), then use this direct [upload screen](https://github.com/cbarros74/Cacos-Training/upload/main).
4. Tap **Choose your files**, then Browse to the extracted folder. Select **index.html** and **sw.js** (NOT the ZIP and NOT the SQL file).
5. Confirm GitHub shows two modified/replaced files and tap **Commit changes** to branch **main**. If GitHub offers to overwrite same-name files, proceed.
6. Visit **https://cbarros74.github.io/Cacos-Training/** in Safari. The header should say **V3** and show **Edit plan** and **Sync & backup**.
7. If the old page remains, refresh Safari, close and reopen the Home Screen app, and wait for GitHub Pages to finish publishing. Do NOT clear Safari data or delete the app before exporting backups.
8. On **each phone**, if records did not migrate automatically, choose **Sync & backup → Import V2 / V3 backup** and select the previously saved JSON file. Import **merges** instead of deleting existing sessions.

No separate GitHub software is required. The other icons and manifest already in your repo are reused. The file **sw.js** is necessary to replace the older offline cache behavior.

## B. What works immediately without cloud setup

- Unlimited workout weeks (the week number increases automatically from November 3, 2026).
- Change workouts, add or remove exercises on iPhone (removing a planned exercise does not delete prior logs).
- Built-in exercise illustrations, dates, sets, pounds, reps and notes.
- Charts for push-ups, plank, jump, 10m sprint and machine/dumbbell training weights.
- JSON backup and CSV export.
- Existing V2 records copied automatically from the storage key **carlitosTrainingV2**, IF the new app opens in the same storage context. The original V2 key is not modified.

Without cloud sync enabled, workouts remain local to each individual phone. They are NOT automatically shared by GitHub.

## C. Optional: enable sync between your phone and Carlitos' phone

Cloud sync needs a backend. GitHub Pages only hosts static files. This version uses **Supabase** with an adult-managed email sign-in and Row-Level Security (RLS). A free Supabase plan may be sufficient for a small family app, subject to the provider's current limitations. This setup is not finished until YOU configure the following.

1. Visit **https://supabase.com** and create a project **under the parent's account**.
2. In the project, select **SQL Editor → New query**. Open **supabase_setup.sql** from the update package, copy its entire contents into the SQL Editor, and **Run** it. Verify the `public.carlitos_records` table and its RLS policies exist.
3. Go to **Authentication → Email Templates → Magic Link** and customize the template to display a one-time code instead of a link, e.g. `<p>Your sign-in code: {{ .Token }}</p>` and save. (Some Supabase versions show 6–8 digits. Use the complete emailed code.)
4. In your Supabase project settings, locate **Project URL** and **Publishable / anon key** under API Keys. Do **not** use the secret/service_role key.
5. Open Carlitos Strong on **your iPhone → Sync & backup**. Enter the project URL and publishable key, then tap **Save cloud configuration**.
6. Enter a **parent-controlled email address**, tap **Email sign-in code**, check that inbox and enter the complete code in **Verify & sign in**. Tap **Sync now**. Your existing local records will upload. If one device already has cloud records, the app merges records by date/exercise session rather than replacing all data.
7. On **Carlitos' iPhone**, open the same public GitHub Pages URL (or existing Home Screen icon). Save the **same** Supabase URL and publishable key, sign in using **the same parent-controlled email account** (parent receives the code), and press **Sync now**.
8. Check both phones' **Progress** tabs. Continue to tap **Sync now** whenever you want to confirm the most recent records have reached the other phone. Auto-sync is enabled while online, when app returns to foreground, and periodically while open.

**Important:** Avoid editing the *same dated workout* on both phones simultaneously. If this happens, the most recently saved entire dated workout wins. Different workout dates and different benchmark IDs merge independently. Keep periodic backups in iCloud Drive. A Supabase account should be controlled by a parent because the athlete is a minor.

## D. Privacy and security

- Your **GitHub Pages site is public**; do not publish private medical information, home address, or raw backup files to GitHub.
- The app's data is stored in the browser, and when you connect cloud sync, in YOUR Supabase project. Supabase cloud records are restricted to the signed-in parent account by the SQL RLS policies.
- The public Supabase **publishable/anon key is not a password**; using it is safe only if you applied the supplied SQL RLS rules. NEVER enter a secret or service_role key into the browser.
- Access to the parent email's one-time sign-in codes grants access to the cloud records. Keep the inbox secure.
- Signing out does not delete local records on the device. Clearing website data or removing an iOS web app may delete them. Export backups.

## E. Notes on training safety

Carlitos is 11. The plan is for supervised fitness, safe lifting technique, agility and fun sports—not rapid weight loss. Start with manageable weights, avoid maximal lifting, and keep 2–3 high-quality reps in reserve. Stop for pain or unusual symptoms. Consult the pediatrician about growth/weight concerns and lingering exercise restrictions after surgery.
