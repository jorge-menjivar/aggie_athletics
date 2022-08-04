# Running Instructions

1. Fork the project.

2. Clone project to your preferred location.

3. Once in your project's root directory, download all packages needed for the app with
    ```zsh
    flutter pub get
    ```

4. Install the Firebase CLI from
    [https://firebase.google.com/docs/cli#install_the_firebase_cli](https://firebase.google.com/docs/cli#install_the_firebase_cli).

5. Login to Firebase from the CLI with the email connected to the Google Cloud project. (Contact [jorge-menjivar](https://github.com/jorge-menjivar) for access)
    ```zsh
    firebase login
    ```

6. Install the FlutterFire CLI
    ```zsh
    dart pub global activate flutterfire_cli
    ```

7. Let the FlutterFire CLI automatically add all the API Keys to the project.
    ```zsh
    flutterfire configure
    ```
    Follow the FlutterFire CLI instructions.


8. Make sure you have the Flutter plugin installed in your IDE and open `lib/main.dart` 

    If using VS Code, press `F5` to run the app on a device
