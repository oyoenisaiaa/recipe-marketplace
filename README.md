# Cookpedia - a 🍽️ Chef Profile App — Flutter UI Project

A Flutter application built as part of a UI replication and widget practice exercise.
The app demonstrates the use of `StatefulWidget`, `StatelessWidget`, `setState` and Navigator for screen transitions, alongside common Flutter layout widgets. Some `setState` added are for triggering navigation for future use

---

## 📱 Screens

### 1. Launcher Icon and Native Splash
- Displays a launcher icon on mobile
- Shows a native splash screen on all devices before transitioning to the Splash Screen

### 2. Splash Screen (`splash_screen.dart`)
- Built with `StatefulWidget`
- Displays the app logo and app name centered on screen
- Shows a red circular progress indicator
- Uses `initState()` and `Future.delayed` with `setState` to trigger automatic
  navigation after **3 seconds**
- Navigates to the Profile Screen using `Navigator.pushReplacement`
  (prevents returning to splash on back press)

### 3. Profile Screen (`profile_screen.dart`)
- Built with `StatelessWidget`
- Displays a chef's profile including photo, name, title, bio, and stats
- Contains a tab row (Recipe / Videos / Tag) where Recipe tab is indicated as active by default
- Lists reusable `FoodCard` widgets for each recipe

---

## ✨ Features

### Profile Header
- Centered **"Profile"** title with a `more_horiz` options icon
- Circular profile photo using `CircleAvatar` with an asset image
- Stats row showing **Recipe count** (per number of recipe cards), **Followers**, and **Following**
  via a reusable `ProfileData` widget

### Profile Details
- Full name, title (Chef), short bio, and a teal clickable text content - **"More..."** 

### Recipe Tabs
- Three tab labels: **Recipe** (active, teal filled), **Videos**, **Tag**
- Active tab styled with a teal background and rounded corners

### Food Cards (`FoodCard` — reusable `StatelessWidget`)
Each card includes:
- Full-width food image with a dark gradient overlay for text readability
- **Rating badge** (⭐ + score) pinned to the top-right corner via `ClipRRect` + `Stack` + `Positioned`
- Recipe **title** and **chef name** overlaid on the image
- Bottom row: chef name (left) | clock icon + "20 min" + bookmark + favorite/heart icons (right - added feature)
- **Bookmark icon** (white circle avatar)
- **Heart/Favorite icon** — filled red if `isFavorite: true`, outlined grey if false
- Tapping any card opens an **AlertDialog** with subscription simulation:
  - "Recipe Updates" heading
  - "Feature coming soon!" message
  - A **Switch** (always on, teal track, white thumb — static/visual only)
  - A teal **Close** button

### Bottom Navigation Bar (added feature)
- Four tabs: Home, Recipes, Favorites, Profile
- Recipe is the active/selected tab (teal) while inactive tabs are greyed
- Tapping any other tab shows a **"Feature coming soon!"** SnackBar

### Floating Action Button (added feature)
- Teal chat bubble FAB fixed to bottom-right
- Tapping shows a **"Chat feature coming soon!"** SnackBar
- Positioned so it never overlaps the recipe cards or "View All" button

### View All Button (added feature)
- Simulation for if screen was to have less cards initially until a user views all
- Right-aligned `TextButton.icon` at the bottom of the recipe list
- Tapping shows a **"More recipes coming soon!"** SnackBar

---

## 🧱 Widgets Used

| Widget | Purpose |
|---|---|
| `StatefulWidget` | Splash screen with navigation timer |
| `StatelessWidget` | Profile screen, `FoodCard`, `ProfileData` |
| `setState` | Triggers `Navigator.pushReplacement` after delay |
| `Navigator.pushReplacement` | Moves from splash to profile, no back stack |
| `Column` / `Row` | Page and card layout structure |
| `Container` | Cards, gradient overlay, tab styling |
| `Stack` / `Positioned` | Rating badge overlay on food cards |
| `CircleAvatar` | Profile photo, bookmark and heart icon buttons |
| `SizedBox` / `Padding` | Spacing and layout control |
| `Text` / `Icon` | Labels, bio, navigation and card icons |
| `AssetImage` | Profile photo and food card images |
| `AlertDialog` | Recipe update popup on card tap |
| `Switch` | Static visual toggle in dialog |
| `BottomNavigationBar` | App-wide tab navigation (added feature) |
| `FloatingActionButton` | Chat shortcut (added feature) |
| `SnackBar` | Feedback for unimplemented features |
| `InkWell` | Tappable ripple effect on food cards |
| `ClipRRect` | Clips food card corners to match rounded border radius | 

---

## 📁 Project Structure
```
lib/
├── main.dart               # App entry point, runs the app
├── splash_screen.dart      # Splash screen (StatefulWidget)
└── profile_screen.dart     # Profile screen, FoodCard, ProfileData widgets

assets/
├── chef.webp               # Profile photo
└── food_cards/             # Recipe card images
    ├── party-jollof.webp
    ├── fried-rice.webp
    └── ...
```

---

## 🚀 Getting Started
1. Clone the repository
2. Run `flutter pub get`
3. Add your assets to the `assets/` folder and register them in `pubspec.yaml`
4. Run with `flutter run`

---

## 🖼️ Image Sources
Images sourced from [Pexels](https://www.pexels.com) and [Unsplash](https://unsplash.com/)
