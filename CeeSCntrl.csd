; CeeSCntrl.csd
; Copyright (C) 2026 Lewis Francis

/* This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>. */

; CeeSCntrl is a GUI interface to Tubbutec's CeeS MIDI retrofit for Yamaha CS5, CS10, CS15, CS15D, CS30 and CS30L synthesizers,
; adding MIDI input and output as well as additional filter modulation sources. https://tubbutec.de/cees/
; The MIDI implementation chart can be found at https://tubbutec.de/files/CeeS/CeeS-user-guide.pdf

; For best results your synth should be configured as follows: 
; -- Set the hardware cutoff and filter envelopes to their lowest position on your CS
; -- Set the hardware resonance to the highest positions
; -- Assign EG 2 as the envelope for both VCA and turn up the decay, sustain and release to taste 
; -- Start out with the filters set to Low Pass
; -- Place your Brilliance setting somewhere between 50 and 100%
; -- These settings make your CeeS Cntrl changes more evident as you experiment

; To do:
; First launch display of help screen?
; Consolidate SVG?
; Create some presets for different common use cases
; Test standalone
; Test VST version


<Cabbage> bounds(0, 0, 0, 0)
form caption("CeeS Cntrl") size(1010, 570) colour(0, 0, 0, 128), bundle("layout.svg", "layout_patchtext.svg", "layout_credits.svg", "layout_credits2.svg", "layout_blocker.png"), guiMode("queue") pluginId("ex01")

