# CeeS-Cntrl
CeeS Cntrl is a GUI interface to [Tubbutec's CeeS MIDI retrofit](https://tubbutec.de/cees/) for Yamaha CS5, CS10, CS15, CS15D, CS30 and CS30L synthesizers, adding MIDI input and output as well as additional filter modulation sources. The interface follows the [CeeS MIDI implementation spec](https://tubbutec.de/files/CeeS/CeeS-user-guide.pdf).

CeeS Cntrl was created with the [Cabbage Audio Framework](https://cabbageaudio.com) 2.10.0. and can run as a DAW plug-in as either AU or VST, and as a standalone app on MacOS, WinOS and Linux machines. As a DAW plug-in all controls can be automated.

An example patch:
<img width="1058" height="644" alt="screengrab of the CeeS Cntrl main interface" src="https://github.com/user-attachments/assets/31d90dbf-9562-4e99-8e33-421ff2ada482" />

Screengrab of the About CeeS Cntrl screen:
<img width="1058" height="644" alt="Shows an informational overlay" src="https://github.com/user-attachments/assets/3567673e-f0eb-4db5-9542-de57c6fb5416" />

## Beta notes:

I'm a Logic Pro user so most testing has been done on an M1 Pro MBP 32/1T Tahoe 26.2 running Logic Pro 11.2.2 with my CS-15. It would be great to see how the app performs in other environments and platforms as well as other CS models. Please post any issues or questions to this repo's [Issues](https://github.com/lfrancis/CeeS-Cntrl/issues) tracker and include your synth model, OS and DAW versions.

For the beta you must [download and install Cabbage](https://github.com/rorywalsh/cabbage/releases) on your machine, then download the `CeeSCntrl.csd` file and assets from this repository, open the `.csd` in Cabbage and export the type of app you want to use, plug-in or standalone, from Cabbage's _File_ menu. You must then copy the exported file to the appropriate location on your machine. 

**MacOS**:
* AU: The `CeeSCntrl.component` file must be placed in:
`~/Library/Audio/Plug-Ins/Components` 
* VST: The `CeeSCntrl.vst` file must be placed in:
`~/Library/Audio/Plug-Ins/VST` 

**WinOS**:
* The `CeeSCntrl.vst` file must be placed in: TBD

**Linux**: 
* The `CeeSCntrl.vst` file must be placed in:
`~/.vst`

**Tip**: If you try to run the plug-in and encounter permissions issues, go back to Cabbage and open the _Settings_ from the _Edit_ menu and make sure ad-hoc codesigning is enabled:\
<img width="612" height="590" alt="Ad-hoc codesigning settings" src="https://github.com/user-attachments/assets/451f4465-0099-4699-9c5e-66c1379f6ffc" />


## Getting Started

As seen in the About CeeS Cntrl screen, this is a patch recommendation for starting out with CeeS Cntrl. Note that only the top line of controls, plus VCA 1 and VCA 2 are employed to begin with. Such settings make your CeeS Cntrl changes more evident as you experiment and become more familiar with your CeeS MIDI retrofit. Make sure your Brilliance control is set somewhere between 50 and 100%.

<img width="949" height="290" alt="Recommended patch to begin your exploration" src="https://github.com/user-attachments/assets/627ea956-71bb-4c17-ad20-79f6291e8792" />
