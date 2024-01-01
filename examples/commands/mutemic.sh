#!/bin/sh

text="$(cat)"

if [ "$text" = "true" ]; then
  pamixer --source mic_denoised -m
elif [ "$text" = "false" ]; then
  pamixer --source mic_denoised -u
elif [ "$text" = "toggle" ]; then
  pamixer --source mic_denoised -t
fi
pamixer --source mic_denoised --get-mute


