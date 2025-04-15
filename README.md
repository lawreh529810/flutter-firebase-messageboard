# Message Board App

This is a simple Flutter application that allows users to post messages on a board. It is designed to be a lightweight, easy-to-use app for sharing thoughts and updates.

## Features
- Users can create, edit, and delete messages.
- Real-time updates with Firebase integration.
- Responsive design for mobile and web platforms.

## Getting Started

To get started with the app, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/message_board_app.git
    ```
2. Navigate to the project directory:
    ```bash
    cd message_board_app
    ```
3. Install the dependencies:
    ```bash
    flutter pub get
    ```

4. Run the app:
    ```bash
    flutter run
    ```

## Firebase Setup

To integrate Firebase with the app, make sure you have completed the following:

1. Set up a Firebase project on [Firebase Console](https://console.firebase.google.com/).
2. Follow the instructions in the [FlutterFire documentation](https://firebase.flutter.dev/docs/overview) to configure Firebase for your app.

## Usage

- To add a new message, click the 'Add Message' button.
- To delete a message, swipe left on it and tap 'Delete'.

## Dependencies

- `firebase_core`: To initialize Firebase.
- `cloud_firestore`: To interact with Firestore database.

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit (`git commit -am 'Add new feature'`).
4. Push the changes to your fork (`git push origin feature-branch`).
5. Create a pull request.

## License

This project is licensed under the MIT License.
