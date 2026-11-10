# ------------------------------------------------------------------------------
# Copyright (C) 2020-2026 Aditya Shakya <adi1090x@gmail.com>
#
# Default Theme
# ------------------------------------------------------------------------------

# Colors
background='#10131A'
foreground='#E8EDF4'
color0='#1A1F29'
color1='#FF4D5E'
color2='#22D67A'
color3='#FFB020'
color4='#3D8BFF'
color5='#C05CFF'
color6='#12D6D6'
color7='#DCE3ED'
color8='#2A3240'
color9='#FF7280'
color10='#4AE89A'
color11='#FFC65C'
color12='#6BA6FF'
color13='#D68CFF'
color14='#4FE8E8'
color15='#F2F5F9'

accent='#3D8BFF'
light_value='0.05'
dark_value='0.30'

# Wallpaper
wdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
wallpaper="$wdir/wallpaper"

# Polybar
polybar_font='SF Pro Text:style=Medium:size=10;3'

# Rofi
rofi_font='SF Pro Text Medium 11'
rofi_icon='Arc-Circle'

# Terminal
terminal_font_name='SF Mono'
terminal_font_size='10'

# Geany
geany_colors='arc.conf'
geany_font='SF Mono 10'

# Appearance
gtk_font='SF Pro Text Medium 11'
gtk_colors='prefer-dark'
gtk_theme='Arc-Dark'
icon_theme='Arc-Circle'
cursor_theme='Qogirr'

# Dunst
dunst_width='300'
dunst_height='80'
dunst_offset='10x42'
dunst_origin='top-right'
dunst_font='SF Pro Text Medium 11'
dunst_border='1'
dunst_separator='1'

# Picom
picom_backend='glx'
picom_corner='0'
picom_shadow_r='20'
picom_shadow_o='0.60'
picom_shadow_x='-20'
picom_shadow_y='-20'
picom_blur_method='none'
picom_blur_strength='0'

# Bspwm
bspwm_fbc="$accent"
bspwm_nbc="$background"
bspwm_abc="$color5"
bspwm_pfc="$color2"
bspwm_border='1'
bspwm_gap='10'
bspwm_sratio='0.50'