; VCF1
groupbox bounds(7, 8, 244, 550) channel("VCF1") colour(178, 171, 171, 128) text("VCF 1")  fontColour(255, 255, 255, 255){
rslider bounds(19, 26, 100, 100) channel("Filter1Cutoff") range(0, 127, 0, 1, 1) text("CUT OFF FREQ") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(125, 26, 100, 100) channel("Filter1Resonance") range(0, 1, 0, 1, 0.001) text("RESONANCE") textColour(0, 255, 255, 255) popupText("0")
groupbox bounds(0, 136, 244, 414) channel("ENV1")  text("ENV 1")  fontColour(255, 255, 255, 255) colour(96, 94, 94, 255)
rslider bounds(19, 160, 100, 100) channel("AttackVCF1") range(0, 127, 0, 1, 1) text("Attack") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(125, 160, 100, 100) channel("DecayVCF1") range(0, 127, 0, 1, 1) text("Decay") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(19, 268, 100, 100) channel("SustainVCF1") range(0, 127, 0, 1, 1) text("Sustain") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(125, 268, 100, 100) channel("ReleaseVCF1") range(0, 127, 0, 1, 1) text("Release") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(19, 376, 100, 100) channel("delayVCF1") range(0, 127, 0, 1, 1) text("ADSR Delay") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(125, 376, 100, 100) channel("AmountVCF1") range(0, 127, 0, 1, 1) text("ADSR Amount") textColour(0, 255, 255, 255) popupText("0")
checkbox bounds(81, 496, 31, 31) channel("Invert1CheckBox")  colour:1(0, 255, 255, 128) shape("circle") 
label bounds(31, 502, 54, 16) channel("Invert1CheckBoxLabel") text("Invert") fontStyle("plain") fontColour(0, 255, 255, 255)
checkbox bounds(133, 496, 31, 31) channel("Loop1CheckBox") colour:1(0, 255, 255, 128)  shape("circle") 
label bounds(160, 502, 54, 16) channel("Loop1CheckBoxLabel") text("Loop") fontStyle("plain") fontColour(0, 255, 255, 255)
}
; VCF2
groupbox bounds(265, 8, 244, 550) channel("VCF2") colour(140, 140, 140, 128) text("VCF 2") fontColour(255, 255, 255, 255){
rslider bounds(19, 26, 100, 100) channel("Filter2Cutoff") range(0, 127, 0, 1, 1) text("CUT OFF FREQ") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(125, 26, 100, 100) channel("Filter2Resonance") range(0, 1, 0, 1, 0.001) text("RESONANCE") textColour(0, 255, 255, 255) popupText("0")
groupbox bounds(0, 136, 244, 414) channel("ENV2")  text("ENV 2")  fontColour(255, 255, 255, 255) colour(82, 80, 80, 255)
rslider bounds(19, 160, 100, 100) channel("AttackVCF2") range(0, 127, 0, 1, 1) text("Attack") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(125, 160, 100, 100) channel("DecayVCF2") range(0, 127, 0, 1, 1) text("Decay") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(19, 268, 100, 100) channel("SustainVCF2") range(0, 127, 0, 1, 1) text("Sustain") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(125, 268, 100, 100) channel("ReleaseVCF2") range(0, 127, 0, 1, 1) text("Release") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(19, 376, 100, 100) channel("delayVCF2") range(0, 127, 0, 1, 1) text("ADSR Delay") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(125, 376, 100, 100) channel("AmountVCF2") range(0, 127, 0, 1, 1) text("ADSR Amount") textColour(0, 255, 255, 255) popupText("0")
checkbox bounds(81, 496, 31, 31) channel("Invert2CheckBox") fontColour:0(0, 255, 255, 255) colour:1(0, 255, 255, 128) fontColour:1(0, 255, 255, 255) shape("circle") 
label bounds(31, 502, 54, 16) channel("Invert2CheckBoxLabel") text("Invert") fontStyle("plain") fontColour(0, 255, 255, 255)
checkbox bounds(133, 496, 31, 31) channel("Loop2CheckBox") colour:1(0, 255, 255, 128) shape("circle")
label bounds(160, 502, 54, 16) channel("Loop2CheckBoxLabel") text("Loop") fontStyle("plain") fontColour(0, 255, 255, 255)
}
; LFO1
groupbox bounds(524, 8, 232, 335) channel("LFO1") colour(178, 171, 171, 128) text("LFO 1")  fontColour(255, 255, 255, 255)
{
combobox bounds(22, 156, 88, 20) channel("LFO1Shape") text("Triangle", "Saw", "Inverted Saw", "Square", "Random") value(1)
combobox bounds(123, 156, 88, 20) channel("LFO1Divider") text("4 Bars", "3 Bars", "2.5 Bars", "2 Bars", "1.5 Bars", "1 Bar", "3/4", "1 T", "1/2", "3/8", "1/2 T", "1/4", "3/16", "1/4 T", "1/8", "3/32", "1/8 T", "1/16", "1/32") value(18)
rslider bounds(12, 30, 100, 100) channel("LFO1Freq") range(0, 127, 0, 1, 1) text("LFO 1 Freq") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(118, 30, 100, 100) channel("LFO1Delay") range(0, 127, 0, 2.5, 1) text("LFO 1 Delay") textColour(0, 255, 255, 255) popupText("0")
label bounds(23, 198, 54, 16) channel("RetrigLabel1") text("Retrig") fontStyle("plain") fontColour(0, 255, 255, 255)
checkbox bounds(75, 190, 31, 31) channel("LFO1RetriggerBtn")  fontColour:0(0, 255, 255, 255) colour:1(0, 255, 255, 128) fontColour:1(0, 255, 255, 255) shape("circle") 
label bounds(156, 198, 45, 16) channel("SyncLabel1") text("Sync") fontStyle("plain") fontColour(0, 255, 255, 255)
checkbox bounds(126, 190, 31, 31) channel("LFO1SyncBtn")  fontColour:0(0, 255, 255, 255) colour:1(0, 255, 255, 128) fontColour:1(0, 255, 255, 255) shape("circle") 
rslider bounds(66, 226, 100, 100) channel("LFO1DepthA") range(0, 127, 0, 1, 1) text("VCF 1 Depth") textColour(0, 255, 255, 255) popupText("0")
label bounds(22, 140, 88, 16) channel("label10044") fontStyle("plain") fontColour(181, 226, 226, 255) text("LFO Shape") colour(0, 0, 0, 128)
label bounds(123, 140, 88, 16) channel("label10045") fontStyle("plain") fontColour(181, 226, 226, 255) text("Divider") colour(0, 0, 0, 128)
}
; LFO2
groupbox  channel("LFO2") colour(140, 140, 140, 128) text("LFO 2")  bounds(771, 8, 232, 335) fontColour(255, 255, 255, 255)
{
combobox bounds(22, 156, 88, 20) channel("LFO2Shape") text("Triangle", "Saw", "Inverted Saw", "Square", "Random") value(1)
combobox bounds(123, 156, 88, 20) channel("LFO2Divider") text("4 Bars", "3 Bars", "2.5 Bars", "2 Bars", "1.5 Bars", "1 Bar", "3/4", "1 T", "1/2", "3/8", "1/2 T", "1/4", "3/16", "1/4 T", "1/8", "3/32", "1/8 T", "1/16", "1/32") value(18)
rslider bounds(12, 30, 100, 100) channel("LFO2Freq") range(0, 127, 0, 1, 1) text("LFO 2 Freq") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(118, 30, 100, 100) channel("LFO2Delay") range(0, 127, 0, 2.5, 1) text("LFO 2 Delay") textColour(0, 255, 255, 255) popupText("0")
label bounds(23, 198, 54, 16) channel("RetrigLabel2") text("Retrig") fontStyle("plain") fontColour(0, 255, 255, 255)
checkbox bounds(75, 190, 31, 31) channel("LFO2RetriggerBtn")  fontColour:0(0, 255, 255, 255) colour:1(0, 255, 255, 128) fontColour:1(0, 255, 255, 255) shape("circle") 
label bounds(156, 198, 45, 16) channel("SyncLabel2") text("Sync") fontStyle("plain") fontColour(0, 255, 255, 255)
checkbox bounds(126, 190, 31, 31) channel("LFO2SyncBtn")  fontColour:0(0, 255, 255, 255) colour:1(0, 255, 255, 128) fontColour:1(0, 255, 255, 255) shape("circle") 
rslider bounds(66, 226, 100, 100) channel("LFO2DepthA") range(0, 127, 0, 1, 1) text("VCF 2 Depth") textColour(0, 255, 255, 255) popupText("0")
label bounds(22, 140, 88, 16) channel("label10046") fontStyle("plain") fontColour(181, 226, 226, 255) text("LFO Shape")  colour(0, 0, 0, 128)
label bounds(123, 140, 88, 16) channel("label10047") fontStyle("plain") fontColour(181, 226, 226, 255) text("Divider") colour(0, 0, 0, 128)
}
;Touch sensitivity controls
groupbox bounds(524, 358, 232, 197) channel("groupbox10042") text("Touch Sensing")  fontColour(255, 255, 255, 255)  colour(53, 53, 53, 255)
{
rslider bounds(12, 30, 100, 100) channel("VeloDepth") range(0, 127, 0, 1, 1) text("Velocity Depth") textColour(0, 255, 255, 255) popupText("0")
rslider bounds(118, 30, 100, 100) channel("AftertouchDepth") range(0, 127, 0, 1, 1) text("Aftertouch Depth") textColour(0, 255, 255, 255) popupText("0")
groupbox bounds(0, 135, 232, 62) channel("groupbox10043")  text("Destination") fontColour(181, 226, 226, 255) outlineColour(255, 255, 255, 128) alpha(0.8)
combobox bounds(20, 162, 80, 20) channel("VelocityMenu") text("None", "Cutoff 1", "LFO 1 depth", "LFO 1 Speed", "Cutoff 2", "LFO 2 depth", "LFO 2 speed") value(1)
combobox bounds(130, 162, 80, 20) channel("AftertouchMenu") text("None", "Cutoff 1", "LFO 1 depth", "LFO 1 Speed", "Cutoff 2", "LFO 2 depth", "LFO 2 speed") value(1)
}
; Sequencer (CS-30 only)
groupbox bounds(771, 358, 232, 148) channel("groupbox10048") text("CS-30 Sequencer")  fontColour(255, 255, 255, 255) colour(53, 53, 53, 255)
{
label bounds(70, 39, 88, 16) channel("label10048") fontColour(181, 226, 226, 255) text("Divider") colour(0, 0, 0, 128)
combobox bounds(70, 55, 88, 20) channel("SeqDivider") text("4 Bars", "3 Bars", "2.5 Bars", "2 Bars", "1.5 Bars", "1 Bar", "3/4", "1 T", "1/2", "3/8", "1/2 T", "1/4", "3/16", "1/4 T", "1/8", "3/32", "1/8 T", "1/16", "1/32") value(18)
label bounds(70, 86, 88, 16) channel("label10052") fontColour(181, 226, 226, 255) text("Sync") colour(0, 0, 0, 128)
combobox bounds(70, 102, 88, 20) channel("SeqSync") text("Internal", "MIDI Clock", "Midi Note") value(1) 
}
; Resize control + overlay toggle button
groupbox bounds(771, 510, 232, 60) channel("groupbox10073") lineThickness(0), fontColour(0, 0, 0, 128), outlineThickness(0) outlineColour(238, 238, 238, 255) 8, 255) 
{
combobox bounds(100, 0, 80, 20), mode("resize"), value(3)
label bounds(18, 1, 112, 16) channel("ResizeLabel") text("Resize:")
button bounds(20, 24, 194, 24) channel("AboutCeeSCntrl") text("About CeeS Cntrl", "Close") colour:0(63, 61, 61, 255)

}
; About CeeS overlay
groupbox bounds(20, 20, 970, 513), channel("AboutBackground"), text("About CeeS Cntrl") colour(255, 255, 255, 255), lineThickness(0), fontColour(0, 0, 0, 128), visible(0), alpha(.96)  outlineThickness(5) outlineColour(238, 238, 238, 255) 8, 255) 
{
image bounds(4, 20, 960, 280), file("layout.svg"), channel("InitLayoutPanel"), visible(0) colour(115, 112, 112, 255) 
image bounds(20, 310, 920, 80), file("layout_patchtext.svg"), channel("InitLayoutPanelB"), visible(0) colour(115, 112, 112, 255) 
image bounds(20, 405, 800, 60), file("layout_credits.svg"), channel("InitLayoutPanelC"), visible(0) colour(115, 112, 112, 255) 
;image bounds(254, 476, 500, 30), file("layout_credits2.svg"), channel("InitLayoutPanelD"), visible(0) colour(115, 112, 112, 255) 
image bounds(754, 392, 212, 236), file("layout_blocker.png"), channel("InitLayoutPanelE"), visible(0) colour(178, 171, 171, 128), alpha(.0)
infobutton bounds(769, 480, 194, 24) channel("PrintPatchSheet") file("index.html") text("Print patch sheet"), visible(0), colour:1(63, 61, 61, 255)
}

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d -Q0 -raw_controller_mode=1
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

