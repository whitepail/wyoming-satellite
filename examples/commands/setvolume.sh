#!/bin/sh

text="$(cat)"

if [ "${text:0:1}" = "+" ]; then
  pamixer --sink alsa_output.hw_0_2 -i ${text:1}
elif [ "${text:0:1}" = "-" ]; then
  pamixer --sink alsa_output.hw_0_2 -d ${text:1}
elif [ ! "$text" = "" ]; then
  pamixer --sink alsa_output.hw_0_2 --set-volume $text
fi
pamixer --sink alsa_output.hw_0_2 --get-volume


