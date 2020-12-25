# Info
- https://forums.developer.nvidia.com/t/x-freezes-nvidia-gpu-0-wait/70356/3
sudo nvim /usr/share/X11/xorg.conf.d/10-nvidia.conf

```bash
Section "OutputClass"
    Identifier     "nvidia-prime"
    MatchDriver    "nvidia-drm"
    Driver         "nvidia"
    Option         "metamodes" "DVI-D-0: nvidia-auto-select +0+0 {ForceCompositionPipeline=On}"
    Option         "UseNvKmsCompositionPipeline" "false"
    Option         "PrimaryGPU" "true"
    Option         "AllowEmptyInitialConfiguration" "true"
    #Option         "AllowIndirectGLXProtocol" "off"
    #Option         "TripleBuffer" "on"
EndSection
```

orig

```bash
Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Driver "nvidia"
    Option "AllowEmptyInitialConfiguration"
    ModulePath "/usr/lib/x86_64-linux-gnu/nvidia/xorg"
EndSection
```

# выставить максимльную производительность

- https://rastating.github.io/how-to-permanently-set-nvidia-powermizer-settings-in-ubuntu/

```bash
nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1"
nvidia-settings -q GpuPowerMizerMode
```

ubuntu-drivers devices

#### troubleshooting

https://wiki.archlinux.org/index.php/NVIDIA/Troubleshooting

# регулировка скорости fan speed nvidia linux
sudo nvim /usr/share/X11/xorg.conf.d/10-nvidia.conf

```bash
Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Driver "nvidia"
    Option "AllowEmptyInitialConfiguration"
    Option "Coolbits" "28"
    ModulePath "/usr/lib/x86_64-linux-gnu/nvidia/xorg"
EndSection
```

nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=99" --  :0 -once
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:1]/GPUTargetFanSpeed=99" --  :0 -once

# выключить
nvidia-settings -a "[gpu:0]/GPUFanControlState=0" -- :0 -once

И делаем logout