massign 0, 0 ; Stop MIDI from auto-triggering instruments
 
instr MIDIOUT
; Captures incoming MIDI
    kStatus, kChan, kData1, kData2 midiin
    
; Immediately sends it back out to the host/external device
    midiout kStatus, kChan, kData1, kData2

; Filter 1
    kCtrl71 chnget "Filter1Cutoff"
    kCtrl72 chnget "Filter1Resonance"
    kCtrl73 chnget "LFO1DepthA"
    kCtrl74 chnget "LFO2DepthA"
    kCtrl75 chnget "AttackVCF1"
    kCtrl76 chnget "DecayVCF1"
    kCtrl77 chnget "SustainVCF1"
    kCtrl78 chnget "ReleaseVCF1"
    kCtrl79 chnget "delayVCF1"
    kCtrl80 chnget "AmountVCF1"
    kCtrl81 chnget "Invert1CheckBox"
    kCtrl82 chnget "Loop1CheckBox"
; Setup checkbox toggles
    kCtrl81 = kCtrl81 * 64 ; Makes sure value is either 0 or 64
    kCtrl82 = kCtrl82 * 64

; Filter 2
    kCtrl87 chnget "Filter2Cutoff"
    kCtrl88 chnget "Filter2Resonance"
    kCtrl89 chnget "LFO1DepthB"
    kCtrl90 chnget "LFO2DepthB"
    kCtrl91 chnget "AttackVCF2"
    kCtrl92 chnget "DecayVCF2"
    kCtrl93 chnget "SustainVCF2"
    kCtrl94 chnget "ReleaseVCF2"
    kCtrl95 chnget "delayVCF2"
    kCtrl96 chnget "AmountVCF2"
    kCtrl97 chnget "Invert2CheckBox"
    kCtrl98 chnget "Loop2CheckBox"
