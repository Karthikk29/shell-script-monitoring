#!/bin/bash

# Define the log file location
LOG_FILE="/home/karthik/shellscript/monitoring.log"

# Create the log file if it doesn't exist
touch $LOG_FILE

# Function to log messages
log_message() {
    echo "$(date) - $1" >> $LOG_FILE
}

# Log the start of the script
log_message "Monitoring script started."

# Function to monitor CPU usage
log_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    log_message "CPU Usage: $cpu_usage%"
}

# Function to monitor Memory usage
log_memory_usage() {
    memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    log_message "Memory Usage: $memory_usage%"
}

# Function to monitor Disk usage
log_disk_usage() {
    disk_usage=$(df / | grep / | awk '{ print $5 }')
    log_message "Disk Usage: $disk_usage"
}

# Function to monitor Apache status
log_apache_status() {
    if ! systemctl is-active --quiet apache2; then
        log_message "Alert: Apache is not running!"
    else
        log_message "Apache is running."
    fi
}

# Infinite loop to log system stats every 10 seconds
while true
do
    log_cpu_usage
    log_memory_usage
    log_disk_usage
    log_apache_status
    sleep 10  # Wait 10 seconds before checking again
done

