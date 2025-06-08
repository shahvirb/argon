
###### CONFIG EXAMPLE ######
#
# This is an example config.yaml file for loggifly.
#
# If you want to use this file after editing it make sure to rename it to config.yaml
#
# Feel free to contribute to the containers section of this example config with use cases you have found helpful :)


containers:
  homepage:
  resticprofile:
  unifi-network-application:

global_keywords:
  keywords:
    - critical
  keywords_with_attachment:
    - fatal
    - panic

notifications:                     
  apprise:
    url: "op://Dev - Home Lab/discord/loggifly argon"

# settings are optional because they all have default values
# These are the default settings
settings:          
  log_level: INFO               # DEBUG, INFO, WARNING, ERROR
  notification_cooldown: 5      # Seconds between alerts for same keyword (per container)
  action_cooldown: 300          # Cooldown period (in seconds) before the next container action can be performed. Maximum is always at least 60s.
  notification_title: default   # configure a custom template for the notification title (see section below)  attachment_lines: 20          # Number of Lines to include in log attachments
  multi_line_entries: True      # Monitor and catch multi-line log entries instead of going line by line. 
  reload_config: True           # When the config file is changed the program reloads the config
  disable_start_message: False  # Suppress startup notification
  disable_shutdown_message: False        # Suppress shutdown notification
  disable_config_reload_message: False   # Suppress config reload notification
  disable_container_event_message: False # Suppress notification when monitoring of containers start/stop