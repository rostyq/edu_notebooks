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

dtime 1e-14

select all #
mass 195.084

calc T=200

clamp off
itemp T
scale 3.9231

select index 1457
set add 1
select keep on

# експеримент при T=0.1*T_пл
cmd 1000
write pdb ./out/exp_0.pdb
WRITE file ./out/exp_0.rdf RDF 100 2 7

# експеримент при T=1.5*T_пл
repeat 99
    itemp T
    cmd 200
    calc T=T+30
    write file +./out/exp_1.temp TEMP
end

write pdb ./out/exp_1.pdb