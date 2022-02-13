# Theme by Eric Lennartson
# https://github.com/Eric-Lennartson/pd-themes
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
# msg_iolet_border - border/outline of message inlet
# signal_iolet - signal inlet/outlet fill
# signal_iolet_border - border/outline of signal iolet
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
# atom_box_focus_outline - outline of gatoms with keyboard focus
# text_window_fill - [text] window background
# text_window_text - [text] window text
# text_window_highlight - like txt_highlight but for [text] window
# text_window_hl_text - color of highlighted text in [text] window
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
# helpbrowser_hl_text - text highlight color (defaults to helpbrowser_text)

# One Dark Pro
array set ::pd_colors {

    gop_box 		         "#dddddd"

    canvas_fill 		     "#282C34"
    pdwindow_fill 		     "#282C34"
    scrollbox_fill           "#282C34"
    helpbrowser_fill 	     "#282C34"
    text_window_fill 	     "#282C34"

    obj_box_text 		     "#98C379"
    msg_box_text 		     "#61AFEF"
    atom_box_text 		     "#D19A66"
    atom_box_label 	 	     "#7F848E"
    pdwindow_post_text 	     "#ABB2BF"
    helpbrowser_text 	     "#ABB2BF"
    text_window_text 	     "#ABB2BF"
    text                     "#ABB2BF"
    comment 		         "#7F848E"

    obj_box_outline 	     "#474E5C"
    msg_box_outline 	     "#474E5C"
    atom_box_outline 	     "#474E5C"
    atom_box_focus_outline   "#dddddd"
    msg_box_fill 		     "#474E5C"
    obj_box_fill 		     "#474E5C"
    atom_box_fill 		     "#474E5C"

    signal_cord 		     "#E4C386"
    signal_iolet 		     "#E4C386"
    signal_iolet_border      "#E4C386"
    msg_cord 		         "#ABB2BF"
    msg_iolet 		         "#ABB2BF"
    msg_iolet_border         "#ABB2BF"

    graph_outline 		     "#7F848E"
    graph_text 		         "#7F848E"
    array_name 		         "#7F848E"
    array_values 		     "#D19A66"

    obj_box_outline_broken   "#F44747"
    pdwindow_fatal_text 	 "#F44747"
    pdwindow_error_text 	 "#F44747"
    pdwindow_fatal_highlight "#282C34"
    pdwindow_debug_text 	 "#c678dd"

    selected 		         "#dddddd"
    selection_rectangle      "#dddddd"
    helpbrowser_highlight 	 "#677696"
    helpbrowser_hl_text      "#ABB2BF"
    txt_highlight_front      "#ABB2BF"
    text_window_hl_text      "#ABB2BF"
    text_window_highlight    "#677696"
    txt_highlight 		     "#677696"

    text_window_cursor 	     "#528BFF"
    canvas_text_cursor 	     "#528BFF"
    cursor                   "#528BFF"
}
