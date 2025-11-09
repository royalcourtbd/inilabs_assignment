# INILabs Assignment - GitHub Repository Explorer

A modern Flutter application that allows users to search for GitHub users and explore their repositories with advanced filtering and sorting capabilities.

## 📱 Overview

This application demonstrates a clean architecture approach to building a Flutter app that interacts with the GitHub API. Users can search for any GitHub user, view their profile information, and browse through their repositories with various filtering and sorting options.

## ✨ Features

### Core Features

- **User Search**: Search for any GitHub user by username
- **Repository Listing**: View all public repositories of a searched user
- **Repository Details**: Comprehensive details page showing:
  - Repository statistics (stars, forks, watchers, issues)
  - Primary programming language with color coding
  - Topics/tags
  - Timeline (created, updated, pushed dates)
  - Additional metadata (size, license, visibility, etc.)
  - Status badges (fork, archived, template, etc.)

### UI/UX Features

- **Dual View Modes**: Switch between List and Grid view for repositories
- **Advanced Filtering**: Filter repositories by:
  - Name (alphabetical)
  - Date (creation date)
  - Stars count
  - Forks count
- **Sort Order**: Toggle between ascending and descending order
- **Dark/Light Theme**: Built-in theme switching capability
- **Responsive Design**: Adapts to different screen sizes using ResponsiveSizer
- **Loading States**: Smooth loading indicators for async operations
- **Error Handling**: Comprehensive error handling with user-friendly messages

## 🏗️ Architecture

This project follows **Clean Architecture** principles with a clear separation of concerns:

```
lib/
├── core/                           # Core functionality and shared utilities
│   ├── base/                       # Base classes for architecture
│   │   ├── base_presenter.dart     # Base presenter with common functionality
│   │   ├── base_ui_state.dart      # Base UI state
│   │   ├── base_use_case.dart      # Base use case
│   │   ├── base_entity.dart        # Base entity with Equatable
│   │   └── result.dart             # Result type (Either<Error, Success>)
│   ├── config/                     # App configuration
│   │   ├── app_theme.dart          # Light/Dark theme configuration
│   │   └── app_screen.dart         # Screen setup utilities
│   ├── di/                         # Dependency Injection
│   │   ├── service_locator.dart    # Service locator pattern implementation
│   │   └── setup/                  # DI setup modules
│   ├── network/                    # Network layer
│   │   ├── api_client.dart         # Dio-based API client
│   │   ├── api_endpoints.dart      # API endpoint definitions
│   │   └── api_constants.dart      # API constants
│   ├── services/                   # Core services
│   │   ├── theme_service.dart      # Theme management
│   │   ├── error_message_handler.dart
│   │   ├── launcher_service.dart   # URL launcher
│   │   └── connectivity_service.dart
│   ├── utility/                    # Utility functions
│   │   ├── logger_utility.dart     # Logging with Talker
│   │   ├── navigation_helpers.dart
│   │   ├── validators.dart
│   │   ├── extensions.dart
│   │   └── color_utility.dart      # Language color mapping
│   ├── widgets/                    # Reusable core widgets
│   └── external_libs/              # Custom external libraries
├── features/                       # Feature modules
│   ├── initial/                    # User search feature
│   │   ├── data/
│   │   │   ├── datasource/         # Remote data source
│   │   │   ├── models/             # Data models
│   │   │   └── repositories/       # Repository implementation
│   │   ├── domain/
│   │   │   ├── entities/           # Domain entities
│   │   │   ├── repositories/       # Repository interfaces
│   │   │   └── usecase/            # Business logic
│   │   ├── presentation/
│   │   │   ├── presenter/          # State management
│   │   │   ├── ui/                 # UI pages
│   │   │   └── widgets/            # Feature widgets
│   │   └── di/                     # Feature DI setup
│   ├── home/                       # Repository listing feature
│   │   └── [Same structure as initial]
│   └── repository_details/         # Repository details feature
│       └── [Same structure as initial]
└── shared/                         # Shared components
    ├── components/                 # Reusable UI components
    │   ├── user_input_field/
    │   ├── app_switch/
    │   ├── loading_indicator.dart
    │   └── submit_button.dart
    └── services/                   # Shared services
```

### Architectural Layers

#### 1. **Presentation Layer**

- **Presenters**: Manage UI state and business logic coordination
- **UI**: Flutter widgets for rendering
- **UI State**: Immutable state classes
- Uses GetX for state management and navigation

#### 2. **Domain Layer**

- **Entities**: Pure Dart business objects
- **Use Cases**: Single-responsibility business logic units
- **Repository Interfaces**: Contracts for data operations
- Independent of frameworks and external dependencies

#### 3. **Data Layer**

- **Models**: JSON serializable data models
- **Data Sources**: Remote API communication
- **Repository Implementations**: Concrete implementations of domain contracts
- Error handling and data transformation

## 🛠️ Technologies & Packages

### Core Dependencies

