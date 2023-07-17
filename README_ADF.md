# L3Pilot Mature ADF Function

## Sensor Set up

![](.//media/sensor_setup.png)

| **ID** | **Name**          | **Range**   | **Location   x** | **Location y** | **Orientation** |
| ------ | ----------------- | ----------- | ---------------- | -------------- | --------------- |
| 1      | Front Long        | 200 m       | 0 m              | 0 m            | 0               |
| 2      | Front Short       | 60 m        | a \~ 1.5 m       | 0 m            | 0               |
| 3      | Rear Long 1       | 200 m       | c = L            | d = B/2        | 8°              |
| 4      | Rear Long 2       | 200 m       | c = L            | \-d = B/2      | \-8°            |
| 5      | Close surrounding | Radius 10 m | b = L/2          | 0 m            | N/A             |

![](.//media/sensor_setup2.png)

## Overview ADF

The following figure presents an overview of the ADF implementation in Simulink:

![](.//media/controller.png)

## Longitudinal Control

The basic concept relies on a simple ACC controller which is enhanced by special control for speed limits and an AEB component.

**Parameter for longitudinal control**

| **Parameter**                                | **Description**                                    | **Value**                | **L3Pilot input** |
| -------------------------------------------- | -------------------------------------------------- | ------------------------ | ------------------ |
| Distance at standstill                       | Distance between to vehicle standing still         | 2 m                      |                    |
| Time headway                                 | Time headway to lead vehicle                       | 1.6 s (1.4 s or  2 s)    | X                  |
| THW at reaction to lead vehicle              | Start of reaction to slower lead vehicle           | \-8 s or sensor range    |                    |
| Long Oscillation while Following             | Continuous Variation of distance keeping behaviour | none                     |                    |
| Acceleration from standstill                 | Target acceleration from standstill                | 3,5 m/s² → To be checked | X                  |
| Target acceleration 80 km/h                  | Target acceleration at 80 km/h                     | 1,5 m/s²                 | X                  |
| Deceleration normal                          |                                                    | According to ACC (3m/s²) | X                  |
| Deceleration in case of target at standstill |                                                    | 3 m/s²                   | X                  |

**ACC Cascaded controller:**

The ACC controller bases on K. Naab (1999) “Driver Assistance in longitudinal and lateral vehicle guidance” at EUROMOTOR Seminar on Telematik/Vehicle and Environment

![](.//media/acc_controller.png)

P-Controller Distance:

- dv\_des = K\_d (timegap \* v\_current + dx\_min - dx\_current)

P-Controller Target acceleration to keep distance:

- a\_des\_d = K\_v1 \* (dv\_current - dv\_des)

P-Controller Target acceleration to keep desired speed:

- a\_des\_v = K\_v2 \* (v\_requested - v\_current)

Target acceleration chosen:

- a\_des\_f = min(a\_des\_d, a\_des\_v)

Saturate target acceleration:

if abs(a\_des\_f) \> a\_max:  a\_des\_f = a\_max\*sign(a\_des)

PI controller for acceleration:

- a\_des = a\_des\_f + (a\_des\_f - a\_current) \* (K\_p + K\_i \* T) + I\_old

Starting values

| **Value** | **0-60 km/h** | **60-100 km/h** | **100-130 km/h** | **L3Pilot input**         |
| --------- | ------------- | --------------- | ---------------- | -------------------------- |
| ax\_limit | (3 ; -3)      | (3 ; -3)        | (3 ; -3)         | x (parameter optimization) |
| Kd        | 0.1           | 0.09            | 0.08             | x (parameter optimization) |
| KI        | 1             | 1               | 1                | x (parameter optimization) |
| KP        | 0.1           | 0.1             | 0.1              | x (parameter optimization) |
| Kv1       | 0.1           | 0.1             | 0.1              | x (parameter optimization) |
| Kv2       | 0.2           | 0.2             | 0.2              | x (parameter optimization) |

**Control for speed limit:**

- In case the vehicle approaches a lower speed limit, the vehicle should decelerate in way that the speed at the new sign is equal or lower than the given speed limit.

- The earliest point of time at which the vehicle starts to decelerate is 180 m before the speed limit. The maximum deceleration is 1.7 m/s². The vehicle should start to decelerate once the required deceleration exceeds 0.5 m/s².

- In case the vehicle approaches a higher speed limit, the velocity of the vehicle should be kept until the vehicle has passed the new speed limit sign.

In emergency cases the AEB function will kick in. For more details see the L3Pilot AEB function.

## Minimum Risk Manoevure:

The following strategy is defined:

| **Situation** |**Description**                                                                                                                                           | **Value**         |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------- |
| Not Critical  | In case of a not critical situation (TTC \>   3 s) the vehicles decelerates during an active MRM with constant deceleration   of x m/s²                   | ax = -2 m/s²      |
| Critical      | In case of a critical situation (TTC \< 3 s)   the vehicles decelerates during an active MRM with constant deceleration of max\[ax\_requried,   -5\] m/s² | ax\_max = -5 m/s² |

## Strategy for lane change decision

- Driver whenever possible in the right lane (no lane changes to the left if not relevant)

- Decision on lane change:

|   Criteria   |   Description   |   Value   |
| --- | --- | --- |
|   Start Lane change   |   The ADF should initiate only in case in which   the Ego-vehicle is more than x kph slower as the desired velocity or the   current give speed limit   |   X:  Dv >10.8 kph   |
|   Driving in the right lane   |   The ADF should initiate a lane change to the   right in case the THW in the right lane is larger than x s.   |   X:  THW > 8 s   |
|   Other vehicle with low speed difference   |   The ADF should not conduct or abort a lane change   in case another vehicle is max(x, y) behind or in front of the ego-vehicle   |   X:  Dxmin = 10 m  Y: THWmin = 1 s   |
|   Fast approaching other vehicle   |   The ADF should not conduct or abort a lane change   in case another vehicle is max(x, y) behind or in front of the ego-vehicle and   the required deceleration of the other vehicle exceeds a value z.   |   X:  Dxmin = 10 m  Y: THWmin = 1 s  Z  \-a\_OV = -2 m/s²   |
|   Duration between lane change   |   The duration between two lane changes should   be at least x s.   |   X: t = 15 s   |

### Lateral Control

**Control within the lane:**

- Lateral Control is up to the tool. However, the implementation should consider the following requirements:

  - Control within the lane: Keep the vehicle in the center of the lane.

  - Offset in the lane while normal car following should 0 m

  - Evasive maneuvers are not considered for the L3Pilot mature ADF.

  - Lane change (start of manoeuvre up to finishing manoeuvre) to time should be X s (e.g., 6 - 7 s)
