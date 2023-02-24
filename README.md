# sd-cam

Polaroid Camera Script for Ox-Inventory/QB-Core

The base for a Polaroid Camera script im working on for SundownRP, Applies a filter effect upon camera pull out and saves it to the photo which you get as a physical item in your pockets.

Dependancies are ps-ui for the image showing currently. This will be negated and be part of the script soon.

Minimal support will be provided this script comes as is. Its currently very basic and should be easy to figure out. 

This is currently using a forked version of Screenshot-Basic with Imgur support due to discord removing image access from FiveM.

That can be found here.
https://github.com/ogidevs/screenshot-basic

Instructions on the imgur API are not included in the readme so i will include them here.

1. Create an imgur account, go to https://api.imgur.com/oauth2/addclient, create an application (for callback URL use: https://www.getpostman.com/oauth2/callback) and get the Client-ID.
2. Put the Client ID in screenshot-basic\ui\src\ui\src\main.ts - line 204. - Do not remove Client-ID part, only change YOURCLIENTID with your Client-ID
https://imgur.com/a/9fh89ib
NOTE: Changes to screenshot-basic need to be done before first building (running) it or delete dist and node_modules folders.

If you want to change the webhook that can be done on Client.lua Line 31 for primary image data.

There is also a commented out section lines 39-42 that will also report back to a discord webhook for logging. 
To enable this insert your webhook where specified on Client.lua Line 39 and uncomment the section.

Insert items into Ox_Inventory>data>items.lua

	['poloroidcamera'] = {
		label = 'Poloroid Camera',
		weight = 5000,
		stack = false,
		close = true,
		allowArmed = false,
	},

	['poloroid'] = {
		label = 'Poloroid Picture',
		weight = 100,
		stack = false,
		close = true,
		allowArmed = false,
		description = "A Picture from a fond memory"
	},

	['poloroidblank'] = {
		label = 'Poloroid Blank',
		weight = 100,
		stack = false,
		close = true,
		allowArmed = false,
		description = "A Picture waiting to happen!"
	},

