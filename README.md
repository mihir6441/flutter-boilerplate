# flutter-boilerplate

A Flutter base project structure using [get_it](https://pub.dev/packages/get_it) and [flutter_bloc](https://pub.dev/packages/flutter_bloc) packages.

## Getting Started

## get_it

- Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App.
- Accessing service objects like REST API clients or databases so that they easily can be mocked.
- Accessing View/AppModels/Managers/BLoCs from Flutter Views


## flutter_bloc

- Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern. Built to be used with the bloc state management package.

## Structure steps:(#structure-steps)

- First create interactive UI for displaying data from API
- Create bloc, event and state for that is our business logic components for API call
- Bloc contains all logic , API call works in bloc file.
- Create repositories for calling API, API call method will be in this file.
- Generate model class for getting response from API , by installing [JSON To Dart Class (JsonToDartClass)](https://plugins.jetbrains.com/plugin/12737-json-to-dart-class-jsontodartclass-) marketplace plugin in android studio.
- Set up API call in UI file and set data from API response.
- **Most important step do not forget to register your repository instance by** `_getIt.registerSingleton<RepositoryName>(RepositoryNameImpl());`
- In main.dart’s main function call the class where we set up dependency for get it , where we register an instance of get it package and register instances of other base classes.


**For auto generating json serializable file run following command**
`flutter pub run build_runner build --delete-conflicting-outputs`

---

## Table of contents
1. [Dio Client](#dio-client)
2. [Http Client](#http-client)
3. [GraphQL](#graphql)
4. [One Signal](#one-signa)
5. [Notes](#notes)

---

## Dio Client

For API calls the we used flutter dio package [dio](https://pub.dev/packages/dio)
In-app added one example for getting list of news with free news API.
-For API call followed same structure mentioned above in [Structure steps](#structure-steps).

---

## Http Client

API call using http package [http](https://pub.dev/packages/http)
In app added one example for getting list of post with free post API.
-You can see under post folder in UI, also we added load more functionality into this API request, For that we created one common widget called pagination wrapper.
-As per API requirement we can modify the parameters for loading more data.

---

## GraphQL

API call using graphQl package [graphQl](https://pub.dev/packages/graphql_flutter)
In app added one example for getting list of clips from our baba play project open API.

---

## One Signal

For integrating push notification we used [One Signal](https://pub.dev/packages/onesignal_flutter) plugin
-See setup guide for integration [here](https://documentation.onesignal.com/docs/flutter-sdk-setup)
-Also we required to add our app in firebase console for setup find [here](https://firebase.google.com/docs/flutter/setup?platform=android)


---

## Notes

-After cloning project when we want to use particular one structure for API call, for that keep only those folders which required.
For example if we want to use http method just keep `http_client.dart` file likewise for any other client.




