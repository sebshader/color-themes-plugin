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

# monokai
array set ::pd_colors {
    gop_box 		         "#D8447A"

    canvas_fill 		     "#272822"
    pdwindow_fill 		     "#272822"
    scrollbox_fill           "#272822"
    helpbrowser_fill 	     "#272822"
    text_window_fill 	     "#272822"

    obj_box_text 		     "#A1D044"
    msg_box_text 		     "#D6CC78"
    atom_box_text 		     "#AE81FF"
    atom_box_label 	 	     "#88846f"
    pdwindow_post_text 	     "#CFCFCF"
    helpbrowser_text 	     "#CFCFCF"
    text_window_text 	     "#CFCFCF"
    text                     "#CFCFCF"
    comment 		         "#88846f"

    obj_box_outline 	     "#403f34"
    msg_box_outline 	     "#403f34"
    atom_box_outline 	     "#403f34"
    atom_box_focus_outline 	 "#90BFC9"
    msg_box_fill 		     "#403f34"
    obj_box_fill 		     "#403f34"
    atom_box_fill 		     "#403f34"

    signal_cord 		     "#D99A53"
    signal_iolet 		     "#D99A53"
    signal_iolet_border      "#D99A53"
    msg_cord 		         "#A3A28F"
    msg_iolet 		         "#A3A28F"
    msg_iolet_border         "#A3A28F"

    graph_outline 		     "#403f34"
    graph_text 		         "#88846f"
    array_name 		         "#AE81FF"
    array_values 		     "#AE81FF"
    
    obj_box_outline_broken   "#DC5E5E"
    pdwindow_fatal_text 	 "#DC5E5E"
    pdwindow_error_text 	 "#DC5E5E"
    pdwindow_fatal_highlight "#272822"
    pdwindow_debug_text 	 "#A1D044"

    selected 		         "#90BFC9"
    selection_rectangle      "#90BFC9"
    helpbrowser_highlight 	 "#716F5B"
    helpbrowser_hl_text      "#90BFC9"
    txt_highlight_front      "#060901"
    text_window_highlight    "#90BFC9"
    text_window_hl_text      "#000"
    txt_highlight 		     "#716F5B"

    text_window_cursor 	     "#FFFFFF"
    canvas_text_cursor 	     "#FFFFFF"
    cursor                   "#FFFFFF"
}
set ::pd_colors(atom_box_focus_outline) $::pd_colors(atom_box_outline)