read ../pot/Au_xmd.eam
# 'Melting point': '1337.33 K'

### VARIABLES ###
# $1 - T
# $2 – length/diameter
# $3 - deformation
# $4-$6 x1,x2,x3
# $7-$9 y1,y2,y3

calc T=$1
calc D=5.0
calc L=D*$2
calc WS=3
calc xc=L*($3+2)
calc yc=D*4
calc zc=D*4
calc Bx=XC*2
calc By=YC*2
calc Bz=ZC*2

calc Velosity=50*20

calc dt=1e-15

calc allTime=$3*L*1e-8/Velosity
calc AllSteps=allTime/dt
write AllSteps

### CODE ###
FILL BOUNDARY CYLINDER D/2 L+2*WS xc yc zc 1 0 0 # WS = length/diameter
fill particle 4 # FCC
1     0.0        0.0        0.0
1     0.5        0.0        0.5
1     0.5        0.5        0.0
1     0.0        0.5        0.5

fill align xc yc zc
fill cell
1 0 0
0 1 0
0 0 1
fill orient $4 $5 $6 $7 $8 $9 ($5*$9-$6*$8) ($6*$7-$4*$9) ($4*$8-$5*$7)
# X axis Y axis Z axis
fill go

select all
mass MASS
itemp T
clamp T
eunit K
dtime dt

select box 0 0 0 xc-L/2 By Bz
set add 1

select box xc+L/2 0 0 Bx By Bz
set add 2

box Bx By Bz
scale A0

WRITE PDB lab5.pdb

ssave 200 lab5.stress #запис напружень в зразку

calc dk=dt*Velosity*1e10

select set 1
FIX on

select set 2
FIX on

select all

repeat allsteps/200
    repeat 1
        cmd 200
        select set 1
        FIX off
        move -dk 0 0
        FIX on
        select set 2
        FIX off
        move +dk 0 0
        FIX on
    end
    WRITE PDB +lab5.pdb
end