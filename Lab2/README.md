# Lab 2

In these experiments, students are required to practice the top-down design and practice implementing sequential logic.  

## 2-1. Top-down design
Use two half adders to implement a full adder. This full adder contains
+ 3 buttons as 3 individual inputs:
  + Use KEY1 in the development board as the 1st input, which is the addend.
  + Use KEY2 in the development board as the 2nd input, which is the augend.
  + Use KEY3 in the development board as the 3rd input, which is the carry-on bit from the lower bit.
+ Use LED1 in the development board as the carry-on bit output.
+ Use LED0 in the development board as the sum bit output.

## 2-2. Avoid latch
In this experiment, we several methods to implement 3-8 line decoder. The implementations are separated into following 3 conditions. Each condition shows one possible reason of introducing latches. Compare different implementations to find the problems of using latches. 

+ Use “if” condition with and without “else”
+ Use “case” condition with and without full conditions
+ Assign output variables to themselves in combinational logic

## 2-3. Compare flip-flops with synchronized and asynchronized reset
Implement a flip-flop with the synchronized reset signal and a flip-flop with the synchronized reset signal. These flip-flops both contain
+ Use REST KEY as the reset button
+ Use KEY1 as the input button
+ Use LED0 as the output

