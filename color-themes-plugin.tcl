namespace eval color-themes {
    variable this_path
    variable current_name
    variable current_theme
    variable hover_theme
    variable selected_theme
    variable num_themes
    variable canvas_height
}

# found https://comp.lang.tcl.narkive.com/39ezTJaO/string-trimright-bug
proc ::color-themes::trimsubstringright {str substr} {
    set l [expr {[string length $substr]-1}]
    if {[string range $str end-$l end] == $substr} {
        incr l
        return [string range $str 0 end-$l]
    } else {
        return -code error "$str does not end in $substr"
    }
}

proc ::color-themes::reset_defaults {} {
    array set ::pd_colors {
        selected "#00f"
        selection_rectangle "#000"
        txt_highlight ""
        txt_highlight_front ""
        msg_iolet "#000"
        msg_iolet_border "#000"
        signal_iolet "#000"
        signal_iolet_border "#000"
        obj_box_outline "#000"
        obj_box_fill ""
        obj_box_text "#000"
        msg_box_outline "#000"
        msg_box_fill ""
        msg_box_text "#000"
        atom_box_outline "#000"
        atom_box_focus_outline "#000"
        atom_box_fill ""
        atom_box_text "#000"
        atom_box_label "#000"
        msg_cord "#000"
        signal_cord "#000"
        obj_box_outline_broken "#000"
        canvas_fill "#FFFFFF"
        canvas_text_cursor ""
        comment "#000"
        graph_outline "#000"
        graph_text "#000"
        array_name "#000"
        array_values "#000"
        gop_box "#FF8080"
        text_window_fill "#FFFFFF"
        text_window_text "#000"
        text_window_hl_text ""
        text_window_highlight ""
        text_window_cursor "#000"
        pdwindow_fill "#FFFFFF"
        pdwindow_fatal_text "#D00"
        pdwindow_fatal_highlight "#FFE0E8"
        pdwindow_error_text "#D00"
        pdwindow_post_text "#000"
        pdwindow_debug_text "#484848"
        helpbrowser_fill "#FFFFFF"
        helpbrowser_text ""
        helpbrowser_highlight ""
        helpbrowser_hl_text ""
    }
}

proc ::color-themes::set_theme {name} {
    variable this_path
    variable current_name
    variable current_theme
    # check for theme
    if { ![file exists $this_path/themes/$name-plugin.tcl] } {
        ::pdwindow::error "no theme '$name-plugin.tcl'\n"
        return
    }
    #store name
    set current_name $name
    #reset defaults
    ::color-themes::reset_defaults
    #load theme
    source $this_path/themes/${name}-plugin.tcl
    # redraw everything
    foreach wind [wm stackorder .] {
        if {[winfo class $wind] eq "PatchWindow"} {
            pdsend "$wind map 0"
            pdsend "$wind map 1"
            ${wind}.c configure -background [::pdtk_canvas::get_color canvas_fill]
        }
    }
    ::pdwindow::set_colors
}

proc ::color-themes::make_default {} {
    variable current_name
    variable this_path
    if {[catch {set fp [open $this_path/current-theme.txt w]}]} {
        ::pdwindow::error "couldn't open file for writing\n"
        return
    }
    puts -nonewline $fp $current_name
    close $fp
    ::pdwindow::post "saved $current_name as the theme\n"
}

proc ::color-themes::print {} {
    variable this_path
    ::pdwindow::post "color themes in $this_path/themes:\n"
    foreach theme [lsort [glob -path $this_path/themes/ *-plugin.tcl]] {

        ::pdwindow::post "[{::color-themes::trimsubstringright} [file tail $theme] -plugin.tcl]\n"
    }
}

proc ::color-themes::motion {box} {        
    
    #::pdwindow::post "box: $box\n"
    if {$box ne ${::color-themes::hover_theme}} {
        if {${::color-themes::hover_theme} ne "" && \
        ${::color-themes::hover_theme} ne \
        ${::color-themes::selected_theme} } {
            .colortheme_dialog.theme_list.c.f${::color-themes::hover_theme}.c \
                itemconfigure box${::color-themes::hover_theme} -outline \
                black -width 1
            .colortheme_dialog.theme_list.c \
                itemconfigure box${::color-themes::hover_theme} -outline \
                black -width 1
        }
        if {$box ne ${::color-themes::selected_theme}} {
            .colortheme_dialog.theme_list.c.f$box.c itemconfigure \
                box$box -outline blue -width 7
            .colortheme_dialog.theme_list.c itemconfigure \
                box$box -outline blue -width 7
        }
        set {::color-themes::hover_theme} $box
    }
}

