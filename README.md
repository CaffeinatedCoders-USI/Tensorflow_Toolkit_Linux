# Tensorflow_Toolkit_Linux

## Tensorflow GPU
### Overview 
1. Hardware Requirements

    NVIDIA GPU: Ensure you have an NVIDIA GPU with CUDA Compute Capability 3.5 or higher.

2. Software Requirements
a. NVIDIA Driver

You need to install the appropriate NVIDIA driver for your GPU.
b. CUDA Toolkit

TensorFlow requires a specific version of the CUDA Toolkit. Check the TensorFlow compatibility table for the correct version. For example, TensorFlow 2.11 typically requires CUDA 11.2.
c. cuDNN

TensorFlow also requires a specific version of cuDNN. Check the compatibility table for the correct version. For TensorFlow 2.11, cuDNN 8.1 is typically required.

3. Install NVIDIA Driver, CUDA, and cuDNN

### Prerequisites 

- solve the problem gatherening all info needed for tensorflow
- sudo apt-get install python-tk
* Setup virtual environment
	* python3 -m venv .venv/tensorflow
