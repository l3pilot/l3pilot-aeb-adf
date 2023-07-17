# L3Pilot AEB Function

### Object detection

Object should only be considered from the point of time when the object is in the lane.

### AEB Warning

Single stage warning

### Relevant objects

  - Cars

  - Trucks

  - Trucks

  - Motorcycles

  - Pedestrian

  - Cyclist

### Calculations

TTC = Obj\_x/Obj\_v\_rel\_x

a\_required = (Obj\_v\_rel\_x \* Obj\_v\_rel\_x ) / (2 \* (Obj\_x-x\_remain));

x\_remain  = 0.5 m

### Brake Profile

![](.//media/braking_profile.png)

### Thresholds for standing still objects

|   **v**  **\[km/h\]**   |   **Warning**   |   **Braking**   |
| --- | --- | --- |
|   0   |   1.2   |   0.75   |
|   10   |   1.2   |   0.75   |
|   20   |   1.3   |   0.8   |
|   30   |   1.4   |   0.95   |
|   40   |   1.5   |   1.1   |
|   50   |   1.6   |   1.2   |
|   60   |   1.7   |   1.4   |
|   70   |   1.8   |   1.4   |
|   80   |   1.9   |   1.4   |
|   90   |   1.9   |   1.4   |
|   100   |   1.9   |   1.4   |
|   110   |   1.9   |   1.4   |
|   120   |   1.9   |   1.4   |
|   130   |   1.9   |   1.4   |
|   140   |   1.9   |   1.4   |
|   150   |   1.9   |   1.4   |
|   250   |   1.9   |   1.4   |


### Thresholds for moving objects

| **Delta v \[km/h\]** | **Warning** | **Braking** |
| -------------------- | ----------- | ----------- |
| 0                    | 1.2         | 0.85        |
| 10                   | 1.2         | 0.85        |
| 20                   | 1.3         | 0.9         |
| 30                   | 1.4         | 0.95        |
| 40                   | 1.5         | 1.1         |
| 50                   | 1.6         | 1.2         |
| 60                   | 1.7         | 1.3         |
| 70                   | 1.8         | 1.4         |
| 80                   | 1.9         | 1.5         |
| 90                   | 1.9         | 1.5         |
| 100                  | 1.9         | 1.5         |
| 110                  | 1.9         | 1.5         |
| 120                  | 1.9         | 1.5         |
| 130                  | 1.9         | 1.5         |
| 140                  | 1.9         | 1.5         |
| 150                  | 1.9         | 1.5         |
| 250                  | 1.9         | 1.5         |

### Thresholds for braking predecessor:

Multiply the TTC Threshold for moving objects with a factor of

F\_ax = max(\[1.0,-0.25\*(a\_x\_front+2)/2+1.2\])

With a\_x\_front = absolute acceleration of front vehicle
