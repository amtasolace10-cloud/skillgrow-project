# SkillGrow 

SkillGrow ek Flutter app hai jo students ko apni skills seekhne, progress track karne aur roz seekhne ki aadat banane mein madad karti hai. Is mein XP, badges, streak aur leaderboard jaise gamification elements hain taake seekhna mazedaar rahe.

> **Note:** Ye abhi ek frontend prototype hai. Data mock (static) hai aur asli backend ya login verification nahi hai.

## App ka maqsad

Aksar students seekhna shuru karte hain lekin kuch din baad chhod dete hain. SkillGrow in masalon ka hal deti hai:
- apni skills ek jagah track karna
- roz ke challenges complete karke XP kamana
- lagataar seekhne se streak banana
- badges unlock karna aur dusron se compare karna
- apna digital skill portfolio banana

## Features

- Animated splash, welcome aur 3 onboarding pages
- Sign Up aur Log In (form validation ke saath)
- Interest selection (kam az kam 3) aur daily goal setup
- Home dashboard: Learning Score, weekly chart, active skills
- My Skills (All / Active / Completed filter) aur Skill Details
- Skill Analytics: growth chart aur activity heatmap
- Daily Challenges: tick karne par XP aur progress bar
- Achievements aur badges, Learning Streak tracker
- Smart Recommendations, Leaderboard, Digital Portfolio
- User Profile aur **Dark / Light mode** switch
- Glassmorphism cards, gradients aur animations (Material 3)

## Screens (20)

1. Splash 2. Welcome 3–5. Onboarding (Discover Skills, Track Progress, Achieve Goals)
6. Login 7. Sign Up 8. Interest Selection 9. Goal Setup
10. Home Dashboard 11. My Skills 12. Skill Details 13. Skill Analytics
14. Daily Challenges 15. Achievements 16. Streak Tracker
17. Smart Recommendations 18. Leaderboard 19. Portfolio 20. Profile

## Technology

- Flutter (Dart), Material 3
- Koi external package use nahi hua (sirf Flutter SDK)
- State: `StatefulWidget` + `setState`, aur dark mode ke liye `ValueNotifier`
- Navigation: Named routes

## Folder structure

```
lib/
├── main.dart                 app ki shuruaat
├── core/
│   ├── constants/            colors
│   ├── theme/                light/dark theme
│   ├── routes/               saare route names
│   └── widgets/              GlassCard, GradientButton, ProgressRing,
│                             BarChart, Heatmap, InfoTile, StatCard
├── data/                     models aur mock data
└── features/
    ├── onboarding/           splash, welcome, onboarding
    ├── auth/                 login, sign up
    ├── setup/                interests, goal
    ├── home/                 main shell (bottom nav), home
    ├── skills/               my skills, details, analytics, recommendations
    ├── engagement/           challenges, achievements, streak
    ├── community/            leaderboard
    ├── portfolio/            portfolio
    └── profile/              profile
```

## App kaise chalayein

1. Pehle Flutter SDK aur Android Studio install karein.
2. Project ka folder khol kar terminal mein **us folder mein jayein jahan `pubspec.yaml` hai**.
3. Agar `android/` ya `web/` folder maujood na ho to ye chalayein:
   ```
   flutter create .
   ```
4. Packages lein:
   ```
   flutter pub get
   ```
5. App chalayein:
   ```
   flutter run -d edge
   ```
   (Android emulator ya phone ke liye `flutter run`.)

## App kaise use karein

1. App kholein, splash ke baad Welcome screen aayegi. **Get Started** dabaayein.
2. Onboarding pages swipe karein (ya Skip karein).
3. Sign Up mein naam, email (`@` zaroori) aur password (kam az kam 8 characters) daalein.
4. Kam az kam 3 interests chunein, phir daily goal select karein.
5. Neeche ke 5 tabs istemal karein:
   - **Home:** score, chart aur active skills
   - **Skills:** skills dekhein, tap karke details aur analytics kholein
   - **Tasks:** challenge tick karke XP kamayein
   - **Social:** leaderboard
   - **Me:** achievements, streak, recommendations, portfolio aur Dark Mode switch
6. Logout ke liye Profile screen par **Log Out** dabaayein.

## Maujooda limitations

- Login sirf demo hai, asli authentication nahi hai.
- Data app band hone par save nahi hota.
- Lottie animations ki jagah abhi placeholder hai.

## Aage ke plans

- Firebase Authentication aur Firestore database
- Selected goal aur interests `shared_preferences` se save karna
- Asli Lottie animations
- State management (Provider ya Riverpod)
- Push notifications se daily reminder

## Banane wali

**Amta Hafeez**: Mobile App Development Intern (5th Semester Student)
