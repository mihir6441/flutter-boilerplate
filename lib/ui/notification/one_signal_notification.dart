import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';

//import OneSignal
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalExample extends StatefulWidget {
  const OneSignalExample({Key? key}) : super(key: key);

  @override
  _OneSignalExampleState createState() => _OneSignalExampleState();
}

class _OneSignalExampleState extends State<OneSignalExample> {
  String _debugLabelString = "";
  bool _enableConsentButton = false;

  // CHANGE THIS parameter to true if you want to test GDPR privacy consent
  final bool _requireConsent = true;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    if (!mounted) return;

    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print('NOTIFICATION OPENED HANDLER CALLED WITH: ${result}');
      setState(() {
        _debugLabelString =
            "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      print('FOREGROUND HANDLER CALLED WITH: ${event}');

      /// Display Notification, send null to not display
      event.complete(null);

      setState(() {
        _debugLabelString =
            "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal.shared
        .setInAppMessageClickedHandler((OSInAppMessageAction action) {
      setState(() {
        _debugLabelString =
            "In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges changes) {
      print("EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
    });

    OneSignal.shared
        .setSMSSubscriptionObserver((OSSMSSubscriptionStateChanges changes) {
      print("SMS SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
    });

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    await OneSignal.shared.setAppId("5d8726ce-be1a-4ce9-a7d8-24aa12b3101f");

    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();

    setState(() {
      _enableConsentButton = requiresConsent;
    });
    if (Platform.isIOS) {
      _handlePromptForPushPermission();
    }
    _handleConsent();

    OneSignal.shared.disablePush(false);

    bool userProvidedPrivacyConsent =
        await OneSignal.shared.userProvidedPrivacyConsent();
    print("USER PROVIDED PRIVACY CONSENT: $userProvidedPrivacyConsent");
  }

  void _handlePromptForPushPermission() {
    print("Prompting for Permission");
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
  }

  void _handleConsent() {
    print("Setting consent to true");
    OneSignal.shared.consentGranted(true);

    print("Setting state");
    setState(() {
      _enableConsentButton = false;
    });
  }

  void _handleSendNotificationWithImage() async {
    var deviceState = await OneSignal.shared.getDeviceState();

    if (deviceState == null || deviceState.userId == null) return;

    var playerId = deviceState.userId!;

    var imgUrlString =
        "https://cdn.pixabay.com/photo/2018/01/21/01/46/architecture-3095716_960_720.jpg";

    var notification = OSCreateNotification(
        playerIds: [playerId],
        content: "This is a test from OneSignal's Flutter SDK",
        heading: "Test Notification",
        iosAttachments: {"id1": imgUrlString},
        bigPicture: imgUrlString,
        buttons: [
          OSActionButton(text: "See", id: "id1"),
          OSActionButton(text: "Cancel", id: "id2")
        ]);

    var response = await OneSignal.shared.postNotification(notification);

    setState(() {
      _debugLabelString = "Sent notification with response: $response";
    });
  }

  void _handleSendNotificationWithOutImage() async {
    var deviceState = await OneSignal.shared.getDeviceState();

    if (deviceState == null || deviceState.userId == null) return;

    var playerId = deviceState.userId!;

    var notification = OSCreateNotification(
      playerIds: [playerId],
      content: "Hey new user!!, Welcome :)",
      heading: "Welcome!!",
    );

    var response = await OneSignal.shared.postNotification(notification);

    setState(() {
      _debugLabelString = "Sent notification with response: $response";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text(S.of(context).notificationExample),
            backgroundColor: Colors.green[800],
          ),
          body: Container(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Table(
                children: [
                  TableRow(children: [
                    OneSignalButton(
                        title: S.of(context).sendNotificationWithImage,
                        onPressed: _handleSendNotificationWithImage,
                        enabled: !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    OneSignalButton(
                        title: S.of(context).sendNotificationWithoutImage,
                        onPressed: _handleSendNotificationWithOutImage,
                        enabled: !_enableConsentButton)
                  ]),
                ],
              ),
            ),
          )),
    );
  }
}

typedef OnButtonPressed = void Function();

class OneSignalButton extends StatefulWidget {
  final String? title;
  final OnButtonPressed? onPressed;
  final bool? enabled;

  const OneSignalButton({Key? key, this.title, this.onPressed, this.enabled})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => OneSignalButtonState();
}

class OneSignalButtonState extends State<OneSignalButton> {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.green[800],
                primary: Colors.white,
                textStyle: const TextStyle(
                  color: Colors.white,
                )),
            child: Text(widget.title ?? ''),
            onPressed: widget.enabled! ? widget.onPressed : null,
          )
        ]),
        TableRow(children: [
          Container(
            height: 8.0,
          )
        ]),
      ],
    );
  }
}
