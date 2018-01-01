read ./pot/Pt_xmd.eam

box 8 8 8

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

calc T=200

clamp off

scale 3.9231

select index 1457
set add 1
select keep on

repeat 100
    itemp T
    cmd 200
    calc T=T+30
    write file +lab4_1.temp TEMP
end

write pdb +lab4_1.pdb
WRITE file +lab4_1.rdf RDF 160 2 18