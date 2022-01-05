array set ::pd_colors {
selected "#00f"
signal_iolet "#558"
msg_iolet "#fff"
obj_box_outline "#ccc"
obj_box_fill "#f6f8f8"
msg_box_outline "#ccc"
msg_box_fill "#f8f8f6"
atom_box_outline "#ccc"
atom_box_fill "#eee"

graph_outline "#777"
msg_cord "#121"
signal_cord "#558"
obj_box_outline_broken "#f00"
canvas_fill "white"

}
set ::pd_colors(signal_iolet_border) $::pd_colors(signal_cord)
set ::pd_colors(msg_iolet_border) $::pd_colors(msg_cord)
set ::pd_colors(atom_box_focus_outline) $::pd_colors(atom_box_outline)
set ::pd_colors(array_name) $::pd_colors(graph_outline)