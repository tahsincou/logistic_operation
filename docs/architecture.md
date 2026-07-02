# Logistic Operation

## Architecture

The project follows Feature First + Clean Architecture.

```
Presentation
      │
      ▼
Use Case
      │
      ▼
Repository (Domain)
      │
      ▼
Repository Implementation (Data)
      │
      ▼
Datasource
      │
      ▼
REST API / Local Database
```

---

## Layers

### Presentation

Responsibilities

- UI
- Navigation
- State Management
- User Interaction

Contains

- Pages
- Widgets
- Providers
- State
- Notifiers

---

### Domain

Responsibilities

- Business Logic
- Entities
- Repository Contracts
- Use Cases

Contains

- Entities
- Params
- Repository
- Use Cases

This layer never depends on Data or Flutter.

---

### Data

Responsibilities

- API Calls
- Local Database
- DTOs
- Repository Implementation

Contains

- Datasources
- Models
- RepositoryImpl

---

### Core

Reusable application services.

Contains

- Dio
- Secure Storage
- Logger
- Constants
- Utilities
- Extensions

---

### Shared

Reusable UI.

Contains

- Buttons
- TextFields
- Cards
- Dialogs

Login Button
      │
      ▼
LoginPage
      │
      ▼
AuthNotifier
      │
      ▼
LoginUseCase
      │
      ▼
AuthRepository
      │
      ▼
AuthRepositoryImpl
      │
      ▼
AuthRemoteDatasource
      │
      ▼
Dio
      │
      ▼
REST API



Presentation
      ↓
Domain
      ↓
Data

Never reverse.

❌ Data cannot import Presentation

❌ Domain cannot import Data

✔ Presentation imports Domain

✔ Data implements Domain


UI should never know where data comes from.

UI

↓

UseCase

↓

Repository

↓

API

03 July, 2026:
LoginUseCase

Future:
RegisterUseCase
LogoutUseCase
RefreshTokenUseCase
ForgotPasswordUseCase


- Feature First
- SOLID
- Clean Architecture
- Repository Pattern
- Dependency Injection (Riverpod)
- Single Responsibility
- Immutable State
- Reusable Widgets