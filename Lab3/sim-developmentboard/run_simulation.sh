#!/bin/bash

# 用法: ./run_simulation.sh [include_directory_path]

# 获取脚本所在的绝对路径
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# 设置默认路径为脚本所在目录
DEFAULT_INCLUDE_DIR="$SCRIPT_DIR"

# 检查用户是否提供了路径参数
if [ $# -eq 0 ]; then
    # 用户没有提供参数，使用脚本所在路径
    INCLUDE_DIR="$DEFAULT_INCLUDE_DIR"
    echo "NOTE: No include directory path is provided, the directory where the script is located is used: $INCLUDE_DIR"
else
    # 用户提供了参数，使用用户指定的路径
    INCLUDE_DIR="$1"
    
    # 检查用户提供的路径是否存在
    if [ ! -d "$INCLUDE_DIR" ]; then
        echo "Error: '$INCLUDE_DIR' does not exist"
        echo "Tip: You can use the directory where the script is located without providing any parameters, or provide a valid directory path"
        exit 1
    fi
fi

echo "Start simulation..."
echo "Include directories used: $INCLUDE_DIR"

# 检查必要的文件是否存在
if [ ! -f "simulator.cpp" ]; then
    echo "Error: simulator.cpp does not exist in the current directory"
    exit 1
fi

if [ ! -f "DevelopmentBoard.v" ]; then
    echo "Error: DevelopmentBoard.v does not exist in the current directory"
    exit 1
fi

echo "---------------------------------"
echo "Step 0: Clean up previously generated files..."
OBJ_DIR="obj_dir"

if [ -d "$OBJ_DIR" ]; then
    echo "Remove $OBJ_DIR ..."
    if rm -rf "$OBJ_DIR"; then
        echo "✓ Sucessfully remove $OBJ_DIR "
    else
        echo "Warning: Problem encountered while deleting $OBJ_DIR folder, but continuing the process..."
    fi
else
    echo "Tip: The $OBJ_DIR folder does not exist, no need to clean it up"
fi


# 第一步：使用Verilator编译Verilog代码
echo "---------------------------------"
echo "Step 1: Run Verilator Compiler..."
VERILATOR_OUTPUT=$(verilator -Wall --cc --exe -I"$INCLUDE_DIR" simulator.cpp DevelopmentBoard.v -LDFLAGS -lglut -LDFLAGS -lGLU -LDFLAGS -lGL)
VERILATOR_EXIT_CODE=$?

echo "$VERILATOR_OUTPUT"

# 检查Verilator是否成功执行
if [ ! -f "obj_dir/VDevelopmentBoard.mk" ]; then
    echo "Error: Verilator compilation failed!"
    echo "Possible causes:"
    echo "1. Not provide correct path of RTLs"
    echo "2. Verilator is not installed (install command: sudo apt install build-essential verilator)"
    echo "3. OpenGL/GLUT is not installed (install command: sudo apt install libglu1-mesa-dev freeglut3-dev mesa-common-dev)"
    echo "4. The code contains syntax errors"
    exit 1
fi

echo "✓ Verilator compilation completed successfully!"

# 第二步：构建仿真可执行文件
echo "---------------------------------"
echo "Step 2: Build the simulation executable..."
make -j -C obj_dir -f VDevelopmentBoard.mk VDevelopmentBoard

# 检查make是否成功构建
if [ $? -ne 0 ]; then
    echo "Error: Make build failed!"
    echo "Please check the compilation error message above"
    exit 1
fi

echo "✓ Simulation executable file built successfully!"

# 第三步：运行仿真
echo "---------------------------------"
echo "Step 3: Start the simulation..."
echo "----------------------------------------"
obj_dir/VDevelopmentBoard

# 检查仿真是否成功运行
SIMULATION_EXIT_CODE=$?
echo "----------------------------------------"

if [ $SIMULATION_EXIT_CODE -ne 0 ]; then
    echo "WARNING: Simulation execution exit code: $SIMULATION_EXIT_CODE"
else
    echo "✓ Simulation execution completed!"
fi