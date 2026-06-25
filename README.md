# Cookpedia - 🍽️ Recipe Marketplace App

A Flutter application built as part of a UI replication and navigation practice project. The app demonstrates the use of:
- `StatefulWidget` and `StatelessWidget` widgets
- Form validation using TextFormField
- Data passing between screens using constructors
- Bottom Navigation Bar implementation
- Network image loading
- Navigation using Navigator.pushReplacement
- Reusable widgets and clean UI design

---

## 📱 App flow and Screens

### 1. Launcher Icon and Native Splash
- Displays a launcher icon on supported devices
- Shows a native splash screen before Flutter initializes

### 2. Splash Screen (`splash_screen.dart`)
- Built with `StatefulWidget`
- Displays a network image logo and app name centered on screen
- Shows a loading indicator
- Uses `initState()` and `Future.delayed` with `setState` to trigger automatic navigation after **3 seconds**
- Navigates to the Login Screen using `Navigator.pushReplacement` (prevents returning to splash on back press)

### 3. Authentication Flow
Users can:
- Navigate between Login and Register screens
- Enter and validate required information
- Access the Main Screen after successful validation

----

**🔐 Login Screen**

*Features:*
- Email input field
- Password input field
- Password visibility toggle
- Form validation
- Navigation to Register Screen
- Network image logo

*Validation*
- Email cannot be empty
- Email must contain "@"
- Password cannot be empty
- Password must meet minimum length requirements

*Navigation*

After successful login:
- User is redirected to Main Screen
- Email is passed through the constructor

----

**📝 Register Screen**  
*Features:*
- Full Name field
- Email field
- Password and Confirm Password field
- Birth Date field using showDatePicker
- Password visibility toggles
- Network image logo

*Validation*
- Name cannot be empty
- Email must be valid
- Password must be at least 6 characters
- Confirm Password must match Password
- Birth Date must be selected

*Navigation*

After successful registration:
- User is redirected to Main Screen
- Name and Email are passed through constructors

### 4. Main Screen (`main_screen.dart`)
Built using: `StatefulWidget`, `BottomNavigationBar` and `IndexedStack`

**Why IndexedStack?**

IndexedStack preserves screen state when switching between tabs and prevents unnecessary widget rebuilding.

----

**Bottom Navigation Tabs**

*Home*

Displays:
- Welcome message
- Registered user's name (when available)
- User email

*Cart, Profile, Notifications and Settings*

Displays:
- Respective icons and tab labels

### 5. Profile Screen (`profile_screen.dart`)
Built with `StatelessWidget`and displays:

**User Information** 
- Network profile image
- Full name (when user registered)
- Email address

**Profile Header** 
- Profile title
- **"More..."** options icon
- Recipe statistics
- Followers
- Following

**Recipe Details** 
- Chef title
- Short bio
- "More..." link (`more_horiz` icon)

**Recipe Section** 
- Recipe tab
- Videos tab
- Tag tab

---

**🍲 Food Cards**

Reusable `FoodCard` widgets display:
- Food image
- Recipe title
- Chef name
- Cooking duration
- Rating badge
- Bookmark icon
- Favorite icon

*Card Interaction*  
Tapping a recipe card opens an AlertDialog containing:

- Recipe Updates title
- Feature coming soon message
- Toggle switch simulation
- Close button

---

**✨ Additional Features**  
*Floating Action Button*
- Chat icon
- Displays: "Chat feature coming soon"

*View All Button*
- Displays: "More recipes coming soon"

*SnackBars*
- Used throughout the application to provide feedback for future features.

---

## 🧱 Widgets Used

| Widget | Purpose |
|---|---|
| `StatefulWidget` | Splash screen, Main screen, Register screen |
| `StatelessWidget` | Profile screen, `FoodCard`, `ProfileData`, Placeholder Tabs |
| `Navigator.pushReplacement` | Navigation flow |
| `BottomNavigationBar` | App-wide tab navigation |
| `IndexedStack` | Preserves tab state |
| `Form` | Input validation |
| `TextFormField` | User input fields |
| `TextEditingController` | Form data handling |
| `showDatePicker` | Birth date selection |
| `CircleAvatar` | Profile photo, bookmark and heart icon buttons |
| `Container` | Layout and styling |
| `Column` / `Row` | Screen structure |
| `Stack` / `Positioned` | Rating badge placement |
| `AlertDialog` | Recipe update popup on card tab |
| `Switch` | Static visual toggle in dialog |
| `FloatingActionButton` | Chat shortcut |
| `SnackBar` | Feedback for unimplemented features |
| `InkWell` | Tapable interaction |
| `ClipRRect` | Clips food card corners to match rounded border radius | 
| `SizedBox` / `Padding` | Spacing and layout control |
| `Text` / `Icon` | Labels, bio, navigation and card icons |

---

## 📁 Project Structure
```
lib/
├── main.dart               # App entry point, runs the app
├── splash_screen.dart      # Splash screen (StatefulWidget)
└── profile_screen.dart     # Profile screen, FoodCard, ProfileData widgets

assets/
├── ic_launcher.png       # launcher icon and native splash icon
└── food_cards/             # Recipe card images
    ├── party-jollof.webp
    ├── fried-rice.webp
    └── ...
```

**🌐 Network Images**
The application uses network images for:
- Splash screen logo
- Authentication screen logo
- Profile image

For Android devices, internet permission was added:
<uses-permission android:name="android.permission.INTERNET"/>

inside: android/app/src/main/AndroidManifest.xml

---

## 🚀 Getting Started
1. Clone the repository - git clone <repository-url>
2. Install dependencies - `flutter pub get`
3. Run the application - `flutter run`
4. Generate release APK - `flutter build apk --release`  
*APK location*: build/app/outputs/flutter-apk/app-release.apk

---

## 🖼️ Image Sources
Images sourced from:
- [Pexels](https://www.pexels.com)
- [Unsplash](https://unsplash.com/)

---

## 👨‍💻 Flutter Concepts Practiced
- StatefulWidget
- StatelessWidget
- Constructor Data Passing
- Nullable Types
- Form Validation
- TextEditingController
- showDatePicker
- Bottom Navigation
- IndexedStack
- Network Images
- Reusable Widgets
- Onsaved
- Navigation and Routing
- UI Replication
