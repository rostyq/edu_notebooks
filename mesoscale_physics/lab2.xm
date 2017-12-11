read ../pot/Pt_xmd.eam

box 7 7 7

fill particle 4
1     0.0        0.0        0.0
1     0.5        0.0        0.5
1     0.5        0.5        0.0
1     0.0        0.5        0.5

fill align 7 7 7
fill orient 1 0 0  0 1 0  0 0 1
fill go

dtime 3.5e-15

select all #
mass 195.084

clamp $1
itemp $1
scale 3.9231

select index 685
set add 1
select keep on

repeat 400
	cmd 10
	select set 1
	write file +lab2_pos_vel_$1.txt sel posvel
	#write pdb +lab2.pdb
end