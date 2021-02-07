# run nuke from applescript 

on run argv
    
    # User Variables
    set delay_time to 0.1         # delay MIGHT be needed to not overlap actions
    set vscode_focus to true      # Focus back to vscode

    tell application "System Events"

        # Change with your nuke version if needed
        activate application "Nuke12.2v3"
        # delay delay_time

        # launch source script window
        keystroke "x" using {option down}
        # delay delay_time

        # write text field with the active vscode file
        keystroke (item 1 of argv)
        # delay delay_time

        # press enter
        key code 36
        # delay delay_time

        if vscode_focus then
            delay delay_time 
            activate application "Visual Studio Code"
        end if

    end tell
end run