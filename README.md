# iOS Architecture Demo: MVC vs MVP

This project demonstrates how to build a simple iOS form using two popular software architecture patterns: **MVC** and **MVP**. The app allows a user to enter their name and email, and displays the entered information or a validation error.

---

## 🔧 Requirements

- iOS 13.0+
- Xcode 14 or later
- Swift 5+

---

## 📐 Architecture Overview

### 1. MVC (Model–View–Controller)

- **Model**: Holds user data (name, email).
- **View**: Storyboard UI elements connected to the ViewController.
- **Controller**: `MyViewController.swift` handles business logic and UI update.

📁 Files:
- `Person.swift`
- `MyViewController.swift` (acts as both View and Controller)

---

### 2. MVP (Model–View–Presenter)

- **Model**: Same as MVC.
- **View**: `ViewController.swift` conforms to a protocol `PersonView` and only updates UI.
- **Presenter**: Handles business logic and updates the View via the protocol.

📁 Files:
- `Person.swift`
- `PersonPresenter.swift`
- `ViewController.swift`

---
📌 Key Learnings

Understand the flow of responsibilities in both MVC and MVP architecture.
Learn how to separate concerns properly.

🤝 Contribution

Feel free to fork and build on this structure for more complex features like:

Networking
Database integration
Routing between modules


---

Let me know if you want a GitHub repository structure, sample project upload help, or a `LICENSE` file too!