; Setup checkbox toggles    
    kCtrl97 = kCtrl97 * 64
    kCtrl98 = kCtrl98 * 64

; LFO 1    
    kCtrl103 chnget "LFO1Shape"
    kCtrl104 chnget "LFO1Freq"
    kCtrl105 chnget "LFO1Divider"   
    kCtrl106 chnget "LFO1Delay"
    kCtrl107 chnget "LFO1RetriggerBtn"
    kCtrl108 chnget "LFO1SyncBtn"
; Setup checkbox toggles 
    kCtrl107 = kCtrl107 * 64
    kCtrl108 = kCtrl108 * 64
 
; LFO2    
    kCtrl109 chnget "LFO2Shape"
    kCtrl110 chnget "LFO2Freq"
    kCtrl111 chnget "LFO2Divider"
    kCtrl112 chnget "LFO2Delay"
    kCtrl113 chnget "LFO2RetriggerBtn"
    kCtrl114 chnget "LFO2SyncBtn"
; Setup checkbox toggles 
    kCtrl113 = kCtrl113 * 64
    kCtrl114 = kCtrl114 * 64

; Touch Sensing    
    kCtrl83 chnget "VeloDepth"
    kCtrl84 chnget "AftertouchDepth"
    kCtrl85 chnget "VelocityMenu"
    kCtrl86 chnget "AftertouchMenu"
     
