import tkinter as tk
from tkinter import ttk, messagebox
import subprocess
import yaml

# Function to run a command and return its output
def run_command(command):
    try:
        result = subprocess.run(command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        return result.stdout.decode('utf-8')
    except subprocess.CalledProcessError as e:
        return e.stderr.decode('utf-8')

# Function to load commands from a YAML file
def load_commands(config_file):
    with open(config_file, 'r') as file:
        config = yaml.safe_load(file)
    return config['commands']

# Function to display command output in the same window
def show_command_output(command):
    output = run_command(command)
    text_widget.config(state=tk.NORMAL)  # Make the text widget editable
    text_widget.delete('1.0', tk.END)  # Clear previous content
    text_widget.insert('1.0', output)  # Insert new output
    text_widget.config(state=tk.DISABLED)  # Make the text widget read-only again

# Load commands from the YAML configuration file
commands = load_commands('config.yml')

# Create the main window
root = tk.Tk()
root.title("Simple Command Dashboard")

# Configure the grid to make the widgets resizable
root.grid_rowconfigure(1, weight=1)
root.grid_columnconfigure(0, weight=1)

# Create a frame to hold the dropdown menu and buttons
frame = ttk.Frame(root, padding="10")
frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))

# Create a dropdown menu to select commands
selected_command = tk.StringVar()
command_names = [cmd['name'] for cmd in commands]
command_menu = ttk.OptionMenu(frame, selected_command, command_names[0], *command_names)
command_menu.grid(row=0, column=0, padx=5, pady=5)

# Create a button to run the selected command
def on_run_button_click():
    selected_name = selected_command.get()
    command = next(cmd['command'] for cmd in commands if cmd['name'] == selected_name)
    show_command_output(command)

run_button = ttk.Button(frame, text="Run Command", command=on_run_button_click)
run_button.grid(row=0, column=1, padx=5, pady=5)

# Create a Text widget to display the command output
text_widget = tk.Text(root, wrap='word', height=20, width=80)
text_widget.grid(row=1, column=0, padx=10, pady=10)
text_widget.config(state=tk.DISABLED)

# Run the main event loop
root.mainloop()
