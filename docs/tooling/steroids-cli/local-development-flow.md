---
layout: docs_tooling
header_title: Local Development Flow
header_sub_title: Learn how the Steroids development flow works when you're working locally
section_id: steroids-cli
---

# Local Development Flow

The Steroids tooling offers a smooth flow for local development, crafted to minimize the time you have to spend waiting for changes to be visible on your devices.

## Starting the Steroids Development Server

The backbone of local development is the Steroids Development Server. It is a web server that performs multiple functions – telling the AppGyver Scanner when to reload the app, serving your app files for local development, triggering the Grunt task to compile your project and more.

To start the Steroids Development Server, run in your Terminal window:

```
steroids connect
```

You'll see the `steroids-make` Grunt task compile your project files (read more in the [Steroids Grunt tasks](/tooling/steroids-cli/grunt-tasks) guide), after which the [Steroids Connect](/tooling/steroids-connect/) screen is opened in your Web Browser and the Development Server is ready to accept incoming connections.

## Connecting with the AppGyver Scanner App

Ensure that your mobile device and your computer are in the same Wi-Fi network (the phone's own Wi-Fi hotspot won't function). Then, scan the QR code shown in the Steroids Connect screen with the AppGyver Scanner app. Your mobile device will connect with the Development Server and load your app

## Auto-Detecting File Changes

The Steroids Development Server runs a file watcher by default. If you modify a file in your project, the Steroids Development Server will detect the change and reload your app to show the changes.

To disable the file watcher, run your app with the `--watch=false` flag:

```bash
steroids connect --watch=false
```

You can also exclude specific files by providing a list of comma-separated paths for the `--watchExclude` flag.

```bash
steroids connect --watchExclude=data/changesOften.json,data/alsoChangesOften.json
```
## How Your App Files Are Served

Before we dive into how your app reloads itself to show changes, it's important to understand how your app files are served. In [stand-alone builds](/tooling/build-service/) of your app, all HTML, JS, CSS and other assets are included in the physical app bundle. The internal localhost web server running in the AppGyver Wrapper servers them from the device's hard drive.

When you are developing your app with AppGyver Scanner and the Steroids Development Server,  the app files are not transferred to the device's hard drive.

Instead, the Steroids Development Server serves your app's files via a local web server. In your app, requests to `localhost` are forwarded to the Development Server (instead of the app trying to fetch them from the device's hard drive).

Thus, each WebView fetches the HTML page (and all other assets) from the Development  Server before displaying it. This enables lightning-fast updates by allowing us to use LiveReload.

## Reloading your App with LiveReload

When you change regular project HTML, CSS and JS files, your app updates instantly without any loading screens. This is caused by a special [LiveReload](http://livereload.com/) implementation in the AppGyver Scanner. In short, when a reload is requested, the Steroids Development Server sends a message to the Scanner app, which then instructs each WebView to reload itself.

Since the local web server on your computer is always serving the latest version of your app (the contents of the `dist/` folder, to be exact), the refreshed page will show your changes.

You can also initiate a LiveReload by pressing enter in the Steroids Development Server console.

## Full Reload

The exception is when you make changes to your project's config files (`config/app.coffee` and `config/structure.coffee`). Since they are processed at app load, the whole app needs to be restarted after the changes. (Note that this doesn't mean you have to shut down the actual AppGyver Scanner app – we handle the restart process internally.)

When you change the files in the `config/` folder, a full reload is triggered. The current app state is discarded and a loading screen is shown. After a moment, the app starts with the modified configs.

You can initiate a full reload manually by typing `r` or `reload` in the Steroids Development Console and pressing enter.