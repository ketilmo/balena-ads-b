
![balena ADS-B Flight Tracker](https://raw.githubusercontent.com/ketilmo/balena-ads-b/master/docs/images/header.svg)

**ADS-B Flight Tracker running on balena with support for FlightAware, Flightradar24, Plane Finder, OpenSky Network, AirNav Radar, ADSB Exchange, Wingbits, adsb.fi, ADSB.lol, ADS-B One, airplanes.live, Planespotters.net, TheAirTraffic, AvDelphi, HP Radar, Fly Italy ADSB and plane.watch.**

Contribute to the flight tracking community! Feed your local [ADS-B data](https://mode-s.org/1090mhz/content/ads-b/1-basics.html) from an [RTL-SDR](https://www.rtl-sdr.com/) USB dongle (or various other radio types) and a supported device (see below) running balenaOS to the tracking services [FlightAware](https://flightaware.com/), [Flightradar24](https://www.flightradar24.com/), [Plane Finder](https://planefinder.net/), [OpenSky Network](https://opensky-network.org/), [AirNav Radar](https://www.airnavradar.com/), [ADSB Exchange](https://adsbexchange.com), [Wingbits](https://wingbits.com), [adsb.fi](https://adsb.fi/), [ADSB.lol](https://adsb.lol/), [ADS-B One](https://adsb.one), [airplanes.live](https://airplanes.live/), [Planespotters.net](https://www.planespotters.net/), [TheAirTraffic](https://theairtraffic.com/), [AvDelphi](https://www.avdelphi.com/), [HP Radar](https://hpradar.com/), [Fly Italy ADSB](https://flyitalyadsb.com/) and [plane.watch](https://plane.watch/). In return, you can receive complimentary premium accounts (or cryptocurrency tokens) worth several hundred dollars annually!

# Stay in the loop

👉🏻&nbsp;<a href="https://buttondown.email/balena-ads-b"> Subscribe to our newsletter</a>&nbsp;👈🏻&nbsp; to stay updated on the latest development of balena ADS-B Flight Tracker.

# Did you get stuck? Get help!

💬&nbsp; [Ask a question](https://github.com/ketilmo/balena-ads-b/discussions) in our discussion board

🖥️&nbsp; Join the [SDR Enthusiasts Discord Server](https://discord.gg/bqDDwwfM) and chat to us in the [balena-ads-b channel](https://discord.com/channels/734090820684349521/1328170413859012609)

✏️&nbsp; [Create a post](https://forums.balena.io/t/the-balena-ads-b-thread/272290) in our balena forum thread

🚨&nbsp; [Raise an issue](https://github.com/ketilmo/balena-ads-b/issues) on GitHub

📺&nbsp; Watch the videos from the [balena IoT Happy Hour in March 2021](https://youtu.be/-8RgToapBoQ) and from [balena Hackathon in October 2021](https://youtu.be/aHlNRT1iFl0)

📨&nbsp; [Reach out directly](https://ketil.mo.land/contact)

🗞&nbsp; [Read past newsletters](https://buttondown.email/balena-ads-b/archive/)

# Supported devices
|                                                                                                                        | Device                          |
|------------------------------------------------------------------------------------------------------------------------|---------------------------------|
| <img alt="Intel NUC" height="24px" src="https://docs.balena.io/img/device/intel-nuc.svg"/>                             | Intel NUC                       |
| <img alt="Nvidia Jetson Nano SD-CARD" height="24px" src="https://docs.balena.io/img/device/jetson-nano.svg"/>          | Nvidia Jetson Nano SD-CARD      |
| <img alt="Orange Pi Zero" height="24px" src="https://docs.balena.io/img/device/orange-pi-zero.svg"/>                   | Orange Pi Zero                  |
| <img alt="Raspberry Pi 3 Model B+" height="24px" src="https://docs.balena.io/img/device/raspberrypi3.svg"/>            | Raspberry Pi 3 Model B+         |
| <img alt="Raspberry Pi 3 (using 64bit OS)" height="24px" src="https://docs.balena.io/img/device/raspberrypi3-64.svg"/> | Raspberry Pi 3 (using 64bit OS) |
| <img alt="Raspberry Pi 4 (using 64bit OS)" height="24px" src="https://docs.balena.io/img/device/raspberrypi4-64.svg"/> | Raspberry Pi 4 (using 64bit OS) |
| <img alt="Raspberry Pi 400" height="24px" src="https://docs.balena.io/img/device/raspberrypi400-64.svg"/>              | Raspberry Pi 400                |
| <img alt="Raspberry Pi 5" height="24px" src="https://docs.balena.io/img/device/raspberrypi5.svg"/>                     | Raspberry Pi 5                  |

Please [let us know](https://github.com/ketilmo/balena-ads-b/discussions/new) if you are successfully running balena-ads-b on a hardware platform not listed here!

# Supported radios

This software defaults to using an RTL-SDR radio device. However, it is also compatible with Mode-S Beast, Airspy, bladeRF, HackRF, LimeSDR, and SoapySDR. Below, you can find more information on configuring these device types in the [Using different radio device types](#using-different-radio-device-types) section.

# Credits

The balena-ads-b project was created by [Ketil Moland Olsen](https://github.com/ketilmo/). It is now maintained as a team effort by Ketil, [Aaron Shaw (shawaj)](https://github.com/shawaj), and [Teko012](https://github.com/Teko012/). 

The project was inspired by and has borrowed code from the following repos and forum threads:  

 - https://github.com/compujuckel/adsb-docker
 - https://bitbucket.org/inodes/resin-docker-rtlsdr
 - https://github.com/wercsy/balena-ads-b
 - https://github.com/mikenye/
 - [https://discussions.flightaware.com/](https://discussions.flightaware.com/t/howto-install-piaware-4-0-on-debian-10-amd64-ubuntu-20-amd64-kali-2020-amd64-on-pc/69753/3)
 - https://github.com/marcelstoer/docker-adsbexchange
 - https://github.com/wiedehopf/airspy-conf

Thanks to [compujuckel](https://github.com/compujuckel/), [Glenn Stewart](https://bitbucket.org/inodes/), [wercsy](https://github.com/wercsy/), [mikenye](https://github.com/mikenye/), [abcd567a](https://github.com/abcd567a) and [marcelstoer](https://github.com/marcelstoer) for sharing!

Thanks to [garethhowell](https://github.com/garethhowell) for implementing the initial ADSB Exchange support and to [wiedehopf](https://github.com/wiedehopf/) for improving it.

Thanks to [rmorillo24](https://github.com/rmorillo24/) for verifying balenaFin compatibility, to [adaptive](https://github.com/adaptive/) for confirming Raspberry Pi 400 compatibility, and to [eagleDiego](https://github.com/eagleDiego) for confirming Orange Pi Zero compability.

Thanks to [schubydoo](https://github.com/schubydoo) for assistance in keeping the repository up to date.

Thanks to [Teko012](https://github.com/Teko012/) for modernising the repo, keeping it up to date, and suggesting several improvements.

Thanks to [schubydoo](https://github.com/schubydoo), [JPGMC](https://github.com/JPGMC), and [alanb128](https://github.com/alanb128) for beta testing the UAT support.

Thanks to [Aaron Shaw (shawaj)](https://github.com/shawaj) for implementing Wingbits and Mode-S Beast support, fixing bugs, and improving the code.

Thanks to [mikenye](https://github.com/mikenye) for implementing [plane.watch](https://plane.watch/) support.

And thanks to [jediksd](https://github.com/jediksd) for squashing a OpenSky Network issue.

You are all stars! 🤩

Software packages downloaded, installed, and configured by the balena-ads-b script are disclosed in [CREDITS.md](https://github.com/ketilmo/balena-ads-b/blob/master/CREDITS.md).

# Contributors
<a href="https://github.com/ketilmo/balena-ads-b/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=ketilmo/balena-ads-b" />
</a>

# Table of Contents
- [Part 1 – Build the receiver](#part-1--build-the-receiver)
- [Part 2 – Setup balena and configure the device](#part-2--setup-balena-and-configure-the-device)
- [Part 3 – Configure FlightAware](#part-3--configure-flightaware)
  * [Alternative A: Port an existing FlightAware receiver](#alternative-a-port-an-existing-flightaware-receiver)
  * [Alternative B: Setup a new FlightAware receiver](#alternative-b-setup-a-new-flightaware-receiver)
- [Part 4 – Configure Flightradar24](#part-4--configure-flightradar24)
  * [Alternative A: Port an existing Flightradar24 receiver](#alternative-a-port-an-existing-flightradar24-receiver)
  * [Alternative B: Setup a new Flightradar24 receiver](#alternative-b-setup-a-new-flightradar24-receiver)
- [Part 5 – Configure Plane Finder](#part-5--configure-plane-finder)
  * [Alternative A: Port an existing Plane Finder receiver](#alternative-a-port-an-existing-plane-finder-receiver)
  * [Alternative B: Setup a new Plane Finder receiver](#alternative-b-setup-a-new-plane-finder-receiver)
- [Part 6 – Configure OpenSky Network](#part-6--configure-opensky-network)
  * [Alternative A: Port an existing OpenSky Network receiver](#alternative-a-port-an-existing-opensky-network-receiver)
  * [Alternative B: Setup a new OpenSky Network receiver](#alternative-b-setup-a-new-opensky-network-receiver)
- [Part 7 – Configure AirNav Radar](#part-7--configure-airnav-radar)
  * [Alternative A: Port an existing AirNav Radar receiver](#alternative-a-port-an-existing-airnavn-radar-receiver)
  * [Alternative B: Setup a new AirNav Radar receiver](#alternative-b-setup-a-new-airnav-radar-receiver)
- [Part 8 – Configure ADSB Exchange and clones](#part-8--configure-adsb-exchange-and-clones)
  * [Enable ADSB Exchange](#enable-adsb-exchange)
  * [Enable ADSB Exchange Clones](#enable-adsb-exchange-clones)
- [Part 9 – Configure Wingbits](#part-9--configure-wingbits)
  * [Alternative A: Port an existing Wingbits receiver](#alternative-a-port-an-existing-wingbits-receiver)
  * [Alternative B: Setup a new Wingbits receiver](#alternative-b-setup-a-new-wingbits-receiver)
- [Part 10 - Configure plane.watch](#part-10---configure-planewatch)
  * [Alternative A: Port an existing plane.watch receiver](#alternative-a-port-an-existing-planewatch-receiver)
  * [Alternative B: Setup a new plane.watch receiver](#alternative-b-setup-a-new-planewatch-receiver)
- [Part 11 – Configure UAT (Optional and US only)](#part-11--configure-uat-optional-and-us-only)
- [Part 12 - Configure tar1090 and graphs1090 (Optional)](#part-12--configure-tar1090-and-graphs1090-optional)
- [Part 13 – Add a digital display (Optional)](#part-13--add-a-digital-display-optional)
- [Part 14 – Exploring flight traffic locally on your device](#part-14--exploring-flight-traffic-locally-on-your-device)
- [Part 15 – Advanced configuration](#part-15--advanced-configuration)
  * [Disabling specific services](#disabling-specific-services)
  * [Using different radio device types](#using-different-radio-device-types)
  * [Adaptive gain configuration](#adaptive-gain-configuration)
  * [Setting dump1090 antenna gain](#setting-dump1090-antenna-gain)
  * [Device reboot on service exit](#device-reboot-on-service-exit)
  * [Automatic balenaOS host updates](#automatic-balenaos-host-updates)
  * [Custom MLAT client](#custom-mlat-client)
 - [Part 16 – Updating to the latest version](#part-16--updating-to-the-latest-version)

# Part 1 – Build the receiver

We'll build the receiver using the parts that are outlined on the Flightradar24, FlightAware, and AirNav Radar websites: 
- https://www.flightradar24.com/build-your-own
- https://www.flightaware.com/adsb/piaware/build
- https://www.airnavradar.com/raspberry-pi

These sites suggest the Raspberry Pi 3 Model B+ as the preferred device. Still, this project runs on all the devices mentioned above. Suppose you are buying a new appliance specifically for this project. In that case, we suggest the **Raspberry Pi 4 Model B** with as much memory as possible. It's excellent value for money.

In addition to the device, you will need an RTL-SDR-compatible USB dongle. The dongles are based on a digital television tuner, and numerous types will work – both generic TV sticks and specialized ADS-B sticks (produced by FlightAware). Although both options work, the ADS-B sticks seem to perform a little better.

If you live in the US, and want to track UAT traffic in addition to ADS-B traffic, you can use two dongles in parallell. Please note that the blue FlightAware USB devices should only be used for ADS-B traffic, as they have an integrated filter optimized explicitly for the 1090 MHz frequencies. The orange FlightAware USB devices work well for tracking UAT traffic. See [Part 11 – Configure UAT (Optional and US only)](#part-11--configure-uat-optional-and-us-only) for more details.

# Part 2 – Setup balena and configure the device

[![Deploy with button](https://raw.githubusercontent.com/ketilmo/balena-ads-b/master/docs/images/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/ketilmo/balena-ads-b&defaultDeviceType=raspberrypi4-64)

or

 1. [Create a free balena account](https://dashboard.balena-cloud.com/signup). You will be asked to upload your public SSH key during the process. If you don't have a public SSH key yet, you can [create one](https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
 2. Sign in to balena and head to the [*Fleets*](https://dashboard.balena-cloud.com/fleets) panel.
 3. Create a fleet with the name of your choice for your device type. Please take note of the fleet name. You will need it later. In the dialog that appears, pick a *Default Device Type* that matches your device. Specify the SSID and password if you want to use WiFi (and your device supports it). (If your device comes up without an active connection to the Internet, the `wifi-connect` container will create a network with a captive portal to connect to a local WiFi network. The SSID for the created hotspot is `balenaWiFi`, and the password is`balenaWiFi`. When connected, visit `http://192.168.42.1:8181/` in your web browser to set up the connection.
 4. balena will create an SD card image for you, which will start downloading automatically after a few seconds. Flash the image to an SD card using balena's dedicated tool [balenaEtcher](https://www.balena.io/etcher/).
 5. Insert the SD card in your receiver, and connect it to your cabled network (unless you plan to use WiFi only and configured that in step 3). 
 6. Power up the receiver.
 7. From the balena dashboard, navigate to the fleet you created. A new device with an automatically generated name should appear within a few minutes. Click on it to open it.
 8. Rename your device to your taste by clicking on the pencil icon next to the current device name.
 9. Next, we'll configure the receiver with its geographic location. Unless you know this by heart, you can use [Google Maps](https://maps.google.com) to find it. The corresponding coordinates should appear when you click on your desired location on the map. We are looking for the decimal coordinates, which should look like *60.395429, 5.325127.*
 10. Back in the balena console, verify that you have opened the view for your desired device. Click on the *Device Variables*-button. Add the following two variables: `LAT` *(Receiver Latitude)*, e.g. with a value such as `60.12345` and `LON` *(Receiver Longitude)*, e.g. with a value such as `4.12345`.
 11. Now, you're going to enter the receiver's altitude in *meters* above sea level in a new variable named `ALT`. If you need to find the altitude, you can find it using [one of several online services](https://www.maps.ie/coordinates.html). Remember to add the approximate number of corresponding meters if your antenna is mounted above ground level.
 12. Almost there! Next, we will push this code to your device through the balena cloud. We'll do that using the [balena CLI](https://github.com/balena-io/balena-cli). Follow the [official instructions](https://github.com/balena-io/balena-cli/blob/master/INSTALL.md) to download and install the CLI for your platform of choice.
 13. Head into your terminal and log in to balena with the following command: `balena login`. Then follow the instructions on the screen.
 14. Next, clone the balena-ads-b repository to your local computer with your Git client of choice or the standard command line tool: `git clone git@github.com:ketilmo/balena-ads-b.git`. If you want to make changes to the repo, you can also fork it.
 15. Head into the folder of the newly cloned repo by typing `cd balena-ads-b`.
 16. Do you remember your fleet name from earlier? Good. Now, we are ready to push the applications to balena's servers by typing `balena push YOUR–FLEET–NAME–HERE`.
 17. Now, wait while the Docker containers build on balena's servers. If the process is successful, you will see a beautiful piece of ASCII art depicting a unicorn right in your terminal window:
<pre>
			    \
			     \
			      \\
			       \\
			        >\/7
			    _.-(6'  \
			   (=___._/` \
			        )  \ |
			       /   / |
			      /    > /
			     j    < _\
			 _.-' :      ``.
			 \ r=._\        `.
			<`\\_  \         .`-.
			 \ r-7  `-. ._  ' .  `\
			  \`,      `-.`7  7)   )
			   \/         \|  \'  / `-._
			              ||    .'
			               \\  (
			                >\  >
			            ,.-' >.'
			           <.'_.''
			             <'

</pre>
 18. Wait a few moments while the Docker containers are deployed and installed on your device. The groundwork is now done – good job!


# Part 3 – Configure FlightAware
## Alternative A: Port an existing FlightAware receiver
If you have previously set up a standalone FlightAware receiver and want to port it to balena, you only have to do the following steps:

 1. Head to your device's page in the balena dashboard and click on the *Device Variables*-button. Add the following variable: `FLIGHTAWARE_FEEDER_ID`, then paste your *Unique Identifier* key, e.g. `134cdg7d-7533-5gd4-d31d-r31r52g63v12`. The ID can be found on the FlightAware website's *My ADS-B* section.
 2. From the balena dashboard, restart the *piaware* service under *Services* by clicking the "cycle" icon next to the service name.

## Alternative B: Setup a new FlightAware receiver
If you have not previously set up a FlightAware receiver that you want to reuse, do the following steps:

 1. Head back to your device's *Summary* page. Inside the *Terminal* section, click *Select a target*, then *piaware*, and finally *Start terminal session*. This will open a terminal which lets you interact directly with your PiAware container.
 2. Once the terminal prompt appears, enter `/getid.sh` (including the leading slash), then press return.
 3. If everything goes according to plan, your FlightAware feeder id will soon appear. Copy it.
 4. Click on the *Device Variables*-button in the left-hand menu. Add a variable named `FLIGHTAWARE_FEEDER_ID` and paste the value from the previous step, e.g. `134cdg7d-7533-5gd4-d31d-r31r52g63v12`.
 5. Go back to your device's *Summary* page. Restart the *piaware* service under *Services* by clicking the “cycle” icon next to the service name.
 6. Register [a new account](https://flightaware.com/account/join/) at FlightAware, then log in using your newly created credentials.
 7. **Important:** While being connected to *the same network* (either cabled or wireless) as your receiver is connected to, head to FlightAware's *[Claim Receiver](https://flightaware.com/adsb/piaware/claim)* page. (If this doesn't work, you can try using this link: https://flightaware.com/adsb/piaware/claim/98395c99-xxxxxxxxx16e. Replace the part after "claim" with your `FLIGHTAWARE_FEEDER_ID`.)
 8. Check if any receivers appear under the *Linked PiAware Receivers* heading. (If not, wait a few minutes and click the *Check Again for my PiAware*-button.) Hopefully, your receiver is now visible under the *Linked PiAware Receivers* header.
 9. In the left-hand-side menu on the top of the page, click the *My ADBS-B* menu item. Your device should be listed in an orange rectangle. Next, click the cogwheel icon on the right-hand side of the screen.
 10. Click the *Configure Location*-button, and verify that the location matches the coordinates you entered earlier. If not, correct them.
 11. Click the *Configure Height*-button, and specify the altitude of your receiver. The value should match the number you entered in the `ALT` variable in part 1.
 12. If you don't face any bandwidth constraints, enable multilateration (MLAT). Enabling MLAT lets your receiver connect to other nearby receivers to multilaterate the aircraft's positions that do not report their position through ADS-B. This option increases bandwidth usage but gives more visible aircraft positions in return. 
 13. Specify the other settings in the FlightAware lightbox according to your preferences. Close the lightbox.
 14. Finally, verify that FlightAware is receiving data from your receiver. You'll find your receiver's dashboard by clicking on the *My ADS-B* top menu item at [flightaware.com](https://www.flightaware.com). 
 
## Part 4 – Configure Flightradar24
## Alternative A: Port an existing Flightradar24 receiver
If you have previously set up a Flightradar24 receiver and want to port it to balena, you only have to do the following steps:

 1. Head back to the balena dashboard and your device's page. Click on the *Device Variables*-button. Add a variable named `FR24_KEY` and paste the value of your existing Flightradar24 key, e.g. `dv4rrt2g122g7233`. The key is located in the Flightradar24 config file, usually found here: `/etc/fr24feed.ini`. (If you cannot locate your old key, retrieve or create a new one by following the steps in alternative B.)
 2. Restart the *fr24feed* service under *Services* by clicking the "cycle" icon next to the service name.

## Alternative B: Setup a new Flightradar24 receiver
If you have not previously set up a Flightradar24 receiver that you want to reuse, do the following steps:

 1. Head back to your device's page on the balena dashboard.
 2. Inside the *Terminal* section, click *Select a target*, then *fr24feed*, and finally *Start terminal session*.
 3. This will open a terminal which lets you interact directly with your Flightradar24 container.
 4. At the prompt, enter `fr24feed --signup`.
 5. When asked, enter your email address.
 6. You will be asked if you have a Flightradar24 sharing key. Unless you have one from the past that you would like to reuse, press return here.
 7. If you want to activate multilateration, type `yes` at the next prompt. If you have restricted bandwidth, consider leaving it off by typing `no`. 
 8. Enter the receiver's latitude. This should be the same value you entered in the `LAT` variable in part 1.
 9. Enter the receiver's longitude. This should be the same value you entered in the `LON` variable in part 1.
 10. Finally, enter the receiver's altitude in *feet*. You can calculate this by multiplying the value you entered in the `ALT` variable in part 1 by 3.28.
 11. Now, a summary of your settings will be displayed. If you are happy with the result, type `yes` to continue.
 12. Under receiver type, choose `4` for ModeS Beast.
 13. Under connection type, choose `1` for network connection.
 14. When asked for your receiver's IP address/hostname, enter `dump1090-fa`.
 15. Next, enter the data port number: `30005`.
 16. Type `no` to disable the RAW data feed on port 30334.
 17. Type `no` to disable the BaseStation data feed on port 30003.
 18. Enter `0` to disable log file writing.
 19. When asked for a log file path, just hit return.
 20. The configuration will now be submitted, and you will be redirected back to the terminal.
 21. At the prompt, type `cat /etc/fr24feed.ini`. Your Flightradar24 settings will be displayed. 
 22. Find the line starting with `fr24key=`, and copy the string between the quotes. It will look something like this: `dv4rrt2g122g7233`.
 23. Click on the *Device Variables*-button in the left-hand menu. Add a variable named `FR24_KEY` and paste the value from the previous step, e.g. `dv4rrt2g122g7233`.
 24. Restart the *fr24feed* service under *Services* by clicking the "cycle" icon next to the service name.
 25. Head over to [Flightradar24's website](https://www.flightradar24.com/premium/signup) and create a new *Basic* account, using the *exact same email address* that you filled in in step 5.
 26. Shortly after your receiver starts feeding data to Flightradar24, your *Basic* account will be upgraded to their *Business* plan. Enjoy!

# Part 5 – Configure Plane Finder
## Alternative A: Port an existing Plane Finder receiver
If you have previously set up a Plane Finder receiver and want to port it to balena, you only have to do the following steps:

 1. Head back to the balena dashboard and your device's page. Click on the *Device Variables*-button. Add a variable named `PLANEFINDER_SHARECODE` and paste the value of your existing Plane Finder key, e.g. `7e3q8n45wq369`. You can find your key at Plane Finder's *[Your Receivers](https://planefinder.net/account/receivers)* page.
 2. On your device's page in the balena dashboard, restart the *planefinder* service under *Services* by clicking the "cycle" icon next to the service name.

## Alternative B: Setup a new Plane Finder receiver
If you have not previously set up a Plane Finder receiver that you want to reuse, do the following steps:

 1. Register a new [Plane Finder account](https://planefinder.net) or log into your existing account.
 2. Inside the *Terminal* section, click *Select a target*, then *planefinder*, and finally *Start terminal session*.
 3. This will open a terminal which lets you interact directly with your Plane Finder container.
 4. Once the terminal prompt appears, enter `pfclient`, then press return.
 5. If everything goes according to plan, you will see some output log messages in the terminal section.
 6. Scroll to the top of the page and look for the *Local IP Address* of your device - it should look something like `192.168.2.35` - if there is more than one IP address, any of them should work. Click the button next to the IP address to copy it to the clipboard.
 7. Open a browser window, paste in the IP address and then press return. This should load the Plane Finder sharecode generator page.
 8. Fill in the form to generate a Plane Finder share code. Use the same email address you used when registering for the Plane Finder account. For *Receiver Lat*, use the value from the `LAT` variable in part 2. For *Receiver Lon*, use the value from the `LON` variable. Lastly, click the *Create new sharecode* button. A sharecode should appear in a few seconds. It should look similar to `6g34asr1gvvx7`. Copy it to your clipboard. Disregard the rest of the form – you don't have to fill this out.
 9. Open Plane Finder's *[Your Receivers](https://planefinder.net/account/receivers)* page. Under the *Add a Receiver* heading, locate the *Share Code* input field. Paste the sharecode from the previous step, then click the *Add Receiver*-button.
 10. Head back to the Balena dashboard and your device's page. Click on the *Device Variables*-button. Add a variable named `PLANEFINDER_SHARECODE` and paste the value of the Plane Finder key you just created, e.g. `7e3q8n45wq369`.
 11. On your device's page in the Balena dashboard, restart the *planefinder* service under *Services* by clicking the "cycle" icon next to the service name.

# Part 6 – Configure OpenSky Network
## Alternative A: Port an existing OpenSky Network receiver
If you have previously set up an OpenSky Network receiver and want to port it to balena, you only have to do the following steps:

 1. Head back to the balena dashboard and your device's page. Click on the *Device Variables*-button – *Vx*.
 2. Add a variable named `OPENSKY_USERNAME` and paste your OpenSky Network username, e.g. `JohnDoe123`. You can find your username on your OpenSky Network *[Dashboard](https://opensky-network.org/my-opensky)* page.
 3. Add a variable named `OPENSKY_SERIAL` and paste the value of your existing OpenSky Network serial number, e.g. `1663421823`. You can find your serial on your OpenSky Network *[Dashboard](https://opensky-network.org/my-opensky)* page.
 4. On your device's page in the balena dashboard, restart the *opensky-network* service under *Services* by clicking the "cycle" icon next to the service name.

## Alternative B: Setup a new OpenSky Network receiver
If you have not previously set up an OpenSky Network receiver that you want to reuse, do the following steps:

 1. Register a new [OpenSky Network account](https://opensky-network.org/index.php?option=com_users&view=registration). Make sure to activate it using the email that's sent to you. Please take note of your username. You will need it soon.
 2. Head back to your device's page on the balena dashboard. Click on the *Device Variables*-button in the left-hand menu. Add a variable named `OPENSKY_USERNAME` and populate it with your newly created OpenSky Username, e.g.  `JohnDoe123`.
 3. Head back to your device's *Summary* page. Restart the *opensky-network* service under *Services* by clicking the "cycle" icon next to the service name. Wait for the service to finish restarting.
 4. Inside the *Terminal* section, click *Select a target*, then *opensky-network*, and finally *Start terminal session*.
 5. This will open a terminal which lets you interact directly with your OpenSky Network container.
 6. Once the terminal prompt appears, enter `/getserial.sh` (including the leading slash), then press return.
 7. If everything goes according to plan, your OpenSky Network serial number will soon appear. Copy it.
 8. Click on the *Device Variables*-button in the left-hand menu. Add a variable named `OPENSKY_SERIAL` and paste the value from the previous step, e.g. `1267385439`.
 9. Go back to your device's *Summary* page. Restart the *opensky-network* service under *Services* by clicking the “cycle” icon next to the service name.
 10. Head over to your OpenSky Network *[Dashboard](https://opensky-network.org/my-opensky)* and verify that your receiver shows up and feeds data.

# Part 7 – Configure AirNav Radar

## Alternative A: Port an existing AirNav Radar receiver
If you have previously set up a AirNav Radar receiver and want to port it to Balena, you only have to do the following steps:

 1. Head back to the Balena dashboard and your device's page. Click on the *Device Variables*-button.
 2. Add a variable named `AIRNAV_RADAR_KEY` and paste the value of your existing AirNav Radar key, e.g. `546b69e69b4671a742b82b10c674cdc1`. 
 3. Click the button *Apply all changes* to activate the changes. The *airnav-radar* service will automatically restart to load the new settings.
 4. Optional: If you need to get your key, issue the following command at your current AirNav Radar device: `sudo rbfeeder --showkey --no-start`.


## Alternative B: Setup a new AirNav Radar receiver
If you have not previously set up a AirNav Radar receiver that you want to reuse, do the following steps:

 1. Register a new [AirNav Radar account](https://www.airnavradar.com/register/). Make sure to activate it using the email that's sent to you.
 2. Head back to your device's page on the balena dashboard.
 3. Inside the *Terminal* section, click *Select a target*, then *airnav-radar*, and finally *Start terminal session*.
 4. This will open a terminal which lets you interact directly with your AirNav Radar container.
 5. At the prompt, enter `/showkey.sh`. Your AirNav Radar key will be displayed and look similar to this: `546b69e69b4671a742b82b10c674cdc1`.
 6. Click on the *Device Variables*-button. Add a variable named `AIRNAV_RADAR_KEY`, and paste the key from step 5, e.g. `546b69e69b4671a742b82b10c674cdc1`. 
 7. Click the button *Apply all changes* to activate the changes. The *airnav-radar* service will automatically restart to load the new settings.
 8. Head to AirNav Radar's [Claim Your Raspberry Pi](https://www.airnavradar.com/raspberry-pi/claim) page. Locate the input field named *Sharing Key,* and paste the value from step 5, e.g. `546b69e69b4671a742b82b10c674cdc1`.
 9. You might be asked to enter your feeder's location and altitude *above the ground.* Enter the same values you entered earlier in the `LAT` and `LON` variables. When asked for the antenna's altitude, specify it in meters (or feet) *above the ground* – NOT above sea level, as done previously. If you are not asked to enter this information, you can do it manually by clicking the *Edit* link under your receiver's ID on the left-hand side of the screen. 
 10. Finally, verify that AirNav Radar is receiving data from your receiver. You'll find your receiver by clicking on the *Account* menu at [airnavradar.com](https://www.airnavradar.com) under the *Stations* accordion. 

# Part 8 – Configure ADSB Exchange and clones

## Enable ADSB Exchange
1. Head back to your device's page on the balena dashboard. Inside the *Terminal* section, click *Select a target*, then *adsb-exchange*, and finally *Start terminal session*. This will open a terminal which lets you interact directly with your ADSB Exchange container.
2. At the prompt, type `/usr/local/share/adsbexchange-stats/create-uuid.sh` followed by return. Your ADSB-Exchange UUID is displayed. Note it down.
3. At the same prompt, type `/create-sitename.sh` followed by return. Enter a friendly name for your feeder as per the instructions on the screen (e.g. your location). Hit return and note down the result.
4. Click on the *Device Variables*-button. Add a variable named `ADSB_EXCHANGE_UUID` with the value from step 2.
5. Click on the *Device Variables*-button. Add a variable named `ADSB_EXCHANGE_SITENAME` with the value from step 3.
6. Restart the *adsb-exchange* service under *Services* by clicking the "cycle" icon next to the service names.
7. Next, wait a minute or two for the service to restart and head over to ADSB Exchange's 
[Feeder Status](https://www.adsbexchange.com/myip/) page from a PC on the same network as the feeder. Verify that your feeder is shown as registered and that ADSB Exchange is receiving your feed and MLAT data. You can also verify your feeder's performance at the [ADSB Exchange Feeder Map](https://map.adsbexchange.com/mlat-map/) by searching for your site name.

# Enable ADSB Exchange clones
This project supports a number of ADSB Exchange clones that arose after the sale of ADSB Exchange. Currently there is support for [adsb.fi](https://adsb.fi/), [ADSB.lol](https://adsb.lol/), [ADS-B One](https://adsb.one/), [airplanes.live](https://airplanes.live/), [Planespotters.net](https://www.planespotters.net/), [TheAirTraffic](https://theairtraffic.com/), [AvDelphi](https://www.avdelphi.com/), [HP Radar](https://hpradar.com/), and [Fly Italy ADSB](https://flyitalyadsb.com/). If you would like any new services adding, please create a PR adding the new service or if you do not know how then please [open an issue](https://github.com/ketilmo/balena-ads-b/issues/new) with your request.

For these services, you currently do not need any login or API credentials so there is no need to make an account with them (although some of them do offer this) and no credentials to add in balenaCloud. However, you do have to selectively enable each service (or you can enable all of them, or all but ADSB Exchange).

To enable all services, or all services apart from ADSB Exchange, you can use one of the following *Device Variables*:

- `ADSB_EXCHANGE_ENABLE_ALL=true`
- `ADSB_EXCHANGE_ENABLE_ALL_BUT_ADSBX=true`

Note that you can use `true`, `enable`, `enabled`, `1`, `y`, `yes` or `on` for the value, and capitalisation does not matter. If you use `ADSB_EXCHANGE_ENABLE_ALL` this will enable ADSB Exchange and you will then need to add the `ADSB_EXCHANGE_UUID` and `ADSB_EXCHANGE_SITENAME` as described [in the section above](#enable-adsb-exchange).

To enable a single service, you would need to add a *Device Variable* with one of the following value (or several if you want to enable multiple services):

- `ADSB_EXCHANGE_ENABLE=true` (you also need to add the `ADSB_EXCHANGE_UUID` and `ADSB_EXCHANGE_SITENAME` as described [in the section above](#enable-adsb-exchange).
- `ADSB_FI_ENABLE=true`
- `ADSB_LOL_ENABLE=true`
- `ADSB_ONE_ENABLE=true`
- `AIRPLANES_LIVE_ENABLE=true`
- `PLANESPOTTERS_ENABLE=true`
- `THE_AIR_TRAFFIC_ENABLE=true`
- `AV_DELPHI_ENABLE=true`
- `HPRADAR_ENABLE=true`
- `FLY_ITALY_ADSB_ENABLE=true`

Lastly, these services all require a UUID to be passed to identify devices in their system. If you have set an `ADSB_EXCHANGE_UUID` the same UUID will be used for all services. If you do not have ADSB Exchange enabled and the `ADSB_EXCHANGE_UUID` variable set, the system will automatically generate one for you. However, if you would like, you can also set a UUID manually using the *Device Variable* with name `UUID` and with a UUID as a value (e.g. 2ddf6698-ea34-4c39-bbce-a8c3ddaf9bbd). You can use an [online UUID generator](https://www.uuidgenerator.net/) to generate one should you want to.

# Part 9 – Configure Wingbits

**PLEASE NOTE:** No new BYOD (bring your own device) Wingbits stations can be [onboarded as of Oct 14th, 2024](https://docs.wingbits.com/project/wingbits-approved-hardware-program). Unless you have an already active Wingbits station and a [GeoSigner dongle](https://shop.wingbits.com/products/wingbits-geosigner) then you will not be able to earn Wingbits tokens using this software.

## Alternative A: Port an existing Wingbits receiver
If you have previously set up a Wingbits receiver and want to port it to Balena, you only have to do the following steps:

 1. Head back to the Balena dashboard and your device's page. Click on the *Device Variables*-button. Add a variable named `WINGBITS_DEVICE_ID` and paste the value of your existing Wingbits ID, e.g. `small-coral-spider`. To get your ID, visit the [Wingbits Dashboard](https://wingbits.com/dashboard/antennas), make sure you are on the *Antennas* tab and look in the ID column.
 2. Restart the *wingbits* service under *Services* by clicking the "cycle" icon next to the service name.

## Alternative B: Setup a new Wingbits receiver
If you have not previously set up a Wingbits receiver that you want to reuse, do the following steps:

 1. Register a new [Wingbits account](https://wingbits.com/register). Make sure to activate it using the email that's sent to you.
 2. Login to your [Wingbits account](https://wingbits.com/login), navigate to the *Antennas* tab and then click on *Register Antenna*.
 3. Enter your latitude and longitude in the boxes (or select your location on the map). Then scroll down and click *Register*. You will then be returned to the antennas page with a new entry in the list. Make sure to take note of the name in the ID column, for example `small-coral-spider`.
 4. Head back to your device's page on the balena dashboard.
 5. Click on the *Device Variables*-button in the left-hand menu. Add a variable named `WINGBITS_DEVICE_ID` and paste the value from step 4, e.g. `small-coral-spider`.
 6. Restart the *wingbits* service under *Services* by clicking the "cycle" icon next to the service name.
 7. Wait a few minutes and then head back to the [Wingbits antennas tab](https://wingbits.com/dashboard/antennas), refresh the page and in the *Status* column of the table you should see the text `Online` with a green background. If you hover over this with your mouse you should see a tooltip text pop-up that says the last time data was receive e.g. `Last message: 22/11/2023, 03:17:40`.

## Wingbits status commands
You will notice that the [documentation for the new Wingbits client](https://docs.wingbits.com/get-started/byod-stations/installing-the-client#confirm-status-of-the-client-and-geosigner-if-installed) discusses how to check that your GeoSigner is working correctly using the `wingbits status` command. Unfortunately, as this command uses systemctl under the hood, it will not run correctly as balena containers do not use systemctl by default.

However, it is still possible to check that your GeoSigner is working correctly using the command `wingbits geosigner info`.

# Part 10 - Configure plane.watch

## Alternative A: Port an existing plane.watch receiver
If you have previously set up a plane.watch receiver and want to port it to Balena, you only have to do the following steps:

1. Head back to the Balena dashboard and your device's page. Click on the *Device Variables*-button. Add a variable named `PLANEWATCH_API_KEY` and paste the value of your existing plane.watch receiver's API Key, e.g. `4e8413e6-52eb-11ea-8681-1c1b0d925d3g`. To get your feeder's API Key, visit the [plane.watch ATC (ADS-B Traffic Control) dashboard](https://atc.plane.watch), go to the *Feeders* section, press the show button (magnifying glass) next to the feeder in question, and copy the API key from the page that appears.
2. Restart the *planewatch* service under *Services* by clicking the "cycle" icon next to the service name.

## Alternative B: Setup a new plane.watch receiver
If you have not previously set up a plane.watch receiver that you want to reuse, do the following steps:

1. Register a new [plane.watch ATC account](https://atc.plane.watch). Make sure to activate it using the email that's sent to you.
2. Login to your [plane.watch ATC account](https://atc.plane.watch), navigate to the *Feeders* tab and then click on *+ New Feeder*.
3. Enter your location name, latitude and longitude, and elevation details in the boxes. Then scroll down and click *Save*. You will then be returned to the feeders page with a new entry in the list. Press the show button (magnifying glass) next to the feeder in question, and copy the API Key, e.g. `4e8413e6-52eb-11ea-8681-1c1b0d925d3g`.
4. Head back to your device's page on the balena dashboard.
5. Click on the *Device Variables*-button in the left-hand menu. Add a variable named `PLANEWATCH_API_KEY` and paste the value from step 3, e.g. `4e8413e6-52eb-11ea-8681-1c1b0d925d3g`.
6. Restart the *planewatch* service under *Services* by clicking the "cycle" icon next to the service name.
7. Wait a few minutes and then head back to your feeder's page within [plane.watch ATC](https://atc.plane.watch), refresh the page and in the *ADS-B Connection Status* and *MLAT Connection Status* columns of the table you should see the text `Online` in green text, with your connection details.

# Part 11 – Configure UAT (Optional and US only) 
***Please note:** The following instructions involve making low-level changes to RTL-SDR USB sticks, such as changing the serial numbers. Proceed with caution, and only if you are comfortable with the steps involved. All changes made are at your own risk.*

In the United States, aircraft can use either the ADS-B standard, which transmits at a frequency of 1090 MHz or the UAT protocol, which transmits at 978 MHz. If you live in the US and have an extra RTL-SDR dongle, you can track the UAT and ADS-B traffic. Please note that the blue FlightAware USB devices should only be used for ADS-B traffic, as they have an integrated filter optimized explicitly for the 1090 MHz frequencies. The orange FlightAware USB devices work well for tracking UAT traffic.

1. Make sure you only have one RTL-SDR stick connected to your device before executing the following steps. The connected stick should be used for regular ADS-B 1090 MHz feeding. 
2. Head to your device's *Summary* page. Click on the *Device Variables*-button in the left-hand menu. Add a variable named `DUMP1090_IDLE` and populate it with the value `true`.
3. From the *Summary* page, inside the *Terminal* section, click *Select a target*, then *dump1090-fa*, and finally *Start terminal session*. This will open a terminal that lets you interact directly with the dump1090-fa container.
4. Once the terminal prompt appears, enter `/add-serial-1090.sh`, then press return. 
5. Type `YES`, followed by return, to change your dongle's serial number. Verify that the process completes successfully.
6. Click on the *Device Variables*-button in the left-hand menu. Add a new variable named `DUMP1090_DEVICE` and set its value to `00001090`.
7. Shut down your device. When it's powered off, remove the first RTL-SDR stick from the Pi.
8. Insert the second RTL-SDR stick (the one used for UAT), leaving the first stick disconnected. Power on your device.
9. Click on the Device Variables-button in the left-hand menu. Delete the variable you created earlier called `DUMP1090_IDLE`. Then create a variable named `DUMP978_IDLE` and populate it with the value `true`. Also add a new variable named `UAT_ENABLED` and assign it the value `true`.
10. Head to your device's *Summary* page. Wait for all containers to come up with the status *Running*. Inside the *Terminal* section, click *Select a target*, then *dump978-fa*, and finally *Start terminal session*.
11. Once the terminal prompt appears, enter `/add-serial-978.sh`, then press return.
12. Type `YES`, followed by return, to change your dongle's serial number. Verify that the process completes successfully.
13. Click on the *Device Variables*-button in the left-hand menu. Add a new variable named `DUMP978_DEVICE` and set its value to `00000978`.
14. Shut down your device. When it's powered off, connect both RTL-SDR sticks.
15. Click on the *Device Variables*-button in the left-hand menu. Delete the `DUMP978_IDLE` variable.
16. Power on the device. You should now be feeding ADS-B and UAT data simultaneously to the services that support it (FlightAware, AirNav Radar and ADSB-Exchange).

**Manually set gain for UAT/dump978**

By default the gain for the UAT/dump978 service is set to `--sdr-auto-gain`. This is an automatic setting which tries to get the optimum gain setting for your setup. In some cases the automatic gain setting can cause issues with over-saturation of your receiver, and so we have added an optional setting for `DUMP978_GAIN` to allow you to manually set it to an appropriate value of your choosing.

In order to manually set the gain. click on the *Device Variables*-button in the left-hand menu in the balena dashboard. Add a new variable named `DUMP978_GAIN` and set its value to your required gain. You can choose from any of the following values: `0.0, 0.9, 1.4, 2.7, 3.7, 7.7, 8.7, 12.5, 14.4, 15.7, 16.6, 19.7, 20.7, 22.9, 25.4, 28.0, 29.7, 32.8, 33.8, 36.4, 37.2, 38.6, 40.2, 42.1, 43.4, 43.9, 44.5, 48.0, 49.6`

# Part 12 – Configure tar1090 and graphs1090 (Optional)
[Tar1090](https://github.com/wiedehopf/tar1090) and [graphs1090](https://github.com/wiedehopf/graphs1090) are visualisation tools that can help you to see the output and determine the performance of your ADS-B plane tracking setup. These tools are pre-configured to run out-of-the-box as long as the `LAT` and `LON` parameters are set as described in [part 2 above](#part-2--setup-balena-and-configure-the-device). However, there is some significant customisation possible as this service uses the [docker-tar1090 container](https://github.com/sdr-enthusiasts/docker-tar1090) from [SDR Enthusiasts](https://github.com/sdr-enthusiasts). You can view all of the configuration options in the [README of the docker-tar1090 GitHub repo](https://github.com/sdr-enthusiasts/docker-tar1090/blob/main/README.md).

By default, these viewers are fed with ADS-B data from the dump1090 container and with MLAT data from the adsb-exchange container, however you can also manually configure these. You can use the *Device Variables* `BEASTHOST` and `BEASTPORT` (default `dump1090-fa` and `30005` respectively) for ADS-B data input and the *Device Variables* `MLATHOST` and `MLATPORT` (default `adsb-exchange` and `30157` respectively) to configure the inputs you desire.

# Part 13 – Add a digital display (Optional)
balena also produces a project that can be easily configured to display a webpage in kiosk mode on a digital display called balenaDash. By dropping that project into this one, we can automatically display a feeder page directly from the Pi. We can then set a `LAUNCH_URL` device variable configured to connect to `http://{{YOURIP or YOURSERVICENAME}}:YOURSERVICEPORT` (where the service/port is one of the frontends above, like `http://planefinder:30053`) and that will automatically be displayed on the attached display. The balenaDash service can be configured locally by accessing the webserver on port 8081.

# Part 14 – Exploring flight traffic locally on your device
If the setup goes well, you should feed flight traffic data to several online services. You will receive access to the providers' premium services in return for your efforts. But in addition to this, you can explore the data straight from your device, raw and unedited. And that's part of the magic, right?

When you have local network access to your receiver, you can explore the data straight from the source. Start by opening your device page in the balena console and locate the `IP ADDRESS` field, e.g. `10.0.0.10`. Then, add the desired port numbers specified further below.

Away from your local network but still eager to know what planes are cruising over your home? Here, balena's built-in *Public Device URL* comes in handy. Open your device page in the balena console, locate the `PUBLIC DEVICE URL` header, and flip the switch below to enable it. Finally, click on the arrow icon next to the button, add the desired URL postfix specified below and voila – you should see what's going on in your area.

 **Dump1090's Radar View**
This view visualizes everything that your receiver sees, including multilaterated plane positions. When you are in your local network, head to `YOURIP:8080` to check it out. When remote, open balena's *Public Device URL* and add `/skyaware/` to the tail end of the URL, e.g. `https://6g31f15653bwt4y251b18c1daf4qw164.balena-devices.com/skyaware/`

**Plane Finder's Radar View**
It's similar to Dump1090, but Plane Finder adds 3D visualization and other excellent viewing options. Head to `YOURIP:30053` to check it out. When remote, open balena's *Public Device URL* and add `/planefinder/` to the tail end of the URL, e.g. `https://6g31f15653bwt4y251b18c1daf4qw164.balena-devices.com/planefinder/`

**Flightradar24 Status Page**
Less visual than the two other options, Flightradar24's status page gives you high-level statistics and metrics about your feeder's performance. Head to `YOURIP:8754` to check it out. When remote, open balena's *Public Device URL* and add `/fr24feed/` to the tail end of the URL, e.g. `https://6g31f15653bwt4y251b18c1daf4qw164.balena-devices.com/fr24feed/`

**Dump978's Radar View (Optional and US only)**
If you live in the US and have configuered UAT feeding, you can explore the data using this view. When you are in your local network, head to `YOURIP:8978` to check it out. When remote, open balena's *Public Device URL* and add `/skyaware978/` to the tail end of the URL, e.g. `https://6g31f15653bwt4y251b18c1daf4qw164.balena-devices.com/skyaware978/`. However, keep in mind that UAT traffic is scarce. It might take several days before you see any traffic, depending on where in the US you are situated.

**Tar1090 Radar View**
[Tar1090](https://github.com/wiedehopf/tar1090) is a radar view of the plane traffic (ADS-B. MLAT etc) seen by the SDR. It is similar to the Dump1090 / skyaware radar view but has a number of other useful viewing options and data points. It is also highly configurable. When you are in your local network, head to `YOURIP/tar1090` to check it out. When remote, open balena's *Public Device URL* and add `/tar1090/` to the tail end of the URL, e.g. `https://6g31f15653bwt4y251b18c1daf4qw164.balena-devices.com/tar1090/`

**Graphs1090 Stats Graphs**
[Graphs1090](https://github.com/wiedehopf/graphs1090) is a graphical output that plots performance graphs of the interesting data from both your SDR data and your system data. You can see things like your ADS-B range, message rates, number of planes and signal levels as well as system data such as CPU and memory usage, temperature and bandwidth. When you are in your local network, head to `YOURIP/graphs1090` to check it out. When remote, open balena's *Public Device URL* and add `/graphs1090/` to the tail end of the URL, e.g. `https://6g31f15653bwt4y251b18c1daf4qw164.balena-devices.com/graphs1090/`

# Part 15 – Advanced configuration
## Disabling specific services
You can disable any of the balena-ads-b services by creating a *Device Variable* named `DISABLED_SERVICES` with the services you want to disable as comma-separated values. For example, if you want to disable the dump1090fa service, you set the `DISABLED_SERVICES` variable to `dump1090fa`. If you want to disable the dump1090fa and piaware services, you set the `DISABLED_SERVICES` variable to `dump1090fa, piaware`.

## Using different radio device types

With balena-ads-b you are able to use a variety of SDRs (software defined radios) and other devices such as the FPGA based Mode-S Beast and Airspy. The default operating mode is to use an RTL-SDR over USB and no additional configuration is needed for this setup.

If you are using a Mode-S Beast, Airspy, bladeRF, HackRF, LimeSDR or SoapySDR then you will need to configure this for the device to work as intended.

In order to configure the particular device type you are using, you need to create a *Device Variable* named `RADIO_DEVICE_TYPE`. The possible values are below:

- `rtlsdr` (this is the default and you do not need to configure this variable if you are using an RTL-SDR)
- `modesbeast`
- `airspy`
- `bladerf`
- `hackrf`
- `limesdr`
- `soapy`

For example if you have a Mode-S Beast, you set the `RADIO_DEVICE_TYPE` variable to `modesbeast`. Remember to save the device variable settings after you have updated them. Your device should restart automatically once you configure this and the radio should now work.

### Airspy Setup

**Please Note:** If you are using an Airspy radio module, it is recommended to use a Raspberry Pi 4 or a device that is as (or more) powerful. Whilst Airspy will work with less powerful hardware, the performance will be degraded and you may need to tweak some of the default settings.

If you use Airspy and need to power active antennas or preamplifiers, you can enable the bias tee by setting a *Device Variable* named `AIRSPY_ADSB_BIASTEE` to `true`.

If you have multiple Airspy modules connected to the same device, you can differentiate between them using their serial numbers. The serial number appears in the console logs when `dump1090-fa` starts up. Copy the serial number and set it as the value of a *Device Variable* named `AIRSPY_ADSB_SERIAL`. You can do this multiple times, plugging a single Airspy in at a time, to the serials of additional devices - but make sure to write a label on each one so you know which is which!

**Important:** If the serial number is in hexadecimal format, prefix it with `0x`, e.g., `0x00B512CD22524212`.

There are some other *Device Variables* you can use as well:
- `AIRSPY_ADSB_STATS` defaults to false, as it causes additional writes to the SD card. However, if you are using [graphs1090](#part-14--exploring-flight-traffic-locally-on-your-device) and would like to see additional Airspy specific graph output you can create a *Device Variable* and set its value to `true`.
- `AIRSPY_ADSB_GAIN` has a default setting of `auto`. The auto setting works very well so it is not recommended to change it. However, if you have a specific reason to you can use a setting from 0 to 21.
- `AIRSPY_ADSB_SAMPLE_RATE` has a default setting of 12. On the Airspy R2 you can also use 20 or 24 however these can be unstable so are not recommended unless you have a specific reason.
- `AIRSPY_ADSB_OPTIONS` contains all of the rest of the settings which Airspy starts up with. The default value is set as `-v -t 90 -f 1 -e 4 -w 5 -P 8 -C 60 -E 20 -R rms -D 24,25,26,27,28,29,30,31` - for a full description of what these mean you can take a look at the [airspy-conf](https://github.com/wiedehopf/airspy-conf/blob/master/airspy_adsb.default) and [airspy_adsb](https://github.com/sdr-enthusiasts/airspy_adsb?tab=readme-ov-file#environment-variables) repositories which explain all of the settings. It is not recommended to change any of these unless you know why you are doing so.

## RTL-SDR dongle with software enabled bias tee

If you are using an [RTL-SDR blog dongle](https://www.rtl-sdr.com/tag/shop/) or any other dongle with software enabled bias tee capability you can enable the bias tee using a *Device Variable*. This is possible in both the `dump1090-fa` and `dump978-fa` containers and they can be controlled individually. 

- The `dump1090-fa` container handles the main ADS-B feed at 1090 MHz. To enable the bias tee in this container, create a *Device Variable* named `RTL1090_BIASTEE_ENABLE` and set its value to `true`.
- If you are also using the `dump978-fa` container to feed [UAT 978 MHz data](#part-11--configure-uat-optional-and-us-only), you can enable the bias tee in this container by creating a *Device Variable* with name `RTL978_BIASTEE_ENABLE` and setting its value to `true`.

For both containers, the bias tee enable setting will respect the `DUMP1090_DEVICE` and `DUMP978_DEVICE` variables if they are set. This means that if you are using multiple radio modules (as described in the [UAT section](#part-11--configure-uat-optional-and-us-only)) and only want to enable the bias tee on one of them, this feature will always enable the bias tee on the correct device based on the serial number set in the *Device Variables* for that container.

In order to turn the bias tee off, you should remove the corresponding *Device Variable* and then reboot your device from the *Actions* dropdown menu on the main device summary page.

## Adaptive gain configuration
The dump1090-fa service can be configured to adapt the tuner gain to changing conditions automatically. You can [read more about how this works](https://github.com/flightaware/dump1090/blob/master/README.adaptive-gain.md#default-settings) at FlightAware's website. 

### Adaptive gain in dynamic range mode
From FlightAware's documentation: *The dynamic range adaptive gain mode attempts to set the receiver gain to maintain a given dynamic range - that is, it tries to set the gain so that general noise is at or below a given level.*

This mode is *enabled* by default. If you specify the antenna gain manually (see below), it will be deactivated. You can manually disable this mode by setting a *Device Variable* named `DUMP1090_ADAPTIVE_DYNAMIC_RANGE` with the value `false`.  

### Adaptive gain in "burst" signal mode
From FlightAware's documentation: *The "burst" adaptive gain mode listens for loud bursts of signal that were _not_ successfully decoded as ADS-B messages, but which have approximately the right timing to be possible messages that were lost due to receiver overloading. When enough overly-loud signals are heard in a short period of time, dump1090 will _reduce_ the receiver gain to try to allow them to be received.*

This mode is *disabled* by default. You can enable it by setting a *Device Variable* named `DUMP1090_ADAPTIVE_BURST` with the value `true`. 

For this mode to work optimally, you should adjust *loud* and *quiet* ranges. You do this by creating two *Device Variables* named `DUMP1090_ADAPTIVE_BURST_LOUD_RATE` and `DUMP1090_ADAPTIVE_BURST_QUIET_RATE`, with the desired loud- and quiet targets as their values.

### Limiting the gain range
From FlightAware's documentation: *If you know in advance approximately what the gain setting should be, so you want to allow adaptive gain to change the gain only within a certain range, you can set minimum and maximum gain settings in dB. Adaptive gain will only adjust the gain within this range.*

You can specify the target maximum and minimum gain by creating two *Device Variables* named `DUMP1090_ADAPTIVE_MIN_GAIN` and `DUMP1090_ADAPTIVE_MAX_GAIN`, with the desired maximum- and minimum gain as their values.

### Reducing the CPU cost of adaptive gain
From FlightAware's documentation: *The measurements needed to adjust gain have a CPU cost, and on slower devices it may be useful to reduce the amount of work that adaptive gain does. This can be done by adjusting the adaptive gain duty cycle. This is a percentage that controls what fraction of incoming data adaptive gain inspects. 100% means that every sample is inspected. Lower values reduce CPU use, with a tradeoff that adaptive gain has a less accurate picture of the RF environment. The default duty cycle is 50% on "fast" CPUs and 10% on "slow" CPUs (where currently "slow" means "armv6 architecture", for example the Pi Zero or Pi 1).* 

You can reduce the duty cycle further by creating a *Device Variable* named `DUMP1090_SLOW_CPU`, with the desired duty cycle percentage as the value (1-100).

## Setting dump1090 antenna gain
By default, dump1090 will run with adaptive gain in dynamic range mode. You can override this by setting a *Device Variable* named `DUMP1090_GAIN` with a value of your liking.  You can read more about manual gain optimization at the [adsb-wiki](https://github.com/wiedehopf/adsb-wiki/wiki/Optimizing-gain).

## Device reboot on service exit
dump978 and dump1090 can restart the device if it hits an error. You can enable this feature by setting a *Device Variable* named `REBOOT_DEVICE_ON_SERVICE_EXIT` with the value of `true`.

## Automatic balenaOS host updates

Automatically keep your balenaOS host release up-to-date. To enable this service, create a *Device Variables* named `ENABLED_SERVICES` with the value of `autohupr`. You may also want to set the following *Device Variables*:

- `HUP_CHECK_INTERVAL`: Interval between checking for available updates. Default is 1d.
- `HUP_TARGET_VERSION`: The OS version you want balenaHUP to automatically update your device to. This is a required variable to be specified, otherwise, an update won't be performed by default. Set the variable to 'latest'/'recommended' for your device to always update to the latest OS version or set it to a specific version (e.g '2.107.10').

## Custom MLAT client

In the [docker compose file]([https://github.com/ketilmo/balena-ads-b/blob/shawaj/mlat-version/docker-compose.yml](https://github.com/ketilmo/balena-ads-b/blob/master/docker-compose.yml#L258-L271)) you will notice at the bottom there is a section labelled `Optional: Uncomment to enable custom mlat server.` This allows you to share MLAT data with an MLAT server of your choosing, unrelated to any of the above services.

In order to enable this, you will need to fork the repo and edit the docker-compose.yml file to remove the `#` at the beginning of each line starting with the one that says `mlat-client`. Once done you should save the file, and then you can deploy it to your fleet using the manual method described above in [Part 2 – Setup balena and configure the device](#part-2--setup-balena-and-configure-the-device).

You will also need to add *Device Variables* named `MLAT_CLIENT_USER` with a value of your desired username or UUID and another one named `MLAT_SERVER` with a value or your desired MLAT server address and port. For example you might have an `MLAT_CLIENT_USER` of `0327791e-3777-40a5-addc-aa13408d3b07` and an `MLAT_SERVER` of `feed.mymlatserver.com:31090`.

# Part 16 – Updating to the latest version

Updating to the latest version is trivial. If you installed balena-ads-b using the blue Deploy with balena-button, you can click it again and overwrite your current application. Choose the "Deploy to existing fleet" option, then select the fleet you want to update. All settings will be preserved. For convenience, the button is right here:

[![Deploy with button](https://www.balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/ketilmo/balena-ads-b&defaultDeviceType=raspberrypi4-64)

If you used the manual `balena push` method, pull the changes from the master branch and push the update to your application with the balena CLI. For complete instructions, look at [Part 2 – Setup balena and configure the device](#part-2--setup-balena-and-configure-the-device).

Enjoy!

![Visitors](https://api.visitorbadge.io/api/combined?path=https%3A%2F%2Fgithub.com%2Fketilmo%2Fbalena-ads-b&countColor=%23263759)
