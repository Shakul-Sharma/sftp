#!/usr/bin/env python

import json
import os

ip_address = os.getenv('IP_ADDRESS', 'default_ip')  # Get the IP address parameter from Jenkins

inventory = {
    "dynamic_hosts": {
        "hosts": [ip_address],
        "vars": {
            "ansible_ssh_user": "your_ssh_user",
            # Add other variables as needed
        }
    },
    "_meta": {
        "hostvars": {}
    }
}

print(json.dumps(inventory))
