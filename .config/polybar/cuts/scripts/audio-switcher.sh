# =============================================================================
# VERSIÓN ALTERNATIVA SIN CONFIRMACIÓN
# =============================================================================
# Si prefieres cambiar directamente sin confirmación, usa este script:

#!/usr/bin/env bash

# Directorio de temas de rofi
dir="~/.config/polybar/cuts/scripts/rofi"
rofi_command="rofi -no-config -theme $dir/powermenu.rasi"

# Obtener dispositivos actuales
current_sink=$(pactl get-default-sink)
current_source=$(pactl get-default-source)

# Función para obtener nombre amigable del dispositivo
get_device_name() {
    case $1 in
        *"usb-Generic_Blue_Microphones"*)
            echo "Blue Audio"
            ;;
        *"pci-0000_00_1f.3"*)
            echo "Onboard"
            ;;
        *"pci-0000_01_00.1.hdmi"*)
            echo "HDMI"
            ;;
        *)
            echo "Unknown"
            ;;
    esac
}

current_sink_name=$(get_device_name "$current_sink")
current_source_name=$(get_device_name "$current_source")

# Opciones del menú
output_blue="🎧 Blue Headphones"
output_onboard="🔊 Onboard Audio"
output_hdmi="🖥️ HDMI Audio"
input_blue="🎤 Blue Microphone"
input_onboard="🎙️ Onboard Microphone"

# Opciones del menú principal
options="$output_blue\n$output_onboard\n$output_hdmi\n$input_blue\n$input_onboard"

# Mostrar menú
chosen="$(echo -e "$options" | $rofi_command -p "Out: $current_sink_name | In: $current_source_name" -dmenu -selected-row 0)"

# Procesar selección sin confirmación
case $chosen in
    "$output_blue")
        pactl set-default-sink alsa_output.usb-Generic_Blue_Microphones_LT_2107070014374D02021A_111000-00.analog-stereo
        notify-send "Audio Output" "Switched to Blue Headphones" -i audio-headphones
        ;;
    "$output_onboard")
        pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo
        notify-send "Audio Output" "Switched to Onboard Audio" -i audio-speakers
        ;;
    "$output_hdmi")
        pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo
        notify-send "Audio Output" "Switched to HDMI Audio" -i video-display
        ;;
    "$input_blue")
        pactl set-default-source alsa_input.usb-Generic_Blue_Microphones_LT_2107070014374D02021A_111000-00.analog-stereo
        notify-send "Audio Input" "Switched to Blue Microphone" -i audio-input-microphone
        ;;
    "$input_onboard")
        pactl set-default-source alsa_input.pci-0000_00_1f.3.analog-stereo
        notify-send "Audio Input" "Switched to Onboard Microphone" -i audio-input-microphone
        ;;
esac