proc ::color-themes::click {box} {
    if {${::color-themes::hover_theme} eq ""} {return}
    if {${::color-themes::selected_theme} ne "" && \
    ${::color-themes::selected_theme} ne ${::color-themes::hover_theme}} {
        .colortheme_dialog.theme_list.c.f${::color-themes::selected_theme}.c \
            itemconfigure box${::color-themes::selected_theme} -outline \
            black -width 1
        .colortheme_dialog.theme_list.c \
            itemconfigure box${::color-themes::selected_theme} -outline \
            black -width 1
    }
    set {::color-themes::selected_theme} ${::color-themes::hover_theme}

    .colortheme_dialog.theme_list.c.f$box.c itemconfigure \
        box${::color-themes::hover_theme} -outline \
        green -width 7
    .colortheme_dialog.theme_list.c itemconfigure \
        box${::color-themes::hover_theme} -outline \
        green -width 7
}

proc ::color-themes::apply {names} {
    variable selected_theme
    if {$selected_theme eq ""} {return} 
    {::color-themes::set_theme} [lindex $names $selected_theme]
}

proc ::color-themes::save_dark {names} {
    variable this_path
    variable selected_theme
    if {$selected_theme eq ""} {return} 
    set name [lindex $names $selected_theme]
    if {[catch {set fp [open $this_path/dark-theme.txt w]}]} {
        ::pdwindow::error "couldn't open file for writing\n"
        return
    }
    puts -nonewline $fp $name
    close $fp
    ::pdwindow::post "saved $name as the dark theme\n"
}

proc ::color-themes::delete_dark {} {
    variable this_path
    if {[catch [file delete $this_path/dark-theme.txt]]} {
        ::pdwindow::error "couldn't delete dark theme file\n"
        return
    }
    ::pdwindow::post "deleted dark-theme.txt\n"
}

