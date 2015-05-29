## GPUpdateNotify

This is a small app to notify users when they need to restart their computer for [Group Policy](https://technet.microsoft.com/en-us/windowsserver/bb310732.aspx) updates. My use case is [MSI deployments](https://technet.microsoft.com/en-us/library/cc738858(v=ws.10).aspx).

I have it set up as a scheduled task running 30 minutes before users finish for the day. If updates are pending, a balloon notification appears by the system tray asking them to restart and an icon remains there until the computer is restarted. The balloon message should pop up every ten minutes too.

![screenshot](https://github.com/BrianHenryIE/GPUpdateNotify/blob/master/GPUpdateNotify%20Screenshot.png)

It works by running [gpupdate /force](https://support.microsoft.com/en-us/kb/298444) with the output being written to a text file whose contents is searched for the word "restart". It written using [AutoIt script](https://www.autoitscript.com/).

### Download binary: [gpupdatenotify.exe](http://brianhenryie.s3.amazonaws.com/gpupdatenotify.exe)

To do:

* Check if the user has permission to reboot (e.g. terminal server case).
* Add a GUI so they can restart by clicking the icon.

