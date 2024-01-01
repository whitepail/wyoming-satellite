#!/bin/sh
pactl set-source-volume mics 100% 100% 100% 100% 100% 100%	
pactl set-sink-volume alsa_output.hw_0_2 50%
script/run --name $(cat /sys/class/net/wlan0/address | awk '{print "Nafanya_"substr($1,13,2)"_"substr($1,16,2)}') \
--uri "tcp://0.0.0.0:10700" --mic-command "parecord --format=s16le --channels=1 -d mic_denoised -r --rate=16000 --raw" \
--snd-command "paplay --device=alsa_output.hw_0_2 --format=s16le --rate=22050 --channels=1 --raw" --debug --vad \
--wake-uri "tcp://localhost:10400" --wake-word "nafanya" --done-wav ./sounds/done.wav --vad \
--event-uri 'tcp://127.0.0.1:10500' --mic-mute-command './mutemic.sh' \
--volume-set-command './setvolume.sh'

