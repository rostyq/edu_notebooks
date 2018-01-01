read ../pot/Pt_xmd.eam

box 8 8 8

fill particle 4
1     0.0        0.0        0.0
1     0.5        0.0        0.5
1     0.5        0.5        0.0
1     0.0        0.5        0.5

fill align 8 8 8
fill orient 1 0 0  0 1 0  0 0 1
fill go

dtime $3

select all #
mass 195.084

calc T=200

clamp $1
itemp $1
scale 3.9231

select index 14571
set add 1
select keep on


cmd $4
write pdb ./out/exp_$2.pdb
WRITE file ./out/exp_$2.rdf RDF 100 2 7