; Seq (CS-30)  
    kCtrl115 chnget "SeqDivider"
    kCtrl116 chnget "SeqSync"
    
; Define i-rate variables for the clock divider target CC values
    i1DivVal = 6
    i2DivVal = 13
    i3DivVal = 20
    i4DivVal = 27
    i5DivVal = 34
    i6DivVal = 41
    i7DivVal = 48
    i8DivVal = 55
    i9DivVal = 62
    i10DivVal = 69
    i11DivVal = 76
    i12DivVal = 83
    i13DivVal = 90
    i14DivVal = 97
    i15DivVal = 104
    i16DivVal = 111
    i17DivVal = 118
    i18DivVal = 125
    i19DivVal = 127
    
; Define i-rate variables for the LFO Shape target CC values
    i1LFOSHAPEVal = 25
    i2LFOSHAPEVal = 51
    i3LFOSHAPEVal = 77
    i4LFOSHAPEVal = 103
    i5LFOSHAPEVal = 127   

; Define i-rate variables for the touch sensing target CC values
    i1TouchDestVal = 18
    i2TouchDestVal = 37
    i3TouchDestVal = 56
    i4TouchDestVal = 75
    i5TouchDestVal = 94
    i6TouchDestVal = 113
    i7TouchDestVal = 127

; Define i-rate variables for the sequencer sync target CC values
    i1SyncSourceVal = 42
    i2SyncSourceVal = 85
    i3SyncSourceVal = 127


; Filter 1
    if changed(kCtrl71) == 1 then
        midiout	176, 1, 16, kCtrl71
    endif 
    if changed(kCtrl72) == 1 then
; Invert the 0.0 to 1.0 Resonance range
    kInverted = 1 - kCtrl72   
; Scale Resonance MIDI range (0 to 127)
    kMidiVal = int(kInverted * 127)
    midiout 176, 1, 18, kMidiVal
    endif
    if changed(kCtrl73) == 1 then
        midiout	176, 1, 20, kCtrl73
    endif
    if changed(kCtrl74) == 1 then
        midiout	176, 1, 27, kCtrl74
    endif   
    if changed(kCtrl75) == 1 then
        midiout	176, 1, 42, kCtrl75
    endif   
    if changed(kCtrl76) == 1 then
        midiout	176, 1, 43, kCtrl76
    endif   
    if changed(kCtrl77) == 1 then
        midiout	176, 1, 44, kCtrl77
    endif   
    if changed(kCtrl78) == 1 then
        midiout	176, 1, 45, kCtrl78
    endif   
    if changed(kCtrl79) == 1 then
        midiout	176, 1, 41, kCtrl79
    endif   
    if changed(kCtrl80) == 1 then
        midiout	176, 1, 40, kCtrl80
    endif   
    if changed(kCtrl81) == 1 then
        midiout	176, 1, 47, kCtrl81
    endif   
    if changed(kCtrl82) == 1 then
        midiout	176, 1, 46, kCtrl82
    endif  
    
