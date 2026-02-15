# Generator Fuel Tracking & Analytics App
### Intelligent Mobile System for Fuel Consumption Monitoring

[cite_start]This application is a cross-platform solution developed to digitize the management of internal combustion engine generators[cite: 24]. [cite_start]It replaces manual logging with a digital system featuring local data persistence and graphical trend visualization[cite: 25, 214].

---

## 1. Core Features
* [cite_start]**Digital Logging**: Interfaces for recording fuel quantity, cost, and timestamps[cite: 52, 58].
* [cite_start]**Data Persistence**: Asynchronous local storage using the `shared_preferences` package[cite: 26, 173].
* [cite_start]**Trend Analytics**: Bar chart visualization to detect consumption peaks and mechanical inefficiencies[cite: 25, 193].
* [cite_start]**History Audit**: Monthly filtering of records for focused maintenance planning[cite: 186].

---

## 2. System Architecture
[cite_start]The app utilizes a Modular Layered Architecture for high maintainability and reproducibility [cite: 122-124, 147]:

* [cite_start]**Data Layer (`lib/models`)**: Defines the `FuelLog` class and its serialization methods[cite: 152, 169].
* [cite_start]**Storage Layer (`lib/services`)**: Manages the storage service and asynchronous JSON handling[cite: 159, 172].
* [cite_start]**Presentation Layer (`lib/screens`)**: Contains the Splash, Add Log, History, and Summary screens [cite: 158, 181-188].

**Flow Diagram:**
[cite_start]`UI Screen` -> `JSON Serialization` -> `Storage Service` -> `SharedPreferences` [cite: 226-227].

---

## 3. Data Persistence Logic
[cite_start]To ensure zero data loss without a cloud backend, the app employs **JSON Serialization**[cite: 26, 110]:

1. [cite_start]**Object to Map**: The `FuelLog` object is converted into a key-value Map[cite: 114].
2. [cite_start]**Encoding**: The Map is encoded into a **JSON String**[cite: 115].
3. [cite_start]**Commit**: The string is saved into the phone's non-volatile memory via `SharedPreferences` [cite: 107-109, 116].
4. [cite_start]**Decoding**: On startup, the string is decoded back into the application state [cite: 117-118, 175].

---

## 4. Setup and Installation
[cite_start]**Requirements:** Flutter SDK v3.38.5, Dart v3.6.0, and VS Code [cite: 132-134].

1. **Clone the Repo:**
   ```bash
   git clone [https://github.com/erioluwafifo-netizen/generator_fuel_log_app](https://github.com/erioluwafifo-netizen/generator_fuel_log_app)

2.  Fetch Dependencies:

 flutter pub get

 Note: Dependencies include shared_preferences, fl_chart, and intl .

3. Run Application:

 flutter run

4. Credits

Developers: Group 4 | Dept. Information and communication Engineering, Class 23, FUTA .

## 🛠️ Project Structure

lib/
├── models/      # Data structures (FuelLog class)
├── screens/     # UI Pages (Splash, Add, History, Summary)
├── services/    # Global variables and persistence logic
└── widgets/     # Reusable UI components (AppDrawer)