#!/bin/bash
lookFor="name TechRequired entryCost cost"
for i in *.cfg; do
	idx=0
	for l in $lookFor; do
		f=`grep -m 1 $l $i | cut -f2 -d'='`
		far[$idx]=$f
		idx=$((idx+1))
	done
	echo -n "${i},"
	for n in `seq 0 $idx`; do
		echo -n ${far[$n]}
		echo -n ","
	done
	modules=`grep ' Module' $i | grep 'name =' | cut -f2 -d'=' | sort -u`
	for m in $modules; do
		echo -n "${m},"
	done

	echo -ne "\n"
done
	
