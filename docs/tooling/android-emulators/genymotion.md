---
layout: docs_tooling
header_title: Genymotion emulator
header_sub_title: Learn how to setup Genymotion emulator.
section_id: android-emulators
subsection_id: genymotion
---

# Genymotion

AppGyver recommends Genymotion. TODO: Insert why

## Install

Genymotion runs the emulators in Oracle VirtualBox, so first you need to have that installed.
On [Oracle VirtualBox](https://www.virtualbox.org/) you will find instructions and download links.

After VirtuaBox is installed, head over to [Genymotion](http://www.genymotion.com/).
Genymotion is free to for non-commerical use but requires you to have an account. So sign up and download the latest version for your platform.

Install Genymotion and make sure to install the **Genymotion Shell** (when prompted about it) too. Without the Shell installed, Steroids CLI won't be able to launch the emulator.

## Configure

For Steroids CLI to launch the emulator, we first have to create a new virutal device with the name `steroids` in Genymotion.

Launch Genymotion and add a new virtual device. Select `Custom Phone 4.X.X`

<img src="http://placehold.it/600x300">
<img src="http://placehold.it/600x300">

Hit save and now we're good to go!

## Running

You can only run the emulator when `steroids connect` is running. To launch it, type `gen` in the connect prompt or `steroids gen` in another Terminal window. The emulator should now be booting up if everything went as expected.

## Troubleshooting

### When I start a virtual device, why does the window remain black?

You are probably in either of the following situations:

- Your network adapter may be misconfigured. In this case:
  - Run VirtualBox.
  - Open File > Preferences > Network (or VirtualBox > Preferences for Mac OS X).
  - Edit the Host-only Network by clicking .
  - Check that the adapter IPv4 address is in the same network (192.168.56.0/24 by default) as the DHCP server address, lower address bound and upper address bound. If not, your virtual device cannot start.
  - You can also remove the Host-only Network by clicking . Genymotion will automatically recreate it at the next virtual device start.
- Your firewall may block the application. The Genymotion application must connect to the virtual device via the local network. If you have a firewall, make sure that you allowed connections to the Genymotion network, set to 192.168.56.0/24 by default.

From [Genymotion Pages](https://cloud.genymotion.com/page/faq/#collapse-nostart)
