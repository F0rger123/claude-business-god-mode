# Playbook 01: Launch a new business (week one)

Goal: in five working sessions, a new business has a profile, a live CRM, a rated website, paused ad campaigns
ready for approval and its first edited video. Each step names the part that does it.

## Day 1: profile and CRM

1. **Interview (Business God Mode).** Copy `templates/BUSINESS.md` to `business/BUSINESS.md`. Ask, five questions at
   a time: business basics, services and prices, service area, ideal customer, brand voice, goals, ad budget,
   who approves spend and videos. Write the answers in as you go.
2. **CRM (Ultimate CRM Template).** Say: *"Create a new CRM for this business from
   https://github.com/F0rger123/ultimate-crm-template. Begin onboarding. Use business/BUSINESS.md as the profile."*
   The CRM wizard creates a **private** repo for the business, a Supabase project and a Cloudflare Pages site.
3. Record the CRM repo URL and app URL in `BUSINESS.md` → "Parts in use".

Done when: the owner can sign in to the CRM, the company settings match the profile, and a test lead from
`#/lead-form` appears in the pipeline.

## Day 2: website and SEO baseline

1. **Rate the site (SEO God Mode).** *"Rate my website SEO-wise: <website>"*. Save the report.
2. **Onboard the SEO client.** *"Use CLAUDE SEO GOD MODE for this new client. Business: <name>. Website: <url>.
   Primary area: <city>. Start onboarding."*
3. Connect Search Console and Bing if the owner has access (SEO repo `docs/CONNECT.md`). Never ask for key contents
   in chat.
4. Add the CRM lead form (embed code from CRM → Lead intake) to the contact and service pages.

Done when: the SEO client profile exists, the top five fixes are listed with owners, and the lead form is live.

## Day 3: ads, built paused

1. **Onboard the ads client (Meta Ads God Mode).** *"Add <name> as a new ads client."* Then `/mcp` → `meta-ads` →
   sign in, and `/ads:doctor`.
2. **Plan.** *"Build a <service> lead campaign in <city> on Meta at <daily budget>/day."* Use the profile's offers
   and the CRM lead form as the destination, with `source=meta-ads`.
3. Everything is created **PAUSED**. Show the owner the plan, the creatives and the total daily spend. Turn on only
   after the owner says yes in chat.

Done when: campaigns exist paused, tracking is verified (`/ads:tracking`), and the owner has approved or declined.

## Day 4: first videos

1. **Set up the brand (Video Editing God Mode).** Copy `brands/example-brand` to `raw-media/styles/<brand-slug>/`
   and fill `inspiration.md` from the profile's video references.
2. **Edit.** *"Edit raw/<clip>.mp4 into a 30-second reel for <brand>. Hook in the first second, captions,
   motion-graphics B-roll for every point."*
3. Optional: deploy God Mode Cut (`app/docs/DEPLOYMENT.md`) so the owner uploads from their phone and approves edits.

Done when: one reel is approved by the owner. Hand the 9:16 and 4:5 files to the ads plan as creatives.

## Day 5: connect and review

1. Check every lead source lands in the CRM with its source tag (submit one test lead per source).
2. Turn on CRM automations: new lead text-back, quote follow-up, review request after job completion.
3. Write `business/HANDOFF.md`: what is live, what is paused, what waits for the owner, next week's plan.
4. Schedule `playbooks/04-monthly-review.md` for the end of the month.
