#!/bin/bash

# Function to get system uptime
get_uptime() {
    uptime -p
}

# Function to get the current date and time
get_datetime() {
    date
}

# Function to get OS information
get_os_info() {
    lsb_release -d | awk -F"\t" '{print $2}'
}

# Function to get the kernel version
get_kernel_version() {
    uname -ir
}

# Function to get the CPU information
get_cpu_info() {
    lscpu | grep "Model name:" | sed 's/Model name:\s*//'
}

# Function to get the GPU information
get_gpu_info() {
    lspci | grep -i "vga\|3d\|2d"
}

# Function to get the total memory and used memory
get_memory_info() {
    free -h | awk '/^Mem:/ {print $3 " / " $2}'
}

# Function to get disk usage
get_disk_info() {
    df -h --total | grep "total" | awk '{print $3 "/" $2 " (" $5 " used)"}'
}

# Function to get the hostname
get_hostname() {
    hostname
}

# Function to get the number of installed packages
get_package_info() {
    dpkg --get-selections | wc -l
}

# Function to get flatpak package count
get_flatpak_info() {
    flatpak list | wc -l
}

# Function to get shell information
get_shell_info() {
    echo $SHELL --version | head -n 1
}

# Function to get screen resolution
get_resolution_info() {
    xrandr | grep '*' | uniq | awk '{print $1}'
}

# Function to get GNOME version
get_gnome_version() {
    gnome-shell --version
}

# Function to get window manager
get_wm_info() {
    echo $XDG_SESSION_DESKTOP
}

# Function to get terminal info
get_terminal_info() {
    echo $TERM
}

# Print system information
echo "OS:             $(get_os_info)"
echo "Host:           $(get_hostname)"
echo "Kernel:         $(get_kernel_version)"
echo "Uptime:         $(get_uptime)"
echo "Packages:       $(get_package_info) (dpkg), $(get_flatpak_info) (flatpak)"
echo "Shell:          $(get_shell_info)"
echo "Resolution:     $(get_resolution_info)"
echo "DE:             $(get_gnome_version)"
echo "WM:             $(get_wm_info)"
echo "WM Theme:       Pop"  # This is static since it is specific to Pop!_OS
echo "Theme:          Pop-dark [GTK2/3]"  # This is static since it is specific to Pop!_OS
echo "Icons:          Pop [GTK2/3]"  # This is static since it is specific to Pop!_OS
echo "Terminal:       $(get_terminal_info)"
echo "CPU:            $(get_cpu_info)"
echo "GPU:            $(get_gpu_info | awk -F: '{print $3}' | xargs)"
echo "Memory:         $(get_memory_info)"

