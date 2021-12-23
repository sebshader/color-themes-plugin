array set ::pd_colors {
selected "#fda428"
selection_rectangle "#fda428"

txt_highlight "#bebebe"
txt_highlight_front "#0e5ccd"

signal_iolet "#0000ff"
signal_iolet_border "#0000ff"
msg_iolet "#dddddd"
msg_iolet_border "#dddddd"

obj_box_outline "#dddddd"
obj_box_fill "#1d1d1d"
obj_box_text "#ffffff"

msg_box_outline "#dddddd"
msg_box_fill "#1d1d1d"
msg_box_text "#ffffff"

atom_box_outline "#dddddd"
atom_box_fill "#1d1d1d"
atom_box_text "#ffffff"
atom_box_label "#ffffff"

msg_cord "#dddddd"
signal_cord "#0000ff"

obj_box_outline_broken "#ff0000"
canvas_fill "#1d1d1d"

comment "#ffffff"

graph_outline "#ffffff"
graph_text "#ffffff"

array_name "#ffffff"
array_values "#0000ff"

gop_box "#ff8080"

text_window_fill "#1d1d1d"
text_window_text "#ffffff"
text_window_highlight "#ffa500"
text_window_cursor "#fda428"
canvas_text_cursor "#fda428"

pdwindow_fill "#1d1d1d"
pdwindow_fatal_text "#dd0000"
pdwindow_fatal_highlight "#ffe0e8"
pdwindow_error_text "#dd0000"
pdwindow_post_text "#ffffff"
pdwindow_debug_text "#808080"

helpbrowser_fill "#1d1d1d"
helpbrowser_text "#ffffff"
helpbrowser_highlight "#0000ff"
}
set ::pd_colors(atom_box_focus_outline) $::pd_colors(atom_box_outline)