- **flutter**: ^3.9.2 (SDK)
- **get**: ^4.7.2 - State management and navigation
- **get_it**: ^9.0.5 - Service locator for dependency injection
- **dio**: ^5.9.0 - HTTP client for API calls
- **fpdart**: ^1.2.0 - Functional programming (Either type)
- **equatable**: ^2.0.7 - Value equality for entities

### UI & UX

- **responsive_sizer**: ^3.3.1 - Responsive design
- **flutter_svg**: ^2.2.2 - SVG rendering
- **intl**: ^0.20.2 - Date formatting

### Utilities

- **url_launcher**: ^6.3.2 - Open external URLs
- **talker_logger**: ^5.0.2 - Advanced logging

### Dev Dependencies

- **flutter_lints**: ^5.0.0 - Linting rules
- **change_app_package_name**: ^1.5.0 - Package name management

## 🎨 Design Patterns

### 1. **Service Locator Pattern**

- Centralized dependency management using GetIt
- Lazy and singleton registrations
- Easy to mock for testing

### 2. **Repository Pattern**

- Abstraction between data sources and business logic
- Clean separation of concerns
- Easy to swap implementations

### 3. **Use Case Pattern**

- Single Responsibility Principle
- Encapsulated business logic
- Reusable and testable

### 4. **Presenter Pattern (MVP-like)**

- Separates UI logic from presentation logic
- Testable presentation layer
- Reactive state updates with Rx

### 5. **Result/Either Pattern**

- Type-safe error handling
- No exceptions for flow control
- Explicit success/failure handling

## 🚀 Getting Started

### Prerequisites

- Flutter SDK: ^3.9.2
- Dart SDK: ^3.9.2
- iOS/Android/Web/Desktop development setup

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/royalcourtbd/inilabs_assignment.git
   cd inilabs_assignment
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Platform-Specific Setup

#### Android

- Minimum SDK: 21
- Target SDK: Latest
- Kotlin version: 1.9.0

#### iOS

- Minimum iOS version: 12.0
- Swift 5.0+

#### Web

- Runs on all modern browsers
- No additional setup required

## 📖 How to Use

1. **Launch the app**: The initial screen shows a search input field
2. **Enter GitHub username**: Type any valid GitHub username (e.g., "royalcourtbd")
3. **Search**: Click the "Search User" button
4. **View repositories**: Browse through the user's repositories
5. **Filter & Sort**: Use the filter chips to organize repositories
6. **Toggle view**: Switch between list and grid view using the top-right icon
7. **View details**: Tap any repository to see comprehensive details
8. **Theme toggle**: Use the switch in the app bar to change themes

## 🔧 Configuration

### API Configuration

The app uses GitHub's public API (no authentication required for basic operations):

- Base URL: `https://api.github.com`
- Endpoints:
  - User profile: `/users/{username}`
  - User repositories: `/users/{username}/repos`

### Theme Configuration

Modify themes in `lib/core/config/app_theme.dart`:

- Light theme customization
- Dark theme customization
- Material 3 design system

## 📊 Key Features Implementation

### Error Handling

- Centralized error message handler
- User-friendly error messages
- Network error detection
- Null safety throughout

### State Management

- Reactive state updates with GetX
- Immutable state classes
- Clean state transitions
- Loading states management

### Network Layer

- Dio interceptors for logging
- Request/Response interceptors
- Error handling middleware
- Timeout configuration (30s)

### Dependency Injection

- Service locator pattern
- Lazy initialization
- Singleton services
- Feature-based DI modules

## 🧪 Testing

The project structure supports easy testing:

- **Unit Tests**: Test use cases and business logic
- **Widget Tests**: Test UI components
- **Integration Tests**: Test complete user flows

Run tests:

```bash
flutter test
```

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ macOS
- ✅ Linux
- ✅ Windows

## 🎯 Code Quality

### Best Practices

- Clean Architecture principles
- SOLID principles
- DRY (Don't Repeat Yourself)
- Separation of concerns
- Immutable state
- Type safety with null safety

### Code Style

- Flutter lints enabled
- Consistent naming conventions
- Comprehensive comments
- Documentation for complex logic

## 🔐 Security

- No API keys stored in code
- No sensitive data persistence
- Safe URL handling
- Input validation

## 📈 Performance Optimizations

- Lazy loading of dependencies
- Efficient state management
- Optimized network calls
- Image caching (for SVGs)
- Minimal rebuilds with GetX

## 🤝 Contributing

This is an assignment project, but suggestions are welcome:

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📄 License

This project is created as an assignment for INILabs.

## 👨‍💻 Developer

**Sayed**

- GitHub: [@royalcourtbd](https://github.com/royalcourtbd)

## 🙏 Acknowledgments

- GitHub API for providing public API access
- Flutter team for the amazing framework
- All open-source package maintainers

## 📞 Contact

For any queries regarding this assignment:

- Repository: [inilabs_assignment](https://github.com/royalcourtbd/inilabs_assignment)

---

**Built with ❤️ using Flutter**
