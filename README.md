# flutter-boilerplate

A Flutter base project structure using [get_it](https://pub.dev/packages/get_it) and [flutter_bloc](https://pub.dev/packages/flutter_bloc) packages.

## Getting Started

## get_it

- Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App.
- Accessing service objects like REST API clients or databases so that they easily can be mocked.
- Accessing View/AppModels/Managers/BLoCs from Flutter Views


## flutter_bloc

- Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern. Built to be used with the bloc state management package.

## Structure steps:

- First create interactive UI for displaying data from API
- Create bloc, event and state for that is our business logic components for API call
- Bloc contains all logic , API call works in bloc file.
- Create repositories for calling API, API call method will be in this file.
- Generate model class for getting response from API , by installing [JSON To Dart Class (JsonToDartClass)](https://plugins.jetbrains.com/plugin/12737-json-to-dart-class-jsontodartclass-) marketplace plugin in android studio.
- Set up API call in UI file and set data from API response.
- ## Most important step do not forget to register your repository instance by `_getIt.registerSingleton<RepositoryName>(RepositoryNameImpl());`
- In main.dart’s main function call the class where we set up dependency for get it , where we register an instance of get it package and register instances of other base classes.
