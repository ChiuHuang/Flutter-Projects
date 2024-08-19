# My Projects

**My Projects** is a Flutter app that fetches and displays a list of projects from a JSON API. This app showcases project details including the language used, Git repository links, and project completion status.

## Features

- Fetches project data from a remote JSON API.
- Displays project information in a responsive and user-friendly interface.
- Each project card includes the project's name, language, Git address, and completion status.

## Installation

To run the Projects Loader app locally, follow these steps:

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine.
- [Dart](https://dart.dev/get-dart) (comes with Flutter SDK).

### Setup

1. **Clone the repository:**

   ```sh
   git clone https://github.com/yourusername/projects_loader.git
   cd projects_loader
   ```

2. **Install dependencies:**

   ```sh
   flutter pub get
   ```

3. **Run the app:**

   ```sh
   flutter run
   ```

## Configuration

The app fetches project data from the following URL:

```plaintext
https://getpantry.cloud/apiv1/pantry/d13d90f6-9c51-487c-9ebb-8b788917748d/basket/Projects
```

You can modify the URL in the `lib/main.dart` file if you want to use a different API endpoint.

## Contributing

Contributions are welcome! If you find any issues or have suggestions, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Flutter](https://flutter.dev) for building the cross-platform app.
