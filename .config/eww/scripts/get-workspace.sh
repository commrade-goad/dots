#!/bin/bash

get_workspaces() {
    # Get active workspace information
    active_workspace=$(hyprctl activeworkspace -j | jq -r '.id')

    # Get all clients information
    clients_json=$(hyprctl clients -j)

    # Get unique workspaces with clients
    workspaces_with_clients=$(echo "$clients_json" | jq -r '.[].workspace.id' | sort -n | uniq)

    # Initialize an empty array to store all workspaces we need to display
    all_workspaces=()

    # Add all workspaces with clients to our array
    for workspace in $workspaces_with_clients; do
        all_workspaces+=("$workspace")
    done

    # Check if active workspace is already in our list, if not add it
    if ! echo "${all_workspaces[@]}" | grep -q "$active_workspace"; then
        all_workspaces+=("$active_workspace")
    fi

    # Sort workspaces numerically
    IFS=$'\n' all_workspaces=($(sort -n <<< "${all_workspaces[*]}"))
    unset IFS

    # Begin JSON array
    echo -n '['

    # Print information for each workspace
    first=true
    for workspace in "${all_workspaces[@]}"; do
        # Count windows in this workspace
        window_count=$(echo "$clients_json" | jq -r "[.[] | select(.workspace.id == $workspace)] | length")

        # Check if this is the active workspace
        if [ "$workspace" -eq "$active_workspace" ]; then
            is_active="true"
        else
            is_active="false"
        fi

        # Add comma if not first item
        if ! $first; then
            echo -n ','
        else
            first=false
        fi

        # Output workspace as JSON object
        echo -n "{\"id\":$workspace,\"active\":$is_active,\"windows\":$window_count}"
    done

    # End JSON array
    echo ']'
}

# Initial workspace data
get_workspaces

# Listen to workspace updates
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
if [[ "$line" == "workspace>>"* ]] || [[ "$line" == "createworkspace>>"* ]] || [[ "$line" == "destroyworkspace>>"* ]] || [[ "$line" == "openwindow>>"* ]] || [[ "$line" == "closewindow>>"* ]]; then
    get_workspaces
fi
done
