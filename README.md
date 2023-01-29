<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Flutter Hot Toast

A very cool and simple flutter toast that is highly inspired by React Hot Toast

## Features

![Video preview](https://user-images.githubusercontent.com/79772304/215337480-c5d7fdb1-2962-46f9-acbe-6201d674b10d.gif)

## Getting started

First wrap your Material App with `GlobalLoaderOverlay`

```
Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
```

---

Now you can call the toast to show in any part of your widget that is being encapsulated in the MaterialApp widget by:

```
context.loaderOverlay.show(
            widget: FlutterHotToast.loading(
              height: 70,
              width: 280,
              label: const Text(
                'loading...😬',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          );
```

## Usage

```
FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.loaderOverlay.show(
            widget: FlutterHotToast.loading(
              height: 70,
              width: 280,
              label: const Text(
                'loading...😬',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          );
          Future.delayed(const Duration(seconds: 2), () {
            context.loaderOverlay.show(
              widget: FlutterHotToast.success(
                context,
                height: 70,
                width: 280,
                label: const Text(
                  'success ✅',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            );
          });
        },
      ),
```

## Additional information

This package uses [lottie](https://pub.dev/packages/lottie), [loader_overlay](https://pub.dev/packages/loader_overlay) and [flutter_animate](https://pub.dev/packages/flutter_animate) under the hood.

You can find the repository link at [github](https://github.com/samtuga1/flutter_hot_toast) to contribute to this project.

---

If you like this project, please follow me on [github](https://github.com/samtuga1)
