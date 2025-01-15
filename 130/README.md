---
title: "Developing Fullstack Mobile App"
description: "The other approach is to secure you HTTP with TLS (Transport Layer Security) After you created a signed or self-signed permission and key, configured your local server to use them. Now, you have to expose that port to your"
published: "2024-06-17"
image: "images/image-post-130.png"
draft: false
---

# Developing Fullstack Mobile App

## Some hurdles in development mode

When trying to access local APIs, newer versions of `expo`, `android-studio` emulators etc. won't let you make `http` calls.

You must only do calls to TLS-protected (`https`) services. (Theoretically, you could use `expo-build-properties` plugin to let it use `http` requests)

Adding this configuration to your `app.json`, should allow insecure (not-encrypted) HTTP requests once again.

```
      [
      "expo-build-properties",
        { "android":
          {
            "usesCleartextTraffic": true
          }
        }
      ]
```

The other approach is to secure you HTTP with TLS (Transport Layer Security).

After you created a signed or self-signed permission and key. And, configured your local server to use them. Now, you have to expose that port to your android emulator.

```bash
adb devices 
# Out:
#
# List of devices attached
# emulator-5554   device

adb -s emulator-5554 reverse tcp:8009 tcp:8009
```

Now, you will face another problem:

```quote
Self-signed server certificate
Second, `SSLHandshakeException` might occur because of a self-signed certificate, making the server its own *CA*. This is similar to an unknown certificate authority, so modify your application's Network Security Config to trust your self-signed certificates.
```
- [https://developer.android.com/privacy-and-security/security-ssl](https://developer.android.com/privacy-and-security/security-ssl)