proc ::color-themes::opendialog {} {
    variable this_path
    variable current_name
    variable hover_theme
    variable selected_theme
    variable num_themes
    variable canvas_height
    set hover_theme ""
    set selected_theme ""
    # save current theme
    array set temp_theme [array get ::pd_colors]
    if {[winfo exists .colortheme_dialog]} {
        wm deiconify .colortheme_dialog
        raise .colortheme_dialog
        focus .colortheme_dialog
        return
    }
    toplevel .colortheme_dialog -class ColorThemeDialog
    wm title .colortheme_dialog [_ "Color Themes"]
    wm group .colortheme_dialog .
    wm resizable .colortheme_dialog 0 1
    wm transient .colortheme_dialog
    wm minsize .colortheme_dialog 400 380
    if {$::windowingsystem eq "aqua"} {
        .colortheme_dialog configure -menu $::dialog_menubar
    }
    set themes [lsort [glob -path $this_path/themes/ *-plugin.tcl]]
    frame .colortheme_dialog.theme_list
    scrollbar .colortheme_dialog.theme_list.sy -command \
        ".colortheme_dialog.theme_list.c yview"
    canvas .colortheme_dialog.theme_list.c -yscrollcommand \
        ".colortheme_dialog.theme_list.sy set" -width 400
    
    
    grid .colortheme_dialog.theme_list -sticky nwes -row 0 -column 0 \
        -padx 5 -pady 5 -columnspan 3
    grid .colortheme_dialog.theme_list.c -sticky ns -row 0 -column 0
    grid .colortheme_dialog.theme_list.sy -sticky ns -row 0 -column 1
    grid columnconfigure .colortheme_dialog.theme_list 0 -weight 1
    grid rowconfigure .colortheme_dialog.theme_list 0 -weight 1
    
    grid rowconfigure .colortheme_dialog 0 -weight 1
    
    set height 5
    set fontinfo [list $::font_family -14 $::font_weight]
    set mwidth [font measure $fontinfo M]
    set mheight [expr {[font metrics $fontinfo -linespace] + 5}]
    set boxheight [expr {$mheight * 3 + 18}]
    set boxincr [expr {$boxheight + 5}]
    set corner [expr {$mheight/4}]
    set counter 0
    set names ""
    foreach i $themes {
        ::color-themes::reset_defaults
        source ${i}
        set name [{::color-themes::trimsubstringright} [file tail ${i}] -plugin.tcl]
        lappend names $name
        # canvas for txt_highlight
        frame .colortheme_dialog.theme_list.c.f$counter
        .colortheme_dialog.theme_list.c create rectangle  0 $height 400 \
            [expr {$height + $boxheight}] -outline black -width 1 -tags \
            box$counter
        .colortheme_dialog.theme_list.c create window  0 $height -window \
            .colortheme_dialog.theme_list.c.f$counter -anchor nw -width \
            400 -height $boxheight
        canvas .colortheme_dialog.theme_list.c.f$counter.c -width 400 -height \
            $boxheight -background $::pd_colors(canvas_fill) \
            -highlightthickness 0
        grid .colortheme_dialog.theme_list.c.f$counter.c
        bind .colortheme_dialog.theme_list.c.f$counter.c <MouseWheel> {
            .colortheme_dialog.theme_list.c yview scroll [expr {- (%D)}] units
        }
        bind .colortheme_dialog.theme_list.c.f$counter.c <Motion> \
            [list {::color-themes::motion} $counter]
        bind .colortheme_dialog.theme_list.c.f$counter.c <ButtonPress> \
            [list {::color-themes::click} $counter]
        .colortheme_dialog.theme_list.c.f$counter.c create rectangle 0 0 \
            400 $boxheight -outline black -width 1 -tags box$counter
        # name
        set twidth [expr {$mwidth * [string length $name] + 4}]
        .colortheme_dialog.theme_list.c.f$counter.c create rectangle 2 0 \
            [expr {2 + $twidth}] [expr {$mheight}] -fill black
        .colortheme_dialog.theme_list.c.f$counter.c create text 4 3 \
            -text ${name} -anchor nw -font $fontinfo -fill white
        # (signal) object box
        set twidth [expr {$mwidth * 13 + 4}]
        .colortheme_dialog.theme_list.c.f$counter.c create rectangle 5 \
            [expr {$mheight + 4}] [expr {$twidth + 5}] \
            [expr {$mheight*2 + 4}] -fill $::pd_colors(obj_box_fill) \
            -outline $::pd_colors(obj_box_outline)
        .colortheme_dialog.theme_list.c.f$counter.c create text 7 \
            [expr {$mheight + 7}] -text signal_object -anchor nw \
            -font $fontinfo -fill $::pd_colors(obj_box_text)
        # signal outlet + cable
        .colortheme_dialog.theme_list.c.f$counter.c create rectangle 5 \
        [expr {$mheight*2 + 1}] 16 [expr {$mheight*2 + 4}] \
            -fill $::pd_colors(signal_iolet) -outline \
            $::pd_colors(signal_iolet_border)
        .colortheme_dialog.theme_list.c.f$counter.c create line 11 \
            [expr {$mheight*2 + 4}] 11 $boxheight \
            -fill $::pd_colors(signal_cord) -width 3
        # broken object
        .colortheme_dialog.theme_list.c.f$counter.c create rectangle \
            [expr {$twidth + 15}] \
            [expr {$mheight + 5}] [expr {$twidth*2 + 15}] \
            [expr {$mheight*2 + 5}] -fill $::pd_colors(obj_box_fill) \
            -outline $::pd_colors(obj_box_outline_broken) -dash -
        .colortheme_dialog.theme_list.c.f$counter.c create text [expr {$twidth + 17}] \
            [expr {$mheight + 8}] -text broken_object -anchor nw \
            -font $fontinfo -fill $::pd_colors(obj_box_text)
        # message box
        set twidth [expr {$mwidth * 11 + 4}]
        set tempy [expr {$mheight*2 + 8}]
        set tempx [expr {$twidth + 20}]
        .colortheme_dialog.theme_list.c.f$counter.c create polygon 20 \
            $tempy [expr {$tempx + $corner}] $tempy \
            $tempx [expr {$tempy + $corner}] $tempx \
            [expr {$tempy + $mheight - $corner}] \
            [expr {$tempx + $corner}] [expr {$tempy + $mheight}] \
            20 [expr {$tempy + $mheight}] -fill $::pd_colors(msg_box_fill) \
            -outline $::pd_colors(msg_box_outline)
        .colortheme_dialog.theme_list.c.f$counter.c create text 22 \
            [expr {$mheight*2 + 11}] -text message_box -anchor nw \
            -font $fontinfo -fill $::pd_colors(msg_box_text)
         # message outlet + cable
         set tempy [expr {$tempy + $mheight}]
        .colortheme_dialog.theme_list.c.f$counter.c create rectangle 20 \
            [expr {$tempy - 3}] 31 $tempy -fill $::pd_colors(msg_iolet) \
            -outline $::pd_colors(msg_iolet_border)
        .colortheme_dialog.theme_list.c.f$counter.c create line 26 \
            $tempy 26 [expr {$boxheight + $height}] -fill \
            $::pd_colors(msg_cord) -width 2
        # atom box
        .colortheme_dialog.theme_list.c.f$counter.c create text \
            [expr {$tempx + 15}] [expr {$mheight*2 + 14}] -text label \
            -anchor nw -font $fontinfo -fill $::pd_colors(atom_box_label)
        set twidth [expr {$mwidth * 5 + 4}]
        set tempx [expr {$tempx + $twidth + 14}]
        set tempy [expr {$mheight*2 + 12}]
        .colortheme_dialog.theme_list.c.f$counter.c create polygon $tempx \
            $tempy [expr {$tempx + $twidth - $corner}] $tempy \
            [expr {$tempx + $twidth}] [expr {$tempy + $corner}] \
            [expr {$tempx + $twidth}] [expr {$tempy + $mheight}] \
            $tempx [expr {$tempy + $mheight}] -fill \
            $::pd_colors(atom_box_fill) -outline $::pd_colors(atom_box_outline)
        .colortheme_dialog.theme_list.c.f$counter.c create text \
            [expr {$tempx + 2}] [expr {$tempy + 3}] -text gatom -anchor nw \
            -font $fontinfo -fill $::pd_colors(atom_box_text)
        incr tempx [expr {$twidth + 15}]
        set twidth [expr {$mwidth * 8 + 4}]
        # selected box/text
        .colortheme_dialog.theme_list.c.f$counter.c create rectangle \
            $tempx $tempy [expr {$tempx + $twidth}] \
            [expr {$tempy + $mheight}] -fill $::pd_colors(obj_box_fill) \
            -outline $::pd_colors(selected)
        # can't figure out how to do text_highlight after all
        .colortheme_dialog.theme_list.c.f$counter.c create text \
            [expr {$tempx + 2}] [expr {$tempy + 3}] -text selected -anchor nw \
            -font $fontinfo -fill $::pd_colors(selected)
        # selection "lasso"
        .colortheme_dialog.theme_list.c.f$counter.c create rectangle \
            [expr {$tempx + 6}] [expr {$tempy - 7}] \
            [expr {$tempx + $twidth*0.98}] [expr {$tempy + $mheight*0.4}] \
            -outline $::pd_colors(selection_rectangle)
        # comment
        .colortheme_dialog.theme_list.c.f$counter.c create text \
            [expr {$mwidth * 26 + 31}] [expr {$mheight + 8}] -text comment \
            -anchor nw -font $fontinfo -fill $::pd_colors(comment)
        # array
        incr tempx [expr {$twidth + 6}]
        set tempy [expr {$mheight*3 + 12}]
        set twidth [expr {$mwidth * 5 + 4}]
        .colortheme_dialog.theme_list.c.f$counter.c create text \
            $tempx 9 -text array \
            -anchor nw -font $fontinfo -fill $::pd_colors(array_name)
        .colortheme_dialog.theme_list.c.f$counter.c create rectangle \
            $tempx [expr {$mheight + 5}] [expr {$tempx + $twidth}] \
            $tempy -outline $::pd_colors(graph_outline)
        set tempy [expr {2*$mheight + 9}]
        .colortheme_dialog.theme_list.c.f$counter.c create line \
            $tempx $tempy [expr {$tempx + $twidth}] \
            $tempy -fill $::pd_colors(array_values) -width 2
        # pd window/console
        incr tempx [expr {$twidth + 5}]
        .colortheme_dialog.theme_list.c.f$counter.c create rectangle \
            $tempx 0 [expr {$tempx + $twidth}] \
            $boxheight -fill $::pd_colors(pdwindow_fill)
        .colortheme_dialog.theme_list.c.f$counter.c create text \
            [expr {$tempx + 2}] 3 -text debug \
            -anchor nw -font $fontinfo -fill $::pd_colors(pdwindow_debug_text)
        set tempy [expr {$mheight - 1}]
        .colortheme_dialog.theme_list.c.f$counter.c create text \
            [expr {$tempx + 2}] $tempy -text post \
            -anchor nw -font $fontinfo -fill $::pd_colors(pdwindow_post_text)
        incr tempy [expr {$mheight - 4}]
        .colortheme_dialog.theme_list.c.f$counter.c create text \
            [expr {$tempx + 2}] $tempy -text error \
            -anchor nw -font $fontinfo -fill $::pd_colors(pdwindow_error_text)
        incr tempy [expr {$mheight - 4}]
        .colortheme_dialog.theme_list.c.f$counter.c create rectangle \
            [expr {$tempx + 1}] $tempy [expr {$tempx + $twidth - 1}] \
            [expr {$tempy + $mheight - 4}] -fill \
            $::pd_colors(pdwindow_fatal_highlight) -outline \
            $::pd_colors(pdwindow_fatal_highlight)
        .colortheme_dialog.theme_list.c.f$counter.c create text \
            [expr {$tempx + 2}] $tempy -text fatal \
            -anchor nw -font $fontinfo -fill $::pd_colors(pdwindow_fatal_text)
        # go back and make GOP
        set tempx [expr {$mwidth * 26 + 44}]
        set tempy [expr {4+$mheight}]
        .colortheme_dialog.theme_list.c.f$counter.c create rectangle \
            $tempx 4 [expr {$tempx + $twidth}] \
            $tempy -outline $::pd_colors(graph_outline)
        .colortheme_dialog.theme_list.c.f$counter.c create text \
            [expr {$tempx + 2}] 7 -text GOP \
            -anchor nw -font $fontinfo -fill $::pd_colors(graph_text)
        incr height $boxincr
        incr counter

    }
    set canvas_height $height
    set num_themes $counter
    .colortheme_dialog.theme_list.c configure -scrollregion \
        [list 0 0 400 $height]
    button .colortheme_dialog.apply -text [_ "Apply"] \
         -command [list {::color-themes::apply} $names]
    button .colortheme_dialog.close -text [_ "Close"] \
         -command "destroy .colortheme_dialog"
    button .colortheme_dialog.save -text [_ "Save Current"] \
        -command {::color-themes::make_default}
    grid .colortheme_dialog.apply -row 1 -column 0
    grid .colortheme_dialog.close -row 1 -column 1
    grid .colortheme_dialog.save -row 1 -column 2
    grid columnconfigure .colortheme_dialog 0 -weight 1 -uniform a
    grid columnconfigure .colortheme_dialog 1 -weight 1 -uniform a
    grid columnconfigure .colortheme_dialog 2 -weight 1 -uniform a
    if {$::windowingsystem eq "aqua"} {
        button .colortheme_dialog.dark -text [_ "Save as Dark Theme"] \
            -command [list {::color-themes::save_dark} $names]
        button .colortheme_dialog.undark -text [_ "Delete Dark Theme"] \
            -command {::color-themes::delete_dark}
        grid .colortheme_dialog.dark -row 2 -column 0 -pady 5
        grid .colortheme_dialog.undark -row 2 -column 1 -pady 5
        grid configure .colortheme_dialog.apply -pady 1 
    } else {
        grid configure .colortheme_dialog.apply -pady 5
        grid configure .colortheme_dialog.close -pady 5
        grid configure .colortheme_dialog.save -pady 5
    }
    bind .colortheme_dialog.theme_list.c <MouseWheel> {
        .colortheme_dialog.theme_list.c yview scroll [expr {- (%D)}] units
    }
    
    bind .colortheme_dialog.theme_list.c <Leave> {
        if {${::color-themes::hover_theme} ne "" && \
        ${::color-themes::selected_theme} ne ${::color-themes::hover_theme}} {
            .colortheme_dialog.theme_list.c.f${::color-themes::hover_theme}.c \
                itemconfigure box${::color-themes::hover_theme} -outline \
                black -width 1
            .colortheme_dialog.theme_list.c \
                itemconfigure box${::color-themes::hover_theme} -outline \
                black -width 1
        }
        set {::color-themes::hover_theme} ""
    }
    array set ::pd_colors [array get temp_theme]
}

