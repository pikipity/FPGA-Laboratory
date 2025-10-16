# Manual for EIE330 Students

## 1. Required Tools

You must install all required tools before joining our labs. Here is the list of tools that you must install:

+ [Icarus Verilog](https://zh.wikipedia.org/wiki/Icarus_Verilog)
+ [GTKWave](https://gtkwave.sourceforge.net/)
+ [verilator](https://www.veripool.org/verilator/)
+ [OpenGL](https://www.opengl.org/)
+ [Simple VGA Simulator](https://github.com/pikipity/Simple-VGA-Simulator.git)
+ [VSCode](https://code.visualstudio.com/)

You may also need the following things to help you analyze simulation results and/or plot waveforms.

+ [Python3](https://www.python.org/downloads/) with [VCDVCD](https://github.com/cirosantilli/vcdvcd.git) library
+ [GNU Octave](https://octave.org/) or [Matlab](https://www.mathworks.com/products/matlab.html)

Besides these coding, simulation and analysis tools, you may also need 

+ [draw.io](https://www.drawio.com/) to help you plot waveforms or block diagrams during your design
+ [Github](https://github.com/) to help you manage your codes
+ [Youtube](https://www.youtube.com/) or [Bilibili](https://www.bilibili.com/) to place your demonstration videos

### 1.1. Linux System

All above tools can be easily installed or accessed in Linux system. Our lab courses will be based on the Linux system.

If you use Windows or Mac, you can use ["VirtualBox"](https://www.virtualbox.org/wiki/Downloads) and install ["Ubuntu"](https://ubuntu.com/) in a virtual environment. I recommand using [``Ubuntu 20.04 LTS (Focal Fossa)`` version](https://releases.ubuntu.com/20.04.6/?_ga=2.149898549.2084151835.1707729318-1126754318.1683186906&_gl=1*1qp18bb*_gcl_au*MTE3MTkxMjQzOC4xNzU5OTA0MjQz). If you use the VirtualBox, make sure that you install the ``"VirtualBox Guest Additions"`` and **Set up the shared folder**. Otherwise, you cannot access your files outside your virtual environment. You may refer the following videos and documents to install and set up "VirtualBox" and "Ubuntu".

+ [How to Install Ubuntu 20.04 LTS on VirtualBox in Windows](https://www.youtube.com/watch?v=x5MhydijWmc)
+ [How to Install VirtualBox Guest Additions on Ubuntu](https://www.linuxtechi.com/install-virtualbox-guest-additions-on-ubuntu/)
+ [How to set up the shared folders in VirtualBox](https://docs.oracle.com/en/virtualization/virtualbox/6.0/user/sharedfolders.html)

For Windows, besides the VirtualBox, you also can use ``wsl`` to install Ubuntu. But the process is relatively complex. 
If you use ``wsl``, you also need to install and set up ``Xming``.
You may refer the following documents to install ubuntu in ``wsl`` and ``Xming``:

+ [Install wsl distro](https://vpraharsha3.medium.com/installing-wsl-distro-to-a-different-custom-location-30d101f04113)
+ [Install and set up Xming](https://www.uwyo.edu/data-science/resources/knowledge-base/x11-with-windows-subsystem-for-linux.html)

For studnets who are in mainland China, 你需要使用内地的apt源，否则后续安装可能失败！参考：[清华大学ubuntu | 镜像站使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/)。

In order to use tools in Linux system, you must know some basic knowledge about the Linux system. In Linux, a path is a string that specifies the location of a file or directory. There are two types of paths:

+ Absolute paths: An absolute path is a path that specifies the exact location of a file or directory, starting from the root directory (/). For example, ``/home/user/documents/file.txt`` is an absolute path that specifies the location of the file ``file.txt`` in the ``documents`` directory inside the ``home`` directory of the ``user`` account.
+ Relative paths: A relative path is a path that specifies the location of a file or directory relative to the current working directory. For example, ``documents/file.txt`` is a relative path that specifies the location of the file ``file.txt`` in the ``documents`` directory inside the current working directory.

To navigate to a different directory in Linux, you can use the cd command followed by the path of the directory:

```bash
cd /home/user/documents
```

You can use the pwd command to print the current working directory:

```bash
pwd
```

You can use the ls command to list all files in the current working directory:

```bash
ls
```

Here are two import relative paths of linux:

+ ``.``: The current directory.
+ ``..``: The parent directory of the current directory

For example, if my folder structure is shown below, and my current location is in ``dir2``, then the relative path of the ``file12.ext`` file will be ``../dir1/file12.ext``, and the relative path of the ``file22.ext`` file will be ``./file22.ext``.

```bash
.
├── dir1
│   ├── file11.ext
│   └── file12.ext
├── dir2
│   ├── file21.ext
│   ├── file22.ext
│   └── file23.ext
├── dir3
├── file_in_root.ext
└── README.md
```

### 1.2. VSCode

You will use the [VSCode](https://code.visualstudio.com/) to write the verilog codes. You can use following steps to install VSCode in Ubuntu:

1. Go to [VSCode website](https://code.visualstudio.com/Download) and download **".deb"** package. 
2. In terminal, navigate to your download path, and then run

    ```bash
    sudo apt install ./<file>.deb
    ```

    If your ubuntu version is old and cannot use above command to install it, you can try 

    ```bash
    sudo dpkg -i <file>.deb
    sudo apt-get install -f
    ```
3. Open VSCode. In the left sidebar, you can find "Extensions". Click "Extensions". Search and install the extension "Verilog-HDL/SystemVerilog/Bluespec SystemVerilog".

### 1.3. Icarus Verilog & GTKWave

You can use following steps to install Icarus Verilog & GTKWave in Ubuntu:

```bash
sudo apt update
sudo apt install iverilog
sudo apt install gtkwave
```

### 1.4. verilator & OpenGL & Simple VGA Simulator

In our lab, we will use the "Simple VGA Simulator" to do the simulation in the virtual development board. This "Simple VGA Simulator" requires verilator & OpenGL. In Ubuntu, you can use the following commands to install verilator & OpenGL:

```bash
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install verilator
sudo apt-get install libglu1-mesa-dev freeglut3-dev mesa-common-dev
```

Then, for "Simple VGA Simulator", you just need to go to [Simple-VGA-Simulator](https://github.com/pikipity/Simple-VGA-Simulator.git) and download the whole repository. All your need is in the ``sim`` folder. 

### 1.5 Python3 & VCDVCD (Optional)

In our lab, you may need to convert the vcd file to the csv file in order to access the simulation data. You can use your own way to do it. If you do not want to write your own program to do it, you can use my python program called "vcd2csv.py" in "Lab1/sim-wave" folder. In order to use this program, you need to install python3. 
I recommand using [Anaconda](https://www.anaconda.com/docs/getting-started/anaconda/install) or Conda to manage your python environments. You may check the following video to install Anaconda

+ [Installing Anaconda Distribution on Linux](https://www.youtube.com/watch?v=sU2mXjOB-fA)

After you install the Anaconda, you can use the following command to create an environment called "vcd2csv" and install python3:

```bash
conda create -n vcd2csv python=3
```

Then, you can go to this environment and install VCDVCD package by 

```bash
conda activate vcd2csv
pip install vcdvcd
```

### 1.6. GNU Octave (Optional)

GNU Octave is a scientific programming language for scientific computing and numerical computation. Octave helps in solving linear and nonlinear problems numerically, and for performing other numerical experiments using a language that is mostly compatible with Matlab. You may use GNU Octave to analyze data that you recorded from the simulations and plot corresponding waveforms. In Ubuntu, you can use the following commands to install Octave:

```bash
sudo apt-get update
sudo apt-get install octave
```

## 2. How to use Icarus Verilog & GTKWave to do simulations

You can use the Icarus Verilog to check your verilog syntax, compile your verilog codes, and do the simulation.

When you finish writing your verilog testbanch code, firstly, you need to check the syntax by following command:

```bash
iverilog <your verilog .v file> -t null -y <path of other RTL module files used in this testbanch>
```

After you make sure that your verilog file does not have syntax error, you can compile your codes and run the simulation by

```bash
iverilog <your verilog .v file> -o <output compiled file> -y <path of other RTL module files used in this testbanch>
vvp <output compiled file>
```

If you record your signals to the VCD dump file in the testbanch, you can use GTKwave to display these waves:

```bash
gtkwave <generated .vcd file>
```

## 3. How to use the virtual development board

In section 1.4, you already download "Simple-VGA-Simulator". 
All you need are ``DevelopmentBoard.v``, ``run_simulation.sh`` and ``simulator.cpp`` files in the ``sim`` folder. 
This virtual development board provides the VGA displayer, a reset button, 4 custom buttons, and 5 LEDs. The reset button is the key "a" on the keyboard. The other 4 custom buttons are keys "s", "d", "f", "g" on the keyboard.

When you need to run your simulation, you can follow these steps:

1. Put all your modules in one folder. This simulator does not support IP cores. You need to replace IP cores with your own designs.
2. Insert timescale `` `timescale 1ns / 1ns`` at the beginning of all your module files.
3. Edit ``DevelopmentBoard.v``. Instantiate your module and connect your module to the inputs and outputs of the ``DevelopmentBoard`` module. You can **NOT** edit the module head of the ``DevelopmentBoard`` module.
4. Run ``run_simulation.sh`` with the path of your modules. For example, if the relative path of your modules is ``../RTL``, you can use the following command:

    ```bash
    ./run_simulation.sh ../RTL
    ```