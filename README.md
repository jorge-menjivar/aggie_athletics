# Running Instructions

1. Clone project to your preferred location
    ```zsh
    git clone git@github.com:jorge-menjivar/aggie_athletics.git
    cd aggie_athletics
    ```

2. Download all packages needed for the app with
    ```zsh
    flutter pub get
    ```

3. Install the Firebase CLI from
    [https://firebase.google.com/docs/cli#install_the_firebase_cli](https://firebase.google.com/docs/cli#install_the_firebase_cli)

4. Login to Firebase from the CLI with the email connected to the Google Cloud project. (Contact [jorge-menjivar](https://github.com/jorge-menjivar) for access)
    ```zsh
    firebase login
    ```

5. Install the FlutterFire CLI
    ```zsh
    dart pub global activate flutterfire_cli
    ```

6. Let the FlutterFire CLI automatically add all the API Keys to the project.
    ```zsh
    flutterfire configure
    ```
    Follow the FlutterFire CLI instructions.


7. Make sure you have the Flutter plugin installed in your IDE and open `lib/main.dart` 

    If using VS Code, press `F5` to run the app on a device
