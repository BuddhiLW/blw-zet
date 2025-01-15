---
title: "Switch Headset Profile Programmatically "
description: "My Bluetooth-headset has two profiles."
published: "2024-08-14"
image: "images/image-post-143.png"
draft: false
---

# Switch Headset Profile Programmatically 

My Bluetooth-headset (as most headsets currently, I suppose) has two profiles:

a) Headset Unit (Microphone + Speaker);
b) High Fidelity Playback (Speaker).

So, this is how you can programmatically switch it, using (pipewire install):

``` bash
#!/usr/bin/bash

# Define the file to store the state
STATE_FILE="$HOME/.audio_profile_state"

# Check if the state file exists, if not create it with the default state
if [ ! -f "$STATE_FILE" ]; then
    echo "a2dp-sink" > "$STATE_FILE"
fi

# Read the current state
state=$(cat "$STATE_FILE")

# Get the CARD_INDEX for the Bluetooth device
CARD_INDEX=$(pactl list short cards | grep -i "bluez" | cut -f1)

# Switch the state
if [ "$state" == "a2dp-sink" ]; then
    new_state="headset-head-unit"
else
    new_state="a2dp-sink"
fi

# Apply the new state
pactl set-card-profile "$CARD_INDEX" "$new_state"

# Save the new state to the file
echo "$new_state" > "$STATE_FILE"
```

The `a2dp-sink` and `headset-head-unit` states were determined (their naming), by using the following command to learn more about the devices etc.

``` bash
pactl list cards
```

``` 
Card #97
	Name: bluez_card.<card-id>
	Driver: module-bluez5-device.c
	Owner Module: n/a
	Properties:
		api.bluez5.address = "<card-id>"
    (...)
	Profiles:
		off: Off (sinks: 0, sources: 0, priority: 0, available: yes)
		headset-head-unit: Headset Head Unit (HSP/HFP) (sinks: 1, sources: 1, priority: 1, available: yes)
		a2dp-sink-sbc: High Fidelity Playback (A2DP Sink, codec SBC) (sinks: 1, sources: 0, priority: 18, available: yes)
		a2dp-sink-sbc_xq: High Fidelity Playback (A2DP Sink, codec SBC-XQ) (sinks: 1, sources: 0, priority: 17, available: yes)
		a2dp-sink: High Fidelity Playback (A2DP Sink, codec aptX) (sinks: 1, sources: 0, priority: 19, available: yes)
		headset-head-unit-cvsd: Headset Head Unit (HSP/HFP, codec CVSD) (sinks: 1, sources: 1, priority: 2, available: yes)
		headset-head-unit-msbc: Headset Head Unit (HSP/HFP, codec mSBC) (sinks: 1, sources: 1, priority: 3, available: yes)
	Active Profile: a2dp-sink
	Ports:
  (...)
```