; Touch Sensing 
    if changed(kCtrl83) == 1 then
        midiout	176, 1, 38, kCtrl83
    endif   
    if changed(kCtrl84) == 1 then
        midiout	176, 1, 39, kCtrl84
    endif   
    if changed(kCtrl85) == 1 then
; Map the index of the Velo Destination menus
    kCCValue init 0
    if kCtrl85 == 1 then
        kCCValue = i1TouchDestVal
    elseif kCtrl85 == 2 then
        kCCValue = i2TouchDestVal
    elseif kCtrl85 == 3 then
        kCCValue = i3TouchDestVal
    elseif kCtrl85 == 4 then
        kCCValue = i4TouchDestVal
    elseif kCtrl85 == 5 then
        kCCValue = i5TouchDestVal
    elseif kCtrl85 == 6 then
        kCCValue = i5TouchDestVal
    elseif kCtrl85 == 7 then
        kCCValue = i7TouchDestVal
    endif
        midiout	176, 1, 36, kCCValue
    endif   
    if changed(kCtrl86) == 1 then
; Map the index of the Velo Destination menus
    kCCValue init 0
    if kCtrl86 == 1 then
        kCCValue = i1TouchDestVal
    elseif kCtrl86 == 2 then
        kCCValue = i2TouchDestVal
    elseif kCtrl86 == 3 then
        kCCValue = i3TouchDestVal
    elseif kCtrl86 == 4 then
        kCCValue = i4TouchDestVal
    elseif kCtrl86 == 5 then
        kCCValue = i5TouchDestVal
    elseif kCtrl86 == 6 then
        kCCValue = i6TouchDestVal
    elseif kCtrl86 == 7 then
        kCCValue = i7TouchDestVal
    endif
       midiout	176, 1, 37, kCCValue
    endif  
        
; Filter 2        
    if changed(kCtrl87) == 1 then
        midiout	176, 1, 17, kCtrl87
    endif
    if changed(kCtrl88) == 1 then
; Invert the 0.0 to 1.0 Resonance range
    kInverted = 1 - kCtrl88
; Scale Resonance to MIDI range (0 to 127)
    kMidiVal = int(kInverted * 127)
    midiout 176, 1, 18, kMidiVal
    endif
    if changed(kCtrl89) == 1 then
        midiout	176, 1, 20, kCtrl89
    endif
    if changed(kCtrl90) == 1 then
        midiout	176, 1, 27, kCtrl90
    endif   
    if changed(kCtrl91) == 1 then
        midiout	176, 1, 50, kCtrl91
    endif   
    if changed(kCtrl92) == 1 then
        midiout	176, 1, 51, kCtrl92
    endif   
    if changed(kCtrl93) == 1 then
        midiout	176, 1, 52, kCtrl93
    endif   
    if changed(kCtrl94) == 1 then
        midiout	176, 1, 53, kCtrl94
    endif   
    if changed(kCtrl95) == 1 then
        midiout	176, 1, 49, kCtrl95
    endif   
    if changed(kCtrl96) == 1 then
        midiout	176, 1, 48, kCtrl96
    endif   
    if changed(kCtrl97) == 1 then
        midiout	176, 1, 55, kCtrl97
    endif   
    if changed(kCtrl98) == 1 then
        midiout	176, 1, 54, kCtrl98
    endif   
    
; LFO1
   if changed(kCtrl103) == 1 then
