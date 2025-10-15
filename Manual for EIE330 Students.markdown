# Manual for EIE330 Students

## 1. Required Tools

You must install all required tools before joining our labs. Here is the list of tools that you must install:

+ [Icarus Verilog](https://zh.wikipedia.org/wiki/Icarus_Verilog)
+ [GTKWave](https://gtkwave.sourceforge.net/)
+ [verilator](https://www.veripool.org/verilator/)
+ [OpenGL](https://www.opengl.org/)
+ [Simple VGA Simulator](https://github.com/pikipity/Simple-VGA-Simulator.git)
+ [vscode](https://code.visualstudio.com/)

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

