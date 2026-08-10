# Development of a DWMR Prototype for Control Strategy Implementation Using an Actuator Voltage Command Enhancement Technique

<img width="5955" height="4195" alt="Graphical Abstract-v2 0" src="https://github.com/user-attachments/assets/ae723816-14bb-49b2-9351-a8f892852e0d" />

Supplementary Resources and Documentation for the Article “Development of a DWMR Prototype for Control Strategy Implementation Using an Actuator Voltage Command Enhancement Technique” Published in IEEE Latin America Transactions.

# Files and Folders Organization

**MatlabSimulink folder**: contains all Matlab and Simulink files, including the scripts and models used for both simulation and real-time execution of the control system on the platform, which consists of a Raspberry Pi and ATmega328P, while being monitored from a PC running Matlab.

<ol>
  <li><code>Graficos.m</code>: Main script used to generate the various figures presented in the article.</li>
  <li><strong>Evaluations folder</strong>: contains several folders with the files required for kinematic and dynamic control simulations and for implementing the corresponding control systems on the prototype.</li>
    <ol>
      <li>Cinematic_real_180</li>
      <li>Cinematic_real_180_no_linearization</li>
      <li>Cinematic_simulation_180</li>
      <li>Dinamic_real_8</li>
      <li>Dinamic_real_180</li>
      <li>Dinamic_real_180_no_linearization</li>
      <li>Dinamic_simulation_8</li>
      <li>Dinamic_simulation_180</li>
    </ol>
  </ol>

These folders have similar names and contents. The folder name is composed of terms that indicate the control strategy, the execution mode (simulation or real experiment), and the trajectory type. The prefix <code>kinematic</code> refers to the control system based on the kinematic model, whereas the prefix <code>dynamic</code> refers to the control system based on the dynamic model. The term <code>real</code> denotes the implementation of the control system on the embedded platform, while <code>simulation</code> refers to simulations performed using the theoretical mathematical model. Two trajectories are provided, identified by the following suffixes: <code>180</code>, corresponding to the smooth 180° curve, and <code>8</code>, corresponding to the infinity-shaped trajectory.

The folders containing the term <code>real</code> implement duty-cycle linearization, except for those with the suffix <code>no_linearization</code>. In contrast, the simulation models contained in the simulation folders use voltage-level control signals and therefore do not model PWM signals, as explained in the article.

The folders contain similar files and differ only in whether they are intended for simulation (simulation) or real implementation (real), as described below.
<ol>
  <li><strong>Simulation folders (‘simulation’):</strong></li>
    <ol>
     <li><code>aquisicao_dados_modelo_matematico.m</code>: script used to save simulation data to a .mat file.</li>
     <li><code>graficos.m</code>: script for generating plots from .mat files containing simulation experimental data.</li>
     <li><code>modelo_matematico.slx</code>: Simulink model containing the block diagram of the robot model used for simulation.</li>
     <li><code>modelo-Matematico_25-Month-Year_Day-Hour-Minute.mat</code>: simulation data file used for subsequent plot generation.</li>
     <li><code>script_principal.m</code>: script used to configure parameters and run the robot simulation based on the mathematical model.</li>
     <li><code>trajetoria_trajectory_name.m</code>: file containing the reference trajectory used in the simulations.</li>
    </ol>
    
  <li><strong>Implementation folders (‘real’):</strong></li>
    <ol>
      <li><code>aquisicao_dados_modelo_real.m</code>: Script used to save experimental data from the prototype.</li>
     <li><code>graficos.m</code>: script for generating plots from .mat files containing experimental data.</li>
     <li><code>modelo_real.slx</code>: Simulink model containing the control system to be deployed on the prototype.</li>
     <li><code>modelo-Real_25-Month-Year_Day-Hour-Minute.mat</code>: experimental data file used for subsequent plot generation.</li>
     <li><code>script_principal.m</code>: Script used to configure the robot parameters and perform the prototype experiment. The file is already configured for experimental execution and loads the previously configured trajectory.</li>
     <li><code>trajetoria_trajectory_name.m</code>: Reference trajectory file used in the experiments.</li>
  </ol>
</ol>

The <code>ProjectImages</code> folder contains several diagrams and schematics related to the prototype, including mechanical dimensions, communication port configurations, the Simulink block diagram, and an overall view of the prototype.


The <code>Prototype_ATmega</code> folder contains the C source code for the ATmega328P microcontroller.

# Requirements * 

Matlab 2018b or later, Simulink with the following Matlab official toolboxes: cstblocks and cstextras (Control System Toolbox) e dspmtrx3 (DSP System Toolbox).


# Instructions for Running the Simulation and Experimental Platform * 

To run the simulations, execute the <code>script_principal.m</code> file located in the folder <strong>MatlabSimulink/Evaluations/Name_simulation_trajectory_type</strong>.

To perform the prototype experiment with the control system deployed on the Raspberry Pi of the proposed platform:
*	Configure the Simulink Support Package for Raspberry Pi Hardware in Simulink.
*	On the Raspberry Pi, configure the network communication parameters (IP address and TCP port) and enable SSH (Secure Shell).
*	In the Simulink model configuration, select Raspberry Pi as the target hardware, set the solver to fixed-step with an infinite simulation time, enable External Mode using the TCP/IP interface, and run the model once to setup the deploy.
*	Run the <code>script_principal.m</code> file located at <strong>MatlabSimulink/Evaluations/Name_real_trajectory_type</strong>.

The Simulink model used in the experiments assumes the prototype configuration described in the article, including the Raspberry Pi, ATmega328P, DSN6000AUD Buck-Boost regulators, LM317 voltage regulator, and FC-03 optical encoder module.

To generate the figures presented in the article, execute the script <code>MatlabSimulink/graficos.m</code>. The script loads .mat files containing results from previous experiments and simulations. These files can be replaced by new datasets by modifying the file path and name in the <code>load()</code> function.


# Screenshots #


