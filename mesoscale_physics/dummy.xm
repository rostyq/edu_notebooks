read ../pot/Au_xmd.eam
# 'Melting point': '1337.33 K'
FILL BOUNDARY CYLINDER 5.2 7 10 10 10 1 0 0
fill particle 4 # FCC
1     0.0        0.0        0.0
1     0.5        0.0        0.5
1     0.5        0.5        0.0
1     0.0        0.5        0.5

fill align 10 10 10
fill cell
1 0 0
0 1 0
0 0 1
fill go

box 20 20 20

# Set initial temp variable
calc TEMP=535

# Set adiabatic simulation at starting temperature of 535K
dtime DTIME
clamp off

scale A0
select all
mass MASS

