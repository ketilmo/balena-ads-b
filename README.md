
![balena ADS-B Flight Tracker](https://raw.githubusercontent.com/ketilmo/balena-ads-b/master/docs/images/header.png)

**ADS-B Flight Tracker running on balena with support for FlightAware, Flightradar24, Plane Finder, OpenSky Network, AirNav RadarBox, ADSB Exchange, and Wingbits.**

Contribute to the flight tracking community! Feed your local ADS-B data from an [RTL-SDR](https://www.rtl-sdr.com/) USB dongle and a supported device (see below) running balenaOS to the tracking services [FlightAware](https://flightaware.com/), [Flightradar24](https://www.flightradar24.com/), [Plane Finder](https://planefinder.net/), [OpenSky Network](https://opensky-network.org/), [AirNav RadarBox](https://www.radarbox.com/), [ADSB Exchange](https://adsbexchange.com) and [Wingbits](https://wingbits.com). In return, you will receive complimentary premium accounts (or cryptocurrency tokens) worth several hundred dollars annually!

# Stay in the loop

👉🏻&nbsp;<a href="https://buttondown.email/balena-ads-b"> Subscribe to our newsletter</a>&nbsp;👈🏻&nbsp; to stay updated on the latest development of balena ADS-B Flight Tracker.

# Did you get stuck? Get help!

💬&nbsp; [Ask a question](https://github.com/ketilmo/balena-ads-b/discussions) in our discussion board

✏️&nbsp; [Create a post](https://forums.balena.io/t/the-balena-ads-b-thread/272290) in our balena forum thread

🚨&nbsp; [Raise an issue](https://github.com/ketilmo/balena-ads-b/issues) on GitHub

📺&nbsp; Watch the videos from the [balena IoT Happy Hour in March 2021](https://youtu.be/-8RgToapBoQ) and from [balena Hackathon in October 2021](https://youtu.be/aHlNRT1iFl0)

📨&nbsp; [Reach out directly](https://ketil.mo.land/contact)

🗞&nbsp; [Read past newsletters](https://buttondown.email/balena-ads-b/archive/)

# Supported devices
<table>
<tr><td>
<img height="24px" src="https://raw.githubusercontent.com/ketilmo/balena-ads-b/master/docs/images/arch/fincm3.svg" alt="fincm3" style="max-width: 100%; margin: 0px 4px;"></td><td>balenaFin</td>
</tr>
<tr><td>
<img height="24px" src="https://raw.githubusercontent.com/ketilmo/balena-ads-b/master/docs/images/arch/intel-nuc.svg" alt="intel-nuc" style="max-width: 100%; margin: 0px 4px;"></td><td>Intel NUC</td>
</tr>
<tr><td>
<img height="24px" src="https://raw.githubusercontent.com/ketilmo/balena-ads-b/master/docs/images/arch/jetson-nano-2gb-devkit.svg" alt="jetson-nano-2gb-devkit" style="max-width: 100%; margin: 0px 4px;"></td><td>Nvidia Jetson Nano 2GB Devkit SD</td>
</tr>
<tr><td>
<img height="24px" src="https://raw.githubusercontent.com/ketilmo/balena-ads-b/master/docs/images/arch/jetson-nano.svg" alt="jetson-nano" style="max-width: 100%; margin: 0px 4px;"></td><td>Nvidia Jetson Nano SD-CARD</td>
</tr>
<tr><td>
<img height="24px" src="https://raw.githubusercontent.com/ketilmo/balena-ads-b/master/docs/images/arch/orange-pi-zero.svg" alt="orange-pi-zero" style="max-width: 100%; margin: 0px 4px;"></td><td>Orange Pi Zero</td>
</tr>
<tr><td>
<img height="24px" src="https://raw.githubusercontent.com/ketilmo/balena-ads-b/master/docs/images/arch/raspberrypi3.svg" alt="raspberrypi3" style="max-width: 100%; margin: 0px 4px;"></td><td>Raspberry Pi 3 Model B+</td>
</tr>
<tr><td>
<img height="24px" src="https://raw.githubusercontent.com/ketilmo/balena-ads-b/master/docs/images/arch/raspberrypi3-64.svg" alt="raspberrypi3-64" style="max-width: 100%; margin: 0px 4px;"></td><td>Raspberry Pi 3 (using 64bit OS)</td>
</tr>
<tr><td>
<img height="24px" src="https://raw.githubusercontent.com/ketilmo/balena-ads-b/master/docs/images/arch/raspberrypi4-64.svg" alt="raspberrypi4-64" style="max-width: 100%; margin: 0px 4px;"></td><td>Raspberry Pi 4 (using 64bit OS)</td>
</tr>
<tr><td>
<img height="24px" src="https://raw.githubusercontent.com/ketilmo/balena-ads-b/master/docs/images/arch/raspberrypi400-64.svg" alt="raspberrypi400-64" style="max-width: 100%; margin: 0px 4px;"></td><td>Raspberry Pi 400</td>
</tr>
<tr><td>
<img height="24px" src="https://raw.githubusercontent.com/ketilmo/balena-ads-b/master/docs/images/arch/raspberrypi5.svg" alt="raspberrypi5" style="max-width: 100%; margin: 0px 4px;"></td><td>Raspberry Pi 5</td>
</tr>
</table>

Please [let us know](https://github.com/ketilmo/balena-ads-b/discussions/new) if you are successfully running balena-ads-b on a hardware platform not listed here!

# Credits

The balena-ads-b project was created and maintained by [Ketil Moland Olsen](https://github.com/ketilmo/).

It's inspired by and has borrowed code from the following repos and forum threads:  

 - https://github.com/compujuckel/adsb-docker
 - https://bitbucket.org/inodes/resin-docker-rtlsdr
 - https://github.com/wercsy/balena-ads-b
 - https://github.com/mikenye/
 - [https://discussions.flightaware.com/](https://discussions.flightaware.com/t/howto-install-piaware-4-0-on-debian-10-amd64-ubuntu-20-amd64-kali-2020-amd64-on-pc/69753/3)
 - https://github.com/marcelstoer/docker-adsbexchange

Thanks to [compujuckel](https://github.com/compujuckel/), [Glenn Stewart](https://bitbucket.org/inodes/), [wercsy](https://github.com/wercsy/), [mikenye](https://github.com/mikenye/), [abcd567a](https://github.com/abcd567a) and [marcelstoer](https://github.com/marcelstoer) for sharing!

Thanks to [garethhowell](https://github.com/garethhowell) for implementing the initial ADSB Exchange support and to [wiedehopf](https://github.com/wiedehopf/) for improving it.

Thanks to [rmorillo24](https://github.com/rmorillo24/) for verifying balenaFin compatibility, to [adaptive](https://github.com/adaptive/) for confirming Raspberry Pi 400 compatibility, and to [eagleDiego](https://github.com/eagleDiego) for confirming Orange Pi Zero compability.

Thanks to [schubydoo](https://github.com/schubydoo) and [Teko012](https://github.com/Teko012/) for assistance with keeping the repository up to date.

Thanks to [schubydoo](https://github.com/schubydoo), [JPGMC](https://github.com/JPGMC), and [alanb128](https://github.com/alanb128) for beta testing the UAT support.

And thanks to [Aaron Shaw (shawaj)](https://github.com/shawaj) for implementing Wingbits support, fixing bugs, and improving the code.

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
- [Part 7 – Configure RadarBox](#part-7--configure-radarbox)
  * [Alternative A: Port an existing RadarBox receiver](#alternative-a-port-an-existing-radarbox-receiver)
  * [Alternative B: Setup a new RadarBox receiver](#alternative-b-setup-a-new-radarbox-receiver)
- [Part 8 – Configure ADSB Exchange](#part-8--configure-adsb-exchange)
- [Part 9 – Configure Wingbits](#part-9--configure-wingbits)
  * [Alternative A: Port an existing Wingbits receiver](#alternative-a-port-an-existing-wingbits-receiver)
  * [Alternative B: Setup a new Wingbits receiver](#alternative-b-setup-a-new-wingbits-receiver)
- [Part 10 – Configure UAT (Optional and US only)](#part-10--configure-uat-optional-and-us-only)
- [Part 11 – Add a digital display (Optional)](#part-11--add-a-digital-display-optional)
- [Part 12 – Exploring flight traffic locally on your device](#part-12--exploring-flight-traffic-locally-on-your-device)
- [Part 13 – Advanced configuration](#part-13--advanced-configuration)
  * [Disabling specific services](#disabling-specific-services)
  * [Adaptive gain configuration](#adaptive-gain-configuration)
  * [Setting dump1090 antenna gain](#setting-dump1090-antenna-gain)
 - [Part 14 – Updating to the latest version](#part-14--updating-to-the-latest-version)

# Part 1 – Build the receiver

We'll build the receiver using the parts that are outlined on the Flightradar24, FlightAware, and RadarBox websites: 
- https://www.flightradar24.com/build-your-own
- https://flightaware.com/adsb/piaware/build
- https://www.radarbox.com/raspberry-pi

These sites suggest the Raspberry Pi 3 Model B+ as the preferred device. Still, this project runs on all the devices mentioned above. Suppose you are buying a new appliance specifically for this project. In that case, we suggest the **Raspberry Pi 4 Model B** with as much memory as possible. It's excellent value for money.

In addition to the device, you will need an RTL-SDR-compatible USB dongle. The dongles are based on a digital television tuner, and numerous types will work – both generic TV sticks and specialized ADS-B sticks (produced by FlightAware). Although both options work, the ADS-B sticks seem to perform a little better.

If you live in the US, and want to track UAT traffic in addition to ADS-B traffic, you can use two dongles in parallell. Please note that the blue FlightAware USB devices should only be used for ADS-B traffic, as they have an integrated filter optimized explicitly for the 1090 MHz frequencies. The orange FlightAware USB devices work well for tracking UAT traffic. See [Part 9 – Configure UAT (Optional and US only)](#part-9--configure-uat-optional-and-us-only) for more details.

# Part 2 – Setup balena and configure the device

[![Deploy with button](https://www.balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/ketilmo/balena-ads-b&defaultDeviceType=raspberrypi4-64)

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
 14. Next, clone the balena-ads-b repository to your local computer: `git clone git@github.com:ketilmo/balena-ads-b.git`. If you want to make changes to the repo, you can also fork it.
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
 7. **Important:** While being connected to *the same network* (either cabled or wireless) as your receiver is connected to, head to FlightAware's *[Claim Receiver](https://flightaware.com/adsb/piaware/claim)* page.
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

# Part 7 – Configure RadarBox

## Alternative A: Port an existing RadarBox receiver
If you have previously set up a RadarBox receiver and want to port it to Balena, you only have to do the following steps:

 1. Head back to the Balena dashboard and your device's page. Click on the *Device Variables*-button. Add a variable named `RADARBOX_KEY` and paste the value of your existing RadarBox key, e.g. `546b69e69b4671a742b82b10c674cdc1`. To get your key, issue the following command at your current RadarBox device: `sudo rbfeeder --showkey --no-start`.
 2. Restart the *radarbox* service under *Services* by clicking the "cycle" icon next to the service name.

## Alternative B: Setup a new RadarBox receiver
If you have not previously set up a RadarBox receiver that you want to reuse, do the following steps:

 1. Register a new [RadarBox account](https://www.radarbox.com/register). Make sure to activate it using the email that's sent to you.
 2. Head back to your device's page on the balena dashboard.
 3. Inside the *Terminal* section, click *Select a target*, then *radarbox*, and finally *Start terminal session*.
 4. This will open a terminal which lets you interact directly with your RadarBox container.
 5. At the prompt, enter `/showkey.sh`. Your RadarBox key will be displayed and look similar to this: `546b69e69b4671a742b82b10c674cdc1`.
 6. Click on the *Device Variables*-button in the left-hand menu. Add a variable named `RADARBOX_KEY` and paste the value from step 5, e.g. `546b69e69b4671a742b82b10c674cdc1`.
 7. Restart the *radarbox* service under *Services* by clicking the "cycle" icon next to the service name.
 8. Head to RadarBox's [Claim Your Raspberry Pi](https://www.radarbox.com/raspberry-pi/claim) page. Locate the input field named *Sharing Key,* and paste the value from step 5, e.g. `546b69e69b4671a742b82b10c674cdc1`.
 9. You might be asked to enter your feeder's location and altitude *above the ground.* Enter the same values you entered earlier in the `LAT` and `LON` variables. When asked for the antenna's altitude, specify it in meters (or feet) *above the ground* – NOT above sea level, as done previously. If you are not asked to enter this information, you can do it manually by clicking the *Edit* link under your receiver's ID on the left-hand side of the screen. 
 10. Finally, verify that RadarBox is receiving data from your receiver. You'll find your receiver by clicking on the *Account* menu at [radarbox.com](https://www.radarbox.com) under the *Stations* accordion. 

# Part 8 – Configure ADSB Exchange

1. Head back to your device's page on the balena dashboard. Inside the *Terminal* section, click *Select a target*, then *adsb-exchange*, and finally *Start terminal session*. This will open a terminal which lets you interact directly with your ADSB Exchange container.
2. At the prompt, type `/usr/local/share/adsbexchange-stats/create-uuid.sh` followed by return. Your ADSB-Exchange UUID is displayed. Note it down.
3. At the same prompt, type `/create-sitename.sh` followed by return. Enter a friendly name for your feeder as per the instructions on the screen (e.g. your location). Hit return and note down the result.
4. Click on the *Device Variables*-button. Add a variable named `ADSB_EXCHANGE_UUID` with the value from step 2.
5. Click on the *Device Variables*-button. Add a variable named `ADSB_EXCHANGE_SITENAME` with the value from step 3.
6. Restart the *adsb-exchange* service under *Services* by clicking the "cycle" icon next to the service names.
7. Next, wait a minute or two for the service to restart and head over to ADSB Exchange's 
[Feeder Status](https://www.adsbexchange.com/myip/) page from a PC on the same network as the feeder. Verify that your feeder is shown as registered and that ADSB Exchange is receiving your feed and MLAT data. You can also verify your feeder's performance at the [ADSB Exchange Feeder Map](https://map.adsbexchange.com/mlat-map/) by searching for your site name.

# Part 9 – Configure Wingbits

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

# Part 10 – Configure UAT (Optional and US only) 
***Please note:** The following instructions involve making low-level changes to RTL-SDR USB sticks, such as changing the serial numbers. Proceed with caution, and only if you are comfortable with the steps involved. All changes made are at your own risk.*

In the United States, aircraft can use either the ADS-B standard, which transmits at a frequency of 1090 MHz or the UAT protocol, which transmits at 978 MHz. If you live in the US and have an extra RTL-SDR dongle, you can track the UAT and ADS-B traffic. Please note that the blue FlightAware USB devices should only be used for ADS-B traffic, as they have an integrated filter optimized explicitly for the 1090 MHz frequencies. The orange FlightAware USB devices work well for tracking UAT traffic.

1. Make sure you only have one RTL-SDR stick connected to your device before executing the following steps. The connected stick should be used for regular ADS-B 1090 MHz feeding. 
2. Head to your device's *Summary* page. Click on the Device Variables-button in the left-hand menu. Add a variable named `DISABLED_SERVICES` and populate it with the values `dump1090-fa,dump978-fa`.
3. From the *Summary* page, inside the *Terminal* section, click *Select a target*, then *dump1090-fa*, and finally *Start terminal session*. This will open a terminal that lets you interact directly with your PiAware container.
4. Once the terminal prompt appears, enter `/add-serial-1090.sh`, then press return. 
5. Type `YES`, followed by return, to change your dongle's serial number. Verify that the process completes successfully.
6. Click on the *Device Variables*-button in the left-hand menu. Add a new variable named `DUMP1090_DEVICE` and set its value to `00001090`.
7. Shut down your device. When it's powered off, remove the first RTL-SDR stick from the Pi.
8. Insert the second RTL-SDR stick (the one used for UAT), leaving the first stick disconnected. Power on your device.
9. Head to your device's *Summary* page. Wait for all containers to come up with the status *Running*. Inside the *Terminal* section, click *Select a target*, then *dump978-fa*, and finally *Start terminal session*.
10. Once the terminal prompt appears, enter `/add-serial-978.sh`, then press return.
11. Type `YES`, followed by return, to change your dongle's serial number. Verify that the process completes successfully.
12. Shut down your device. When it's powered off, connect both RTL-SDR sticks.
13. Click on the *Device Variables* button in the left-hand menu. Delete the `DISABLED_SERVICES` variable.
14. Add a new variable named `UAT_ENABLED` and assign it the value `true`.
15. Power on the device. You should now be feeding ADS-B and UAT data simultaneously to the services that support it (FlightAware, RadarBox and ADSB-Exchange).

# Part 11 – Add a digital display (Optional)
balena also produces a project that can be easily configured to display a webpage in kiosk mode on a digital display called balenaDash. By dropping that project into this one, we can automatically display a feeder page directly from the Pi. Ensure you have cloned this repository recursively (`git clone --recursive {{repository URL}}`). We can then set a `LAUNCH_URL` device variable configured to connect to `http://{{YOURIP or YOURSERVICENAME}}:YOURSERVICEPORT` (where the service/port is one of the frontends above, like `http://planefinder:30053`) and that will automatically be displayed on the attached display. The balenaDash service can be configured locally by accessing the webserver on port 8081.

# Part 12 – Exploring flight traffic locally on your device
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

# Part 13 – Advanced configuration
## Disabling specific services
You can disable any of the balena-ads-b services by creating a *Device Variable* named `DISABLED_SERVICES` with the services you want to disable as comma-separated values. For example, if you want to disable the dump1090fa service, you set the `DISABLED_SERVICES` variable to `dump1090fa`. If you want to disable the dump1090fa and piaware services, you set the `DISABLED_SERVICES` variable to `dump1090fa, piaware`.

**Please note:** Due to how these services are integrated, it's not currently possible to fully disable the `wifi-connect` and `kiosk` services. However, you can stop `wifi-connect` by setting the `PORTAL_INTERFACE` variable to `lo`. Similarly, you can stop the `kiosk` service from starting by setting the `DISPLAY_NUM` variable to `&& exit 0`.

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

# Part 14 – Updating to the latest version
Updating to the latest version is trivial. If you installed balena-ads-b using the blue Deploy with balena-button, you can click it again and overwrite your current application. Choose the "Deploy to existing fleet" option, then select the fleet you want to update. All settings will be preserved. For convenience, the button is right here:

[![Deploy with button](https://www.balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/ketilmo/balena-ads-b&defaultDeviceType=raspberrypi4-64)

If you used the manual `balena push` method, pull the changes from the master branch and push the update to your application with the balena CLI. For complete instructions, look at [Part 2 – Setup balena and configure the device](#part-2--setup-balena-and-configure-the-device).

Enjoy!

![Visitors](https://api.visitorbadge.io/api/combined?path=https%3A%2F%2Fgithub.com%2Fketilmo%2Fbalena-ads-b&countColor=%23263759)