proc ::color-themes::init {mymenu} {
    set ::color-themes::this_path $::current_plugin_loadpath
    #::pdwindow::post "menu: $mymenu\n"
    $mymenu add command -label [_ "Color Themes..."] \
        -command {::color-themes::opendialog}
    if {[catch {set darkmode [exec defaults read -g AppleInterfaceStyle]}]} {
        set darkmode ""
    }
    if {$::windowingsystem eq "aqua" && $darkmode eq "Dark" && [file exists \
        $::current_plugin_loadpath/dark-theme.txt] } {
        if {![catch {set fp [open $::current_plugin_loadpath/dark-theme.txt r]}]} {
        # not sure if the console is ready..
            ::color-themes::set_theme [read -nonewline $fp]
            close $fp
        }
        return
    }
    if {[catch {set fp [open $::current_plugin_loadpath/current-theme.txt r]}]} {
        return
    }
    ::color-themes::set_theme [read -nonewline $fp]
    close $fp
}

# for some reason returning from source didn't work
if {![array exists ::pd_colors]} {
    ::pdwindow::post "color-themes: no ::pd_colors array: skipping\n"
    # return not working here
} else {
    if {$::windowingsystem eq "aqua"} {
        ::color-themes::init .menubar.apple.preferences
    } else {
        ::color-themes::init .menubar.file.preferences
    }
}