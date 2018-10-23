loop
set pef A
wait
read v
rdata $v wifi1 n_wifi1 temp1 tempMin1 tempMax1 per_iluminacao1
wait
read s1
rdata $s1 wifi2 n_wifi2 temp2 tempMin2 tempMax2 per_iluminacao2
wait
read s2
rdata $s2 wifi3 n_wifi3 temp3 tempMin3 tempMax3 per_iluminacao3
if($pef == A)
	set total1 30
	set total2 30
	set total3 30
	set numSenR1 5
	set numSenR2 6
	set numSenR3 6
	set distance1 829
	set distance2 937
	set distance3 1047
	div n_wifi1 $n_wifi1 $numSenR1
	mult n_wifi1 $n_wifi1 100
	div n_wifi2 $n_wifi2 $numSenR2
	mult n_wifi2 $n_wifi2 100
	div n_wifi3 $n_wifi3 $numSenR3
	mult n_wifi3 $n_wifi3 100
	div per_iluminacao1 $per_iluminacao1 $numSenR1
	mult per_iluminacao1 $per_iluminacao1 100
	div per_iluminacao2 $per_iluminacao2 $numSenR2
	mult per_iluminacao2 $per_iluminacao2 100
	div per_iluminacao3 $per_iluminacao3 $numSenR3
	mult per_iluminacao3 $per_iluminacao3 100
	if($temp1 > 13)
		plus total1 $total1 15
	end
	if($wifi1 > 2)
		plus total1 $total1 12
	end
	if($distance1 < 1500)
		plus total1 $total1 10
	end
	if($n_wifi1 > 70)
		plus total1 $total1 8
	end
	if(($tempMin1>12) && ($tempMax1<17))
		plus total1 $total1 25
	end
	if($temp2 > 13)
		plus total2 $total2 15
	end
	if($wifi2 > 2)
		plus total2 $total2 12
	end 
	if($distance2 < 1500)
		plus total2 $total2 10
	end
	if($n_wifi2 > 70)
		plus total1 $total2 8
	end
	if(($tempMin2>12) && ($tempMax2<17))
		plus total2 $total2 25
	end
	if($temp3 > 13)
		plus total3 $total3 15
	end
	if($wifi3 > 2)
		plus total3 $total3 12
	end 
	if($distance3 < 1500)
		plus total3 $total3 10
	end
	if($n_wifi3 > 70)
		plus total3 $total3 8
	end
	if(($tempMin3>12) && ($tempMax3<17))
		plus total3 $total3 25
	end
	print $total1 $total2 $total3
	if(($total1 > $total2) && ($total1 > $total3))
		data d B SENSOR25 route2
		send $d 30
	end
	if(($total2 > $total1) && ($total2 > $total3))
		data d B SENSOR25 route2
		send $d 30
	else
		data d B SENSOR25 route2
		send $d 30
	end
end