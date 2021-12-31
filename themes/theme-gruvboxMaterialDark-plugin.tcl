# theme from https://github.com/Eric-Lennartson/pd-themes
# canvas_fill - the canvas (patch background)
# canvas_text_cursor - text insertion cursor for all canvas objects
# gop_box - the GOP rectangle (when editing GOP patches)
# obj_box_text - text in an object box
# msg_box_text - text in a message box
# comment
# selected - selection
# obj_box_outline_broken - outline of "broken" object 
#                          (that failed to create)
# obj_box_outline
# msg_box_outline
# msg_box_fill - fill of a message box
# obj_box_fill - " " object box
# signal_cord - signal cord and outline of signal inlets
# msg_cord - message cord and outline of message inlets
# msg_iolet - message inlet/outlet fill
# signal_iolet - signal inlet/outlet fill
# graph_outline - outline of arrays and GOP patches in the parent patch
# graph_text - color of the names of GOP patches in the parent patch
# selection_rectangle - selection rectangle color in edit mode
# txt_highlight - color text is highlighted (in the "background") when selected
# array_name - garray names
# array_values - array elements
# atom_box_fill - fill of gatoms (number box, symbol box)
# atom_box_text - text of gatoms
# atom_box_label - label of gatoms
# atom_box_outline - outline of gatoms
# text_window_fill - [text] window background
# text_window_text - [text] window text
# text_window_highlight - like txt_highlight but for [text] window
# text_window_cursor - [text] window cursor
# pdwindow_fill - background of post window
# pdwindow_fatal_text - text for fatal errors
# pdwindow_fatal_highlight - highlight (background) for fatal errors
# pdwindow_error_text - text for errors
# pdwindow_post_text - text for posting
# pdwindow_debug_text - text for verbose logs
# helpbrowser_fill
# helpbrowser_text
# helpbrowser_highlight - like txt_highlight but for help browser

# gruvbox
array set ::pd_colors {
    gop_box 		         "#b85651"

    canvas_fill 		     "#32302f"
    pdwindow_fill 		     "#32302f"
    helpbrowser_fill 	     "#32302f"
    text_window_fill 	     "#32302f"

    obj_box_text 		     "#a9b665"
    msg_box_text 		     "#a9b665"
    atom_box_text 		     "#a9b665"
    pdwindow_post_text 	     "#c5b18d"
    atom_box_label 	 	     "#c5b18d"
    helpbrowser_text 	     "#c5b18d"
    text_window_text 	     "#c5b18d"
    comment 		         "#928374"

    obj_box_outline 	     "#5a524c"
    msg_box_outline 	     "#5a524c"
    atom_box_outline 	     "#5a524c"
    atom_box_focus_outline   "#7daea3"
    msg_box_fill 		     "#5a524c"
    obj_box_fill 		     "#5a524c"
    atom_box_fill 		     "#5a524c"

    signal_cord 		     "#c18f41"
    signal_iolet 		     "#c18f41"
    signal_iolet_border      "#c18f41"
    msg_cord 		         "#a89984"
    msg_iolet 		         "#a89984"
    msg_iolet_border         "#a89984"

    graph_outline 		     "#5a524c"
    graph_text 		         "#a9b665"
    array_name 		         "#a9b665"
    array_values 		     "#d3869b"
    
    obj_box_outline_broken   "#ea6962"
    pdwindow_fatal_text 	 "#ea6962"
    pdwindow_fatal_highlight "#32302f"
    pdwindow_error_text 	 "#ea6962"
    pdwindow_debug_text 	 "#8f9a52"

    selected 		         "#7daea3"
    selection_rectangle      "#7daea3"
    helpbrowser_highlight 	 "#7c6f64"
    helpbrowser_hl_text      "#7daea3"
    txt_highlight_front      "#7daea3"
    text_window_highlight    "#7c6f64"
    text_window_hl_text      "#7daea3"
    txt_highlight 		     "#7c6f64"

    text_window_cursor 	     "#FFFFFF"
    canvas_text_cursor 	     "#FFFFFF"
    cursor                   "#FFFFFF"

    scrollbox_fill           "#45403d"
    text                     "#ddc7a1" 
}
set ::pd_colors(atom_box_focus_outline) $::pd_colors(atom_box_outline)
