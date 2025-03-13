# Diamond Filter and Cart Management App

This Flutter app allows users to filter diamonds based on various criteria (e.g., carat, lab, shape, color, clarity) and manage a shopping cart. The app uses Hive for persistent storage and Cubit for state management.

## Features

### Diamond Filtering:
Users can filter diamonds based on:
- Carat (From & To)
- Lab
- Shape
- Color
- Clarity

### Cart Management:
- Add diamonds to the cart.
- Remove diamonds from the cart.
- View all diamonds in the cart.
- Persistent cart storage (data persists even after app restart).

### Cart Summary:
Displays:
- Total Carat
- Total Price
- Average Price
- Average Discount

## Project Structure

```
lib/
├── main.dart                # Entry point of the app
├── injector.dart            # Dependency injection setup
├── mock_data.dart           # Mock data for testing
├── blocs/                   # State management using Bloc
│   ├── filter/              # Filter feature Bloc
│   │   ├── filter_bloc.dart # Bloc for filtering logic
│   │   ├── filter_state.dart # State for filtering
│   ├── cart/                # Cart feature Bloc
│   │   ├── cart_bloc.dart   # Bloc for cart logic
│   │   ├── cart_state.dart  # State for cart
├── core/                    # Core utilities and configurations
│   ├── constants/              # App constants
│   │   ├── app_colors.dart  # Defined app colors
│   │   ├── app_sizes.dart   # Predefined app sizes
│   │   ├── constants.dart   # defined app name, navigator keys and common strings
│   ├── routes/                # Defined and generated app routes
│   │   ├── app_routes.dart   # Created app routes
│   ├── utils/                # Utility functions
│   │   ├── screen_util.dart   # Utility functions for responsive design
│   │   ├── snack_utils.dart   # Utility functions for snackbars
│   │   ├── theme_utils.dart   # Utility functions for App theme
│   │   ├── utils.dart   # Exported utility functions
├── model/                      # Data models for the app
│   ├── cart.dart              # Cart model
│   ├── cart.g.dart            # Hive adapter for Cart model
│   ├── diamond.dart              # Diamond model
│   ├── diamond.g.dart            # Hive adapter for Diamond model
├── views/                   # UI views and widgets
│   ├── wodgets/              # DiamondCard Widget
│   │   ├── diamond_card.dart  # DiamondCard Widget
│   ├── cart_page.dart              # Cart item and summary page
│   ├── dashboard.dart              #  Welcome page with filter and cart button
│   ├── filter_page.dart              #  Selecting filter options
│   ├── result_page.dart              #  all filtered diamonds
```


## State Management Logic

The app uses Cubit (from the flutter\_bloc package) for state management. Here's how it works:

### 1. CartCubit

Manages the state of the cart.

Provides methods to:

- Add diamonds to the cart.
- Remove diamonds from the cart.
- Calculate cart summary (total carat, total price, average price, average discount).

### 2. CartState

Represents the state of the cart.

- Contains a list of diamonds in the cart.
- Includes methods to calculate the cart summary.

### 3. BlocBuilder

Used in the UI to reactively update the cart page and diamond cards based on the cart state.

## Persistent Storage Usage

The app uses Hive (a lightweight NoSQL database) for persistent storage. Here's how it works:

### 1. Hive Initialization

Hive is initialized in `main.dart`:

```dart
await Hive.initFlutter();
Hive.registerAdapter(DiamondAdapter());
Hive.registerAdapter(CartAdapter());
await Hive.openBox<Diamond>('diamonds');
await Hive.openBox<Cart>('cart');
```

### 2. Saving Cart Data

Whenever a diamond is added or removed from the cart, the updated cart is saved to Hive:

```dart
await cartBox.put('cart', cart!);
```

### 3. Loading Cart Data

When the app starts, the cart data is loaded from Hive:

```dart
final cart = cartBox.get('cart', defaultValue: Cart(items: []));
```

### 4. Persistence

Cart data is stored in a Hive box (`cart`) and persists even after the app is restarted.
