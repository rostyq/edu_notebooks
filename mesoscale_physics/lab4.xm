read ../pot/Pt_xmd.eam

box 9 9 9

fill particle 4
1     0.0        0.0        0.0
1     0.5        0.0        0.5
1     0.5        0.5        0.0
1     0.0        0.5        0.5

fill align 8 8 8
fill orient 1 0 0  0 1 0  0 0 1
fill go

dtime 1e-14

select all #
mass 195.084

clamp $1
itemp $1
scale 3.9231

select index 14571
set add 1
select keep on

cmd 1000
#write file +lab2_pos_vel_$1.txt sel posvel
write pdb +lab4_$2.pdb
WRITE file +lab4_$2.rdf RDF 160 2 18