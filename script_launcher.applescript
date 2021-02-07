# run nuke from applescript 

on run argv
    
    # User Variables
    set nuke_version to "NukeX"          # Change NukeX with your Nuke app version (Nuke, NukeStudio)
    set go_back_workspace to false       # Focus back on a different workspace
    set main_workspace to "Compositing"  # Workspace to go back if go_back_workspace is enabled
    set vscode_focus to true             # Focus back to vscode
    set delay_time to 0.1                # delay is needed to not overlap actions

    tell application "System Events"

        # Get all windows of Nuke Process
        set nuke_windows to get name of window of item 1 of (processes whose name starts with "Nuke")

        # Iterate over Nuke windows to find the "main" one
        repeat with nuke_window in nuke_windows
            if nuke_window ends with nuke_version then
                set nuke_main to nuke_window
            end if
        end repeat

        # Get only 1 instance of Nuke
        tell item 1 of (processes whose name starts with "Nuke")
            # Activate Scripting workspace
            click menu item "Scripting" of menu 1 of menu bar item "Workspace" of menu bar 1
            delay delay_time

            -- # Click `source a script` button
            click button 4 of group 1 of splitter group 2 of splitter group 1 of window nuke_main
            delay delay_time

            -- # Use visual studio code task argument to get the  current file path
            set value of text field 1 of window "Choose a script file" to (item 1 of argv)
            click button "Open" of window "Choose a script file"

            if go_back_workspace then
                delay delay_time
                click menu item main_workspace of menu 1 of menu bar item "Workspace" of menu bar 1
            end if

        end tell


        if vscode_focus then
            delay delay_time 
            activate application "Visual Studio Code"
        end if

    end tell
end run