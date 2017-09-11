Delayed hibernation
===================

This script is inspired by https://wiki.archlinux.org/index.php/Power_management#Delayed_hibernation_service_file

# Features

* Automatic hibernation after specific time of sleep while on battery
* Do not hibernate while on AC
* If hibernation fails fall back to suspend
* If AC is disconnected while suspended it will hibernate on the next auto wake up


# Installation

```bash
sudo cp suspend-to-hibernate.service /etc/systemd/system/suspend-to-hibernate.service
sudo systemctl enable suspend-to-hibernate.service
sudo cp suspend-to-hibernate.sh /usr/local/bin/suspend-to-hibernate.sh
sudo chmod +x /usr/local/bin/suspend-to-hibernate.sh
```
