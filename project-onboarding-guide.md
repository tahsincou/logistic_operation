# Development Setup Guide

Follow these steps after cloning the repository to prepare the Flutter project for development.

---

## 1. Clone Repository

```bash
git clone <repository-url>

cd <project-folder>
```

---

## 2. Install Dependencies

```bash
flutter pub get
```

---

## 3. Configure Project Name

Run the setup script:

```bash
chmod +x scripts/setup_project.sh

./scripts/setup_project.sh
```

Provide:

* Application name
* Bundle ID

Example:

```
App Name: LogiShield

Bundle ID: com.company.logishield
```

The script will update the project identifiers.

---

## 4. Generate Required Files

If localization is enabled:

```bash
flutter gen-l10n
```

---

## 5. Run Application

Check available devices:

```bash
flutter devices
```

Run:

```bash
flutter run
```

---

## Development Commands

Clean build:

```bash
flutter clean
flutter pub get
```

Analyze code:

```bash
flutter analyze
```

Run tests:

```bash
flutter test
```

---

The project is now ready for development!!!
