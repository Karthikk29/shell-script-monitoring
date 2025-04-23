# Shell Script Monitoring Tool 🖥️📊

This project provides a lightweight, shell-script-based system monitoring tool that logs important system metrics such as memory usage, disk space, CPU load, and Apache service status.

---

---

## 🚀 Features

- ✅ Real-time memory usage logging  
- ✅ Disk space monitoring  
- ✅ CPU load checking  
- ✅ Apache service status detection  
- ✅ Continuous logging with timestamps  
- ✅ Cron-friendly format for scheduled monitoring  

---

## 🔧 How It Works

The script includes the following key functions:

### `log_message()`
Logs messages to `monitoring.log` with a timestamp.

### `log_memory_usage()`
Logs the system's current memory usage percentage.

```bash
memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
### `log_disk_usage()`
Logs disk usage of the root directory (`/`) using `df -h`.

### `log_cpu_usage()`
Logs system CPU load using `top` and `awk`.

### `check_apache_status()`
Checks whether Apache (`apache2` service) is running. Logs a warning if it’s down.
## ⏱️ Optional: Set Up Cron Job

To run the script every 5 minutes:

```bash
crontab -e
*/5 * * * * /path/to/your/script/monitoring.sh

