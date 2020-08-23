
# I Hate the CapsLock Key

### **NOTE**:  CapsLockKeyBeGone.exe must be run as administrator for it to work

If you hate the CapsLock key like I do, you have come to the right place. This site is the home to CapsLockBeGone, the blessed little utility that will rid you of your CapsLock key forever.

I hate the CapsLock key. I really hate it. I mean I _really_ hate it. A lot. I hate it with a passion that burns like the heat of a thousand suns. What in the name of Elvis were people thinking when they put that stinking key on a computer keyboard? Sure, it was there in the type writer where it was actually useful. On a typewriter you can't ACCIDEntly hit it and have your typing go crazy. I remember it being "heavy" to push on a real typewriter.  Took a little heft. But on a computer keyboard? It's light as a feather -- as eay to press as any other key. And there in lies its evil nature on display for some unsuspecting soul to press in error. An evil nature that needs to be dealt with.

## Enough Was Enough

For too long was I tormented by the terrors of the CapsLock key. Something had to be done. Too many people were suffering. Too many were in anguish. Finally, I had enough and decided to take matters into my own hands. And thus, CapsLockBeGone was born.

## CapsLockBeGone to the Rescue!

Google was my friend. I discovered that I am not alone -- that there are other tormented souls like me out there, and they had found a solution. But the solutions involved mucking with the dreaded Windows Registry, and I realized that this would be a barrier to many a CapsLock Key hater, and so I decided to go on a quest -- a quest for a simple, easy solution. I soon broke out my faithful copy of Delplhi and started coding.

## Freedom at Last!

Now, with the simple press of a button, your CapsLock key can be rendered useless and inoperative, instead of the Spawn of Satan that it is by default. You can render that horrible key useless. You can turn it into a regular old Shift key if you want. And yes, regrettably, the thing will even set everything back to where it was if you feel some compelling need to torture yourself.

## How It Works

How it works is actually pretty simple.  CapsLockBeGone makes an entry in your registry that remaps your keys and tells Windows to ignore your CapsLockKey.  The key in question is:

```plaintext
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout\
```

From there, the entry is "Scancode Map", and the value is a bunch of binary values that map to key values. 

If you are really curious, the values for the entry are:

```plaintext
0,0,0,0,0,0,0,0,2,0,0,0,0,0,$3A,0,0,0,0,0
```

The '$' in front of the number there indicates that the value is hexadecimal value. The application basically writes those values into a binary value inside the key above. Once Windows sees that (you have to reboot, as the application will tell you and help you with), then you'll get no CapsLock key.  Yay!

Strictly speaking, you don't need CapsLockBeGone -- you can enter the values yourself, and there are plenty of *.reg files out there (Google for the "remove CapsLock key" and you should find them), but this application does it pretty painlessly and without worrying about mucking around in REGEDIT.EXE or with *.reg files. And of course, it does -- reluctantly -- allow you to set things all back to normal.

## What It's Written In

CapsLockBeGone is written in Delphi. Delphi is the perfect tool for this sort of thing. It creates fast, native EXE files. It uses component-based RAD development to build applications, so putting this together was relatively fast. CapsLockBeGone doesn't require any additional runtime libraries other than what comes with Windows, so the distribution for it is nice and small and the EXE should run on almost any version of Windows.