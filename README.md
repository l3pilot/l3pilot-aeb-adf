# l3pilot-adf-aeb

## Introduction

The ADF and AEB model were build up during the L3Pilot project to investigate the effect of automated driving in the (safety) impact assessment. The functions do not represent any real function but were inspired by the ADF of the L3Pilot project. Nevertheless, both functions are reduced their complexity to allow for the simulation. 

Involved in the definition and implementation of the functions were L3Pilot colleagues of the impact assessment team, namely Hendrik Weber, Johannes Hiller, Julian Schatz, Thomas Streubel, and Felix Fahrenkrog.
The team was supported by Yves Page, Thierry Hermitte and Elina Aittoniemi.

## Format

The models are provided as MATALB Simulink file. The corresponding variables as MATLAB files.
The Simulink models that are provide were used as the basis to generate an fmu model of the functions. The signals used are oriented themselves at the signals defined for the fmu in openPASS (https://www.eclipse.org/openpass/content/html/user_guide/sim_user_guide/components/vehicle.html?highlight=fmu).

## Limitations

The AD and AEB function were defined in the L3Pilot project for the purpose of the impact assessment simulations with a focus on the traffic safety analysis. These functions represent a generic model that mimic the principles of an automated driving and an AEB function. However, they do not represent are realistic implementation of these functions that would operate safely in traffic. The models are only intended to be used in simulations. 

## License

The L3Pilot AD and AEB Function and all surrounding source code is published under the MIT license. Find more details in LICENSE.
We would however appreciate a short notice, feedback and maybe just general thoughts if you use the function.

## Contact

In case of questions regarding the format, feel free to contact Johannes Hiller (johannes.hiller@ika.rwth-aachen.de) or Felix Fahrenkrog (felix.fahrenkrog@bmw.de).

## L3Pilot

This project has received funding from the European Union's Horizon 2020 research and innovation programme under grant agreement No 723051. The sole responsibility of this publication lies with the author(s). The author(s) would like to thank all partners within L3Pilot for their cooperation and valuable contribution.
Additional information can be found on the website.
