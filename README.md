# SpendSense

**SpendSense** is a privacy-first iOS app that helps users track subscriptions and recurring expenses — with clear totals, upcoming renewals, and lightweight insights to reduce “cost creep.”

Built with **SwiftUI** and **SwiftData**.  
**No accounts. No analytics. No tracking. No backend.** Data stays on-device.

---

## Why SpendSense

Recurring expenses are easy to forget and hard to audit. SpendSense makes it fast to answer:

- What’s my **monthly** and **annualized** recurring spend?
- What renews in the **next 30 days**?
- What are my **largest subscriptions**?
- Do I have any **duplicates** (e.g., same service added twice)?

---

## Features (MVP)

- ✅ Add / Edit / Delete subscriptions
- ✅ Fields: name, cost, billing cycle (monthly/annual/custom), next renewal date, category, notes
- ✅ Total **monthly equivalent** spend + **annualized** spend
- ✅ Upcoming renewals (next 30 days)
- ✅ Search + filters (category, timeframe, active/inactive)
- ✅ Insights:
  - Largest subscriptions
  - Possible duplicates (by normalized name)

### Nice-to-haves (future)
- Local notifications 1–3 days before renewal
- CSV export
- Vendor name normalization & tagging

---

## Tech Stack

- **SwiftUI** (UI)
- **SwiftData** (local persistence)
- **XCTest** (unit tests for spend math + filtering)
- **iOS Simulator** for multi-device testing

---

## Privacy

SpendSense is built to be **App Store–compliant** and privacy-first:

- No sign-in / account system
- No analytics SDKs
- No third-party tracking
- No network requests required for core functionality
- All data stored **locally on device**

---

## Architecture

Lightweight, practical MVVM:

- `Models/` — SwiftData models (e.g., `Subscription`)
- `Persistence/` — ModelContainer + sample data
- `Features/` — screens grouped by feature (List, Form, Insights)
- `Utilities/` — pure functions for spend math, filtering, normalization

Business logic (totals, filters, insights) is kept in testable Swift structs.

---

## Screenshots

> Coming soon (once UI stabilizes)

Planned screens:
- Subscriptions List (totals + upcoming renewals)
- Add/Edit Subscription Form
- Subscription Detail
- Insights

---

## Roadmap

- [ ] Week 1: SwiftData model + CRUD + navigation
- [ ] Week 2: totals + upcoming renewals + UI polish
- [ ] Week 3: search/filters + insights
- [ ] Week 4: tests + accessibility + App Store readiness + screenshots

---

## Getting Started

1. Clone the repo
2. Open `SpendSense.xcodeproj` (or `.xcworkspace`) in the latest stable Xcode
3. Run on iOS Simulator

---

## License

MIT
