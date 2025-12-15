# Contributing to Atlas Dashboard

Thank you for your interest in contributing to Atlas Dashboard! This document provides guidelines and instructions for contributing.

## Code of Conduct

Please be respectful and constructive in all interactions.

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in Issues
2. Create a new issue with:
   - Clear, descriptive title
   - Steps to reproduce
   - Expected behavior
   - Actual behavior
   - Screenshots if applicable
   - Environment details (OS, Flutter version, etc.)

### Suggesting Features

1. Check if the feature has been suggested
2. Create a new issue with:
   - Clear description of the feature
   - Use cases and benefits
   - Possible implementation approach

### Pull Requests

1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Make your changes following the code style guidelines
4. Write or update tests as needed
5. Update documentation as needed
6. Commit with clear, descriptive messages
7. Push to your fork
8. Create a Pull Request with:
   - Description of changes
   - Related issue number
   - Screenshots/videos if UI changes

## Development Setup

1. Install Flutter SDK (>=3.0.0)
2. Clone the repository
3. Run `flutter pub get`
4. Run `flutter test` to ensure tests pass
5. Start developing!

## Code Style Guidelines

### Dart/Flutter
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart)
- Use the project's `analysis_options.yaml`
- Run `flutter analyze` before committing
- Format code with `dart format .`

### Naming Conventions
- **Files**: `snake_case.dart`
- **Classes**: `PascalCase`
- **Variables/Functions**: `camelCase`
- **Constants**: `camelCase` or `SCREAMING_SNAKE_CASE` for compile-time constants

### Code Organization
- Keep files under 300 lines when possible
- One widget per file for complex widgets
- Group related functionality
- Use private members when appropriate

### Comments
- Document public APIs
- Use `///` for documentation comments
- Add inline comments for complex logic
- Keep comments up-to-date

## Testing

- Write tests for new features
- Maintain or improve code coverage
- Run `flutter test` before submitting PR
- Test on multiple platforms if possible

### Test Structure
```dart
void main() {
  group('FeatureName', () {
    test('should do something', () {
      // Arrange
      // Act
      // Assert
    });
  });
}
```

## Commit Messages

Format: `type: brief description`

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

Examples:
- `feat: add pie chart widget`
- `fix: resolve WebSocket connection issue`
- `docs: update README installation steps`

## Project Structure

- `lib/core/`: Core functionality (config, theme, routing)
- `lib/features/`: Feature-specific code
- `lib/shared/`: Shared code (models, widgets, services)
- `test/`: Test files (mirror lib structure)

## Adding New Features

1. Create feature directory in `lib/features/`
2. Add screens in `screens/` subdirectory
3. Add widgets in `widgets/` subdirectory
4. Create providers if needed
5. Update routing
6. Add tests
7. Update documentation

## Questions?

Feel free to:
- Open an issue for questions
- Start a discussion
- Contact maintainers

Thank you for contributing! 🎉
