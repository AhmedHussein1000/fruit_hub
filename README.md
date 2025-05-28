# Fruit Hub 🍎🍌🍓

Fruit Hub is a feature-rich Flutter e-commerce application for browsing, selecting, and purchasing fresh fruits. The app provides a seamless shopping experience with a beautiful UI, multilingual support, and secure paypal payment processing.

## Key Features

### User Authentication
- Multiple sign-in methods (Email/Password, Google, Facebook)
- Secure account creation and management
- Password reset functionality

### Shopping Experience
- Browse featured and best-selling fruits
- Detailed product information (price, calories, organic status)
- Product search with filters
- Add products to favorites

### Cart & Checkout
- Add products to cart with quantity selection
- Cart management (update/remove items)
- Order summary with total calculation
- Multiple payment methods including PayPal integration
- Shipping address management

### Order Management
- View order history and status
- Track order progress (pending, accepted, delivered, cancelled)
- Order details with product information

### Multilingual Support
- English and Arabic language support
- RTL layout support for Arabic

### Theme Customization
- Light and dark theme support

## Architecture

Fruit Hub follows Clean Architecture principles with a clear separation of concerns:

- **Presentation Layer**: UI components, screens, and (BLoC,Cubit) state management
- **Domain Layer**: Base Repositories, entities, and use cases
- **Data Layer**: Repositories, data sources, and models

The app uses the BLoC pattern for state management, providing a predictable state flow throughout the application.

## Technologies Used

- **Flutter & Dart**: Core framework and language
- **Firebase**: Authentication, Firestore for data storage
- **flutter_bloc**: State management
- **get_it**: Dependency injection
- **hive**: Local storage for cart and favorites
- **flutter_screenutil**: Responsive UI
- **intl**: Internationalization
- **flutter_svg**: SVG rendering
- **cached_network_image**: Efficient image loading and caching
- **flutter_paypal_payment**: Payment processing

## Project Structure

```
├── assets/                  # Images, fonts, and other static assets
├── lib/
│   ├── core/               # Core functionality used across the app
│   │   ├── cubits/         # Global state management
│   │   ├── di/             # Dependency injection
│   │   ├── entities/       # Core business entities
│   │   ├── helpers/        # Helper classes and utilities
│   │   ├── repos/          # Repository interfaces and implementations
│   │   ├── routes/         # App navigation
│   │   ├── services/       # Services (auth, database, etc.)
│   │   ├── themes/         # App themes
│   │   ├── utils/          # Utility functions
│   │   └── widgets/        # Reusable widgets
│   ├── features/           # App features
│   │   ├── best_selling_fruit/
│   │   ├── cart/
│   │   ├── checkout/
│   │   ├── favorites/
│   │   ├── home/
│   │   ├── login/
│   │   ├── onboarding/
│   │   ├── product_details/
│   │   ├── profile/
│   │   ├── search/
│   │   └── signup/
│   ├── generated/          # Generated localization files
│   ├── l10n/               # Localization resources
│   ├── main_development.dart  # Entry point for development
│   └── main_production.dart   # Entry point for production
```

## Localization

The app supports English and Arabic languages. Localization files are located in the `lib/l10n/` directory:

- `intl_en.arb`: English translations
- `intl_ar.arb`: Arabic translations

To add a new language, create a new ARB file following the same pattern.

## Acknowledgements

- [Flutter](https://flutter.dev/)
- [Firebase](https://firebase.google.com/)
- [BLoC Pattern](https://bloclibrary.dev/)
- [PayPal API](https://developer.paypal.com/)
