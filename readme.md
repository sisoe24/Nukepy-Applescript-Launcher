# Nuke script launcher

Simple _applescript_ hack that focuses Nuke app and launches a script by _literally_ clicking on the _source a script_ button inside the _Scripting Workspace_. The script is made with Visual Studio Code in mind, but you can still use it outside by remembering that it takes an argument: the file to source

```applescript
osascript script_launcher.applescript path/to/file
```

## How to use (vscode)

1. Place the  _script\_launcher.applescript_ in your _workspace root_ directory.
2. Copy the _tasks.json_ (or create your own) in your _.vscode_ folder.
3. When you run the task, vscode will take the file you have currently active to run inside Nuke.
4. Optional: You could assign it to a shortcut:

    ```json
    {
        "key": "cmd+shift+r",
        "command": "workbench.action.tasks.runTask",
        "args": "Run Nuke Script"
    },
    ```

## Notes

* You could/should change some variables depending on your scenario:

    ```applescript
    set nuke_version to "NukeX"          # Change NukeX with your Nuke app version (Nuke, NukeStudio)
    set go_back_workspace to false       # Focus back on a different workspace
    set main_workspace to "Compositing"  # Workspace to go back if go_back_workspace is enabled
    set vscode_focus to true             # Focus back to vscode
    set delay_time to 0.1                # delay is needed to not overlap actions. increment if OS responds slower.
    ```

* There is a simpler version of the script, one which uses the shortcut `alt + x` inside Nuke (that still sources a script), but it doesn't seem to work for every script and I don't really know why. I've included it just because it was my first attempt.
