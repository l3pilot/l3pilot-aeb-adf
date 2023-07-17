% Values for the ADF Simulation
clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Tabt = 0.1;         


Mode_ACC = 0;
Abstand_einstellung = 1;
Set_velocity =60/3.6;

ACC_v_set =Set_velocity;

Sensorrange = 250;

Minimum_risk = 1;

t_MRM = 100000;
if Minimum_risk==1
    t_MRM = 60;    
end
t_takeover = 70;

Number_lanes = 2;

a_x_MRM_normal = 2;
a_x_MRM_critical = 5;


% ACC Values
K_d_value_60 = 0.1; %0.1
K_v1_value_60 = 0.1; %0.1
K_v2_value_60  =0.2; %0.1
K_p_value_60 = 0.1; %0.1
K_i_value_60 = 1; %1

K_d_value_100 = 0.09; %0.1
K_v1_value_100 = 0.1; %0.1
K_v2_value_100  =0.2; %0.1
K_p_value_100 = 0.1; %0.1
K_i_value_100 = 1; %1

K_d_value_130 = 0.08; %0.1
K_v1_value_130 = 0.1; %0.1
K_v2_value_130  =0.2; %0.1
K_p_value_130 = 0.1; %0.1
K_i_value_130 = 1; %1

x_LC_Forced_value = 99999;
Distance_forced_lane_change = 10;

t_false_braking = 9999.01;
t_duration_false_braking=0.1;
a_x_false_braking=-2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


