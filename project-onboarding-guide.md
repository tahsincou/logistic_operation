# Development Setup Guide

Follow these steps after cloning the repository to prepare the Flutter project for development.

---

## 1. Clone Repository

```bash
git clone <repository-url>

cd <project-folder>
```

---

## 2. Setup Project

Run the setup command:

```bash
make setup
```

This will:

* Configure the application name
* Update bundle ID
* Install required dependencies
* Prepare the project for development

---

## 3. Run Application

Start the application:

```bash
make run
```

---

## Development Commands

Get dependencies:

```bash
make get
```

Clean project:

```bash
make clean
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

The project is now ready for development.
