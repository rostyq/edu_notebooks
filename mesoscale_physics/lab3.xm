read ../pot/Au_xmd.eam
# 'Melting point': '1337.33 K'
FILL BOUNDARY CYLINDER $1 $2 $3 $4 $5 1 0 0
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

box 40 40 40

# Set initial temp variable
calc TEMP=535

# Set adiabatic simulation at starting temperature of 535K
dtime 9e-15
clamp off

scale A0
select all
mass MASS

itemp TEMP
cmd 200

eunit eV
ESAVE 100 lab3_$6.energy

# Do 100 separate runs of 100 steps each
repeat 200
    itemp TEMP
    cmd 100
    WRITE PDB +lab3_$6.pdb
    WRITE FILE +lab3_$6.temperature TEMP
    calc TEMP=TEMP+10
end