; Map the index of the LFO Shape menus
    kCCValue init 0
    if kCtrl103 == 1 then
        kCCValue = i1LFOSHAPEVal
    elseif kCtrl103 == 2 then
        kCCValue = i2LFOSHAPEVal
    elseif kCtrl103 == 3 then
        kCCValue = i3LFOSHAPEVal
    elseif kCtrl103 == 4 then
        kCCValue = i4LFOSHAPEVal
    elseif kCtrl103 == 5 then
        kCCValue = i5LFOSHAPEVal
    endif 
        midiout	176, 1, 21, kCCValue
    endif  
    if changed(kCtrl104) == 1 then
        midiout	176, 1, 22, kCtrl104
    endif
    if changed(kCtrl105) == 1 then
; Map the index of the Clock Divider menus
    kCCValue init 0
    if kCtrl105 == 1 then 
        kCCValue = i1DivVal
    elseif kCtrl105 == 2 then
        kCCValue = i2DivVal
    elseif kCtrl105 == 3 then
        kCCValue = i3DivVal
    elseif kCtrl105 == 4 then
        kCCValue = i4DivVal
    elseif kCtrl105 == 5 then
        kCCValue = i5DivVal
    elseif kCtrl105 == 6 then
        kCCValue = i6DivVal
    elseif kCtrl105 == 7 then
        kCCValue = i7DivVal
    elseif kCtrl105 == 8 then 
        kCCValue = i8DivVal
    elseif kCtrl105 == 9 then
        kCCValue = i9DivVal
    elseif kCtrl105 == 10 then
        kCCValue = i10DivVal
    elseif kCtrl105 == 11 then
        kCCValue = i11DivVal
    elseif kCtrl105 == 12 then
        kCCValue = i12DivVal
    elseif kCtrl105 == 13 then
        kCCValue = i13DivVal
    elseif kCtrl105 == 14 then
        kCCValue = i14DivVal
    elseif kCtrl105 == 15 then
        kCCValue = i15DivVal
    elseif kCtrl105 == 16 then
        kCCValue = i16DivVal
    elseif kCtrl105 == 17 then
        kCCValue = i17DivVal
    elseif kCtrl105 == 18 then
        kCCValue = i18DivVal
    elseif kCtrl105 == 19 then
        kCCValue = i19DivVal
    endif
        midiout	176, 1, 23, kCCValue
    endif  
    if changed(kCtrl106) == 1 then
        midiout	176, 1, 24, kCtrl106
    endif  
    if changed(kCtrl107) == 1 then
        midiout	176, 1, 25, kCtrl107
    endif  
    if changed(kCtrl108) == 1 then
        midiout	176, 1, 26, kCtrl108
    endif  
    
; LFO2
    if changed(kCtrl109) == 1 then
; Map the index of the LFO Shape menus
    kCCValue init 0
    if kCtrl103 == 1 then
        kCCValue = i1LFOSHAPEVal
    elseif kCtrl103 == 2 then
        kCCValue = i2LFOSHAPEVal
    elseif kCtrl103 == 3 then
        kCCValue = i3LFOSHAPEVal
    elseif kCtrl103 == 4 then
        kCCValue = i4LFOSHAPEVal
    elseif kCtrl103 == 5 then
        kCCValue = i5LFOSHAPEVal
    endif         
        midiout	176, 1, 28, kCCValue
    endif  
    if changed(kCtrl110) == 1 then
        midiout	176, 1, 29, kCtrl110
    endif  
    if changed(kCtrl111) == 1 then
