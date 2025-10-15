# Lab 1

Lab 1 shows you how to use Icarus Verilog, GTKwave and virtual developmentboard to do simulations. 
After you finish writing all RTL modules in ``RTL`` folder and the testbanch file ``tb_led.v`` in ``sim-wave`` folder. Open your terminal, and use the following steps to do the simulation.

1. Go into the ``sim-wave`` folder, and then check the syntax by the following command. If there are errors, fix them!!

    ```bash
    iverilog ./tb_led.v -t null -y ../RTL
    ```

2. Compile the testbanch and run the simulation:

    ```bash
    iverilog ./tb_led.v -o ./tb_led -y ../RTL
    vvp ./tb_led
    ```

3. Because, in the provided testbanch code, I already mentioned the VCD dump file, Signals of all variables in this testbench have been recorded in ``signals_tb_led.vcd`` file. You can use GTKWave to check them:

    ```bash
    gtkwave ./signals_tb_led.vcd
    ```

4. Because, in GTKWave, it is difficult to access and compare data values as well as export figures, you may need other software to do the analysis and plot. However, most other softwares cannot read VCD file directly. Normally, we first convert the VCD file to the CSV file, and then import to other softwares. You can use my ``vcd2csv.py`` to the conversion. First, if you use Conda, you need to activate the python environment where Python3 and VCDVCD are installed. Then, use the following command:

    ```bash
    python vcd2csv.py -i ./signals_tb_led.vcd -o ./output.csv
    ```

    You can use Octave or Excel to analyze and plot them. Note: The VCD file only recod data when the corresponding variables are changed, so you cannot directly link all points to plot signals. You need to plot them as the step chart. You may refer [Create a step chart in Excel | Excel Off The Grid | The fastest way](https://www.youtube.com/watch?v=mWpSVuxKcx8) to know how to plot signals.

5. After you believe that your modules work well based on the analysis of waveforms in step 4, you can try your modules in the virual development board. Go into the ``sim-developmentboard`` folder. ``DevelopmentBoard.v``, ``run_simulation.sh`` and ``simulator.cpp`` files in "Simple-VGA-Simulator" have already been copied. In addition, ``DevelopmentBoard.v`` has already been edited. You can directly run the virual development board by

    ```bash
    ./run_simulation.sh ../RTL
    ```

    Waiting a few seconds, you will see the virual development board. At the begnning, the LED 1 is turned off. When you press "s" in the keyboard, the LED1 will be turned on. When you release "s", the LED1 will be turned off again. 