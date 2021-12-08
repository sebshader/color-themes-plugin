# color-themes-plugin
theme-picker plugin for pd-next https://github.com/sebshader/pdnext/releases and hopefully pure data in the future

to install: make sure folder is named color-themes-plugin and place it in your pd path. also make sure there are no other active -plugin.tcl plugins in the pd path
that set colors.

Open the theme picker from the preferences menu > Color Themes...
you can save the current (applied) theme to be used the next time pd starts by hitting "save", 

On OSX if you select a theme from the list and click "Save as Dark Theme" then that theme will open instead if you're in dark mode when you open pd.
In order to stop using a specific theme for dark mode you can click "Delete Dark Theme"

I couldn't figure out a good way to include the text window and help browser colors, so those have to be re-mapped for the changes to be seen. 
I also had some trouble with the text highlight background color

In order to include more themes, put them in the "themes" folder inside. But only include setting colors in the files or else other things can get messed up when
the list gets drawn.
