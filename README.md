# Generator Fuel Log App ⚡

A professional Flutter mobile application designed to track fuel consumption, costs, and maintenance trends for power generators.

##  Features
- **Persistence:** Data is saved locally using SharedPreferences (survives app restarts).
- **Trends:** Visual bar charts showing fuel usage history using `fl_chart`.
- **Filtering:** History logs can be filtered by month.
- **Branding:** Custom "Tech-Feel" Deep Teal UI with a bolt-themed splash screen.

## 🛠️ Project Structure
```text
lib/
├── models/      # Data structures (FuelLog class)
├── screens/     # UI Pages (Splash, Add, History, Summary)
├── services/    # Global variables and persistence logic
└── widgets/     # Reusable UI components (AppDrawer)