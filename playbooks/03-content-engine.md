# Playbook 03: Content engine

Goal: 3 to 5 short videos a week from the owner's phone footage, reused for organic posts, ads and SEO pages.

## The pipeline

1. **Capture.** The owner (or crew) films 30 to 90 seconds on the phone: a before/after, a tip, a customer question
   answered. Upload in God Mode Cut (`claude-video-editing-god-mode/app`). Add a one-line note per clip.
2. **Gate.** The approval rules in God Mode Cut decide what goes to the editor (manual, auto, conditional, full auto).
3. **Edit.** The editing PC runs `scripts/drive-inbox.mjs`, which calls Claude with `short-form-edit` and the brand
   profile. One to six options come back as versions.
4. **Approve.** The owner (or the client, for agencies) approves in the app or asks for changes with a note.
5. **Publish.** Buffer schedules the approved cut to the brand's channels.
6. **Reuse.**
   - **Ads:** the best organic performer each week becomes an ad creative (Meta Ads God Mode `/ads:creative`).
   - **SEO:** long-form or how-to videos get a transcript page with VideoObject schema (SEO God Mode schema
     tools), linked from the matching service page.
   - **CRM:** schedule before/after clips in the CRM's social calendar.

## Taste loop

Rate every option Yes, Maybe or No. Video God Mode writes the ratings into `raw-media/styles/<brand>/ratings.json`
and the next edits follow them. Lock a caption style once the owner approves it.
