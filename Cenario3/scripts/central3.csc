loop
set pef C
wait
read v
rdata $v wifi1 n_wifi1 temp1 tempMin1 tempMax1 per_iluminacao1
wait
read s1
rdata $s1 wifi2 n_wifi2 temp2 tempMin2 tempMax2 per_iluminacao2
if($pef == C)
	set total1 0
	set total2 0
	set numSenR1 7
	set numSenR2 7
	set distance1 1366
	set distance2 927
	div n_wifi1 $n_wifi1 $numSenR1
	mult n_wifi1 $n_wifi1 100
	div n_wifi2 $n_wifi2 $numSenR2
	mult n_wifi2 $n_wifi2 100
	div per_iluminacao1 $per_iluminacao1 $numSenR1
	mult per_iluminacao1 $per_iluminacao1 100
	div per_iluminacao2 $per_iluminacao2 $numSenR2
	mult per_iluminacao2 $per_iluminacao2 100
	if($wifi1 > 2)
		plus total1 $total1 30
	end
	if($distance1 > 700)
		plus total1 $total1 10
	end
	if($per_iluminacao1 > 80)
		plus total1 $total1 30
	end
	if($n_wifi1 > 80)
		plus total1 $total1 20
	end
	if(($tempMin1>16) && ($tempMax1<24))
		plus total1 $total1 10
	end
	if($wifi2 > 2)
		plus total2 $total2 30
	if($distance2 > 700)
		plus total2 $total2 10
	end
	if($per_iluminacao2 > 80)
		plus total2 $total2 30
	end
	if($n_wifi2 > 80)
		plus total1 $total2 30
	end
	if(($tempMin2>16) && ($tempMax2<24))
		plus total2 $total2 10
	end
	print $total1 $total2  $n_wifi1 $n_wifi2
	if($total1 > $total2)
	data d B SENSOR25 route5
		send $d 120
	else
	data d B SENSOR25 route6
		send $d 120
	
end