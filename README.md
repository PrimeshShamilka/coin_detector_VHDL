# coin_detector_VHDL

### Problem

You are required to design a coin type detector of a vending machine that accepts three types of
coins as the payment. Rs. 1, Rs. 2 and Rs. 5 are the three types of coins. Three light sensors are used
in combination to detect the type of the coin. Figure 1 below shows how the light sensors (DX, DY
and DZ) are positioned to identify the coins when the coins are rolling down the channel of the
vending machine.

<img src="https://github.com/PrimeshShamilka/coin_detector_VHDL/blob/main/images/fig1.png" width="400">


The timing diagram for the signals X, Y and Z generated from the three detectors DX, DY and DZ are
given in Figure 2. The example timing diagram is the output when Rs. 1, Rs. 5 and Rs. 2 coins are
respectively fed into the machine in that order. The detectors are positioned in such a way that only
the waveforms X, Y, Z as shown are possible.

<img src="https://github.com/PrimeshShamilka/coin_detector_VHDL/blob/main/images/fig2.png" width="400">

A synchronous Finite State Machine (FSM) is used to generate the three output signals P1, P2 and P5
is used indicate the type of coin being detected as shown in Figure 3.

<img src="https://github.com/PrimeshShamilka/coin_detector_VHDL/blob/main/images/fig3.png" width="400">

You may assume that a clock signal of suitably high frequency is used for the synchronous circuit.
In addition, the detectors are arranged in such a way that, </br>

- Rising edge of Z is at least one clock cycle before Y.
- Rising edge of Y is at least one clock cycle before X.

When a coin is detected, one of the three outputs goes high shortly after the falling edge of Z for one
clock period. You may assume that there are only three types of coins used in the vending machine
and only one coin can roll down the channel at any one time.

### Solution

#### Mealy state chart diagram (key = ZYX/P1P5P2)

<img src="https://github.com/PrimeshShamilka/coin_detector_VHDL/blob/main/images/FSM_one_hot.jpg" width="400">

#### State transition table

<img src="https://github.com/PrimeshShamilka/coin_detector_VHDL/blob/main/images/table.png" width="800">


### Simulation

<img src="https://github.com/PrimeshShamilka/coin_detector_VHDL/blob/main/images/simulation_one_hot.PNG" width="800">
