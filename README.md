# CeeS-Cntrl
CeeS Cntrl is a GUI interface to [Tubbutec's CeeS MIDI retrofit](https://tubbutec.de/cees/) for Yamaha CS5, CS10, CS15, CS15D, CS30 and CS30L synthesizers, adding MIDI input and output as well as additional filter modulation sources. 

The interface follows the [CeeS MIDI controller chart](https://tubbutec.de/files/CeeS/CeeS-user-guide.pdf) and maps MIDI CC values to knobs, buttons and menus that can then be [automated in a DAW](https://youtu.be/y1mWWRdPxyk). The app is resizable and the _About CeeS Cntrl_ screen displays credits and a starter patch for easy reference. A printable version of the starter patch can be opened in your browser. Patches can be saved to the DAW host. Double-clicking a knob will reset its value to zero.

CeeS Cntrl was created with the [Cabbage Audio Framework](https://cabbageaudio.com) 2.10.0 and can run as a DAW plug-in in either AU or VST format, and as a standalone app on MacOS, WinOS and Linux machines. 

An example patch:
<img width="1060" height="743" alt="Screengrab of the CeeS Cntrl main interface" src="https://github.com/user-attachments/assets/61819d34-9f08-429c-a81f-3a8e889f4cba" />

The About CeeS Cntrl screen:
<img width="1060" height="743" alt="Shows an informational overlay" src="https://github.com/user-attachments/assets/2210c7df-3575-4ce8-b8dd-e1ac9172bfcf" />

## Beta notes:

Thanks for participating! 

I'm a Logic Pro user so development and most testing has been done on an M1 Pro MBP 32/1T Tahoe 26.2 running Logic Pro 11.2.2 with my CS-15. It would be great to see how the app performs in other environments and platforms as well as other CS models. Please post any issues or questions to this repo's [Issues](https://github.com/lfrancis/CeeS-Cntrl/issues) tracker and include your synth model, OS and DAW versions.

For the beta you must [download and install Cabbage 2.10.0](https://github.com/rorywalsh/cabbage/releases) on your machine, then [download the source code](https://github.com/lfrancis/CeeS-Cntrl/releases), extract the `CeeSCntrl.csd` file and assets, open the `.csd` in Cabbage and export the type of app you want to use, plug-in or standalone, from Cabbage's _File_ menu. You must then copy the exported file to the appropriate location on your machine. 

**MacOS**:

MacOS users need to ad-hoc code sign the plug-ins with the following Terminal command where `/path/to/YourPlugin.plugin` is replaced with the actual path to your plug-in: <br/>
`codesign --force --sign - --timestamp=none  --deep /path/to/YourPlugin.plugin`
* AU: The `CeeSCntrl.component` file must be placed in:
`~/Library/Audio/Plug-Ins/Components` or `/Library/Audio/Plug-Ins/Components`
* VST: The `CeeSCntrl.vst3` file must be placed in:
`~/Library/Audio/Plug-Ins/VST3` or `/Library/Audio/Plug-Ins/VST3` 


**WinOS**:
* The `CeeSCntrl.vst` file must be placed in: 
`C:\Program Files\VSTPlugins` or `C:\Program Files\Steinberg\VstPlugins`

**Linux**: 
* The `CeeSCntrl.vst` file must be placed in:
`~/.vst`

**Important for MAcOS Users**: 



## Getting Started

As seen in the About CeeS Cntrl screen, this is a patch recommendation for starting out with CeeS Cntrl. It takes into account how CeeS changes are additive for most of the supported controls, while subtractive for Resonance. Note that only the top line of controls, plus EG 1 and 2, are employed at start. Such settings make your CeeS Cntrl changes more evident as you experiment and become familiar with your retrofit. **Important**: Make sure your Brilliance control is set somewhere between 50 and 100%.

<img width="949" height="290" alt="Recommended patch to begin your exploration" src="https://github.com/user-attachments/assets/627ea956-71bb-4c17-ad20-79f6291e8792" />

## DAW Notes

**Logic Pro**: Export the app as an _AU MIDI Effect_ type plug-in. After launching Logic and clicking your channel strip _MIDI FX_ plug-in button, search for the app by name or drill down to the _Audio Units > CabbageAudio >_ folder. Apply this plug-in to the region hosting your CS synth MIDI track.

**Ableton Live**: Export the app as a _VST3 Synth_ type plug-in. The VST3 shows up in the _CabbageAudio_ folder and renders but currently [only the rotary controls in VCF 1 send data](https://github.com/lfrancis/CeeS-Cntrl/issues/3#issue-3913868321). 

**Reaper**: Reaper Mac sees the AU version but not the VST for some reason, so if this is your DAW then export as an _AU MIDI Effect_ type plug-in and flter plug-in view by AU.

**Bitwig**: Export the app as a _VST3 Synth_ type plug-in. The VST3 can be found in the _CabbageAudio_ folder

## Operational Tips
CeeS remembers received CC messages until they are overwritten or the synth is turned off. If you find things out of sync, save your current patch, power-cycle your CS to clear its memory, and then reload the previously saved patch to restore to a repeatable state. 
