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

# softpaper
array set ::pd_colors {
    gop_box 		         "#AB6526"

    atom_box_label 	 	     "#939e53"
    comment 		         "#AAAAAA"

    obj_box_outline 	     "#DCD6C5"
    msg_box_outline 	     "#DCD6C5"
    atom_box_outline 	     "#DCD6C5"
    atom_box_focus_outline   "#AE7CCB"
    msg_box_fill 		     "#DCD6C5"
    obj_box_fill 		     "#DCD6C5"
    atom_box_fill 		     "#DCD6C5"

    obj_box_text 		     "#5F5F5E" 
    msg_box_text 		     "#5F5F5E"
    atom_box_text 		     "#5F5F5E"
    pdwindow_post_text 	     "#5F5F5E"
    helpbrowser_text 	     "#5F5F5E"
    text_window_text 	     "#5F5F5E"
    
    signal_cord 		     "#869438"
    signal_iolet 		     "#869438"
    signal_iolet_border      "#869438"
    msg_cord 		         "#AAAAAA"
    msg_iolet 		         "#AAAAAA"
    msg_iolet_border         "#AAAAAA"

    graph_outline 		     "#5F5F5E"
    graph_text 		         "#5F5F5E"
    array_name 		         "#5F5F5E"
    array_values 		     "#9C5FBF"

    canvas_fill 		     "#F3F1EB"
    pdwindow_fill 		     "#F3F1EB"
    text_window_fill 	     "#F3F1EB"
    helpbrowser_fill 	     "#F3F1EB"

    obj_box_outline_broken   "#FF4747"
    pdwindow_fatal_text 	 "#FF4747"
    pdwindow_error_text 	 "#FF4747"
    pdwindow_fatal_highlight "#F3F1EB"
    pdwindow_debug_text 	 "#205988"

    helpbrowser_highlight 	 "#c2baa1"
    helpbrowser_hl_text      "#AE7CCB"
    selection_rectangle      "#9C5FBF"
    selected 		         "#AE7CCB"
    txt_highlight_front      "#AE7CCB"
    text_window_highlight    "#AAAAAA"
    text_window_hl_text      "#AE7CCB"
    txt_highlight 		     "#AAAAAA"

    text_window_cursor 	     "#2B2B2B"
    canvas_text_cursor 	     "#2B2B2B"
    cursor                   "#2B2B2B"

    scrollbox_fill           "#DCD6C5"
    text                     "#5F5F5E"
}
