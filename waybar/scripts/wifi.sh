#!/bin/bash
if nmcli -t -f STATE general | grep -q "CONNECTED"; then
    if nmcli -t -f DEVICE,TYPE,STATE dev | grep -q "wifi.*connected"; then
        echo ""
    else
        echo "󰖪"
    fi
else
    echo "󰖪"
fi