; Map the index of the Clock Divider menus
    kCCValue init 0
    if kCtrl111 == 1 then 
        kCCValue = i1DivVal
    elseif kCtrl111 == 2 then
        kCCValue = i2DivVal
    elseif kCtrl111 == 3 then
        kCCValue = i3DivVal
    elseif kCtrl111 == 4 then
        kCCValue = i4DivVal
    elseif kCtrl111 == 5 then
        kCCValue = i5DivVal
    elseif kCtrl111 == 6 then
        kCCValue = i6DivVal
    elseif kCtrl111 == 7 then
        kCCValue = i7DivVal
    elseif kCtrl111 == 8 then 
        kCCValue = i8DivVal
    elseif kCtrl111 == 9 then
        kCCValue = i9DivVal
    elseif kCtrl111 == 10 then
        kCCValue = i10DivVal
    elseif kCtrl111 == 11 then
        kCCValue = i11DivVal
    elseif kCtrl111 == 12 then
        kCCValue = i12DivVal
    elseif kCtrl111 == 13 then
        kCCValue = i13DivVal
    elseif kCtrl111 == 14 then
        kCCValue = i14DivVal
    elseif kCtrl111 == 15 then
        kCCValue = i15DivVal
    elseif kCtrl111 == 16 then
        kCCValue = i16DivVal
    elseif kCtrl111 == 17 then
        kCCValue = i17DivVal
    elseif kCtrl111 == 18 then
        kCCValue = i18DivVal
    elseif kCtrl111 == 19 then
        kCCValue = i19DivVal
    endif
        midiout	176, 1, 30, kCCValue
    endif  
    if changed(kCtrl112) == 1 then
        midiout	176, 1, 31, kCtrl112
    endif  
    if changed(kCtrl113) == 1 then
        midiout	176, 1, 32, kCtrl113
    endif  
    if changed(kCtrl114) == 1 then
        midiout	176, 1, 33, kCtrl114
    endif  
 
; Seq (CS-30)      
     if changed(kCtrl115) == 1 then
; Map the index of the Clock Divider menus
    kCCValue init 0
    if kCtrl115 == 1 then 
        kCCValue = i1DivVal
    elseif kCtrl115 == 2 then
        kCCValue = i2DivVal
    elseif kCtrl115 == 3 then
        kCCValue = i3DivVal
    elseif kCtrl115 == 4 then
        kCCValue = i4DivVal
    elseif kCtrl115 == 5 then
        kCCValue = i5DivVal
    elseif kCtrl115 == 6 then
        kCCValue = i6DivVal
    elseif kCtrl115 == 7 then
        kCCValue = i7DivVal
    elseif kCtrl115 == 8 then 
        kCCValue = i8DivVal
    elseif kCtrl115 == 9 then
        kCCValue = i9DivVal
    elseif kCtrl115 == 10 then
        kCCValue = i10DivVal
    elseif kCtrl115 == 11 then
        kCCValue = i11DivVal
    elseif kCtrl115 == 12 then
        kCCValue = i12DivVal
    elseif kCtrl115 == 13 then
        kCCValue = i13DivVal
    elseif kCtrl115 == 14 then
        kCCValue = i14DivVal
    elseif kCtrl115 == 15 then
        kCCValue = i15DivVal
    elseif kCtrl115 == 16 then
        kCCValue = i16DivVal
    elseif kCtrl115 == 17 then
        kCCValue = i17DivVal
    elseif kCtrl115 == 18 then
        kCCValue = i18DivVal
    elseif kCtrl115 == 19 then
        kCCValue = i19DivVal
    endif
        midiout	176, 1, 35, kCCValue
    endif  
   if changed(kCtrl116) == 1 then 
; Map the index of the select menus
    kCCValue init 0
    if kCtrl116 == 1 then
        kCCValue = i1SyncSourceVal
    elseif kCtrl116 == 2 then
        kCCValue = i2SyncSourceVal
    elseif kCtrl116 == 3 then
        kCCValue = i3SyncSourceVal
    endif
        midiout	176, 1, 34, kCCValue
    endif 
; Show the About CeeS Cntrl screen  
; Read the button state (0 or 1)
    kInfoState cabbageGetValue "AboutCeeSCntrl"
; Update visibility only when the state changes
    if changed(kInfoState) == 1 then
        cabbageSet 1, "InitLayoutPanel", sprintfk("visible(%d)", kInfoState)
        cabbageSet 1, "InitLayoutPanelB", sprintfk("visible(%d)", kInfoState)
        cabbageSet 1, "InitLayoutPanelC", sprintfk("visible(%d)", kInfoState)
        cabbageSet 1, "InitLayoutPanelD", sprintfk("visible(%d)", kInfoState)
        cabbageSet 1, "InitLayoutPanelE", sprintfk("visible(%d)", kInfoState)
        cabbageSet 1, "PrintPatchSheet", sprintfk("visible(%d)", kInfoState)
        cabbageSet 1, "AboutBackground", sprintfk("visible(%d)", kInfoState)
    endif
endin
</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
