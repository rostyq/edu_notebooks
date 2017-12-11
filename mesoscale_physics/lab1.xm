read ../pot/nial.txt

box 7 7 7

fill particle 1
1 0.0 0.0 0.0
2 0.5 0.5 0.5

fill align 7 7 7
fill orient 1 0 0  0 1 0  0 0 1
fill go

dtime DTIME

select type 1 #
mass MASS1

select type 2 #
mass MASS2

select box 2.3 2.3 2.3 2.7 2.7 2.7
remove select

fill boundary box 2.7 2.3 1.3 3.2 2.6 1.6
fill particle 1
2 3 2.5 1.5
fill go


select all
scale 2.8863

clamp off
itemp 300

write pdb lab1.pdb
repeat 100
	cmd 10
	write pdb +lab1.pdb
end