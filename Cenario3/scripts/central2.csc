loop
set pef B
wait
read v
rdata $v wifi1 n_wifi1 temp1 tempMin1 tempMax1 per_iluminacao1
wait
read s1
rdata $s1 wifi2 n_wifi2 temp2 tempMin2 tempMax2 per_iluminacao2
if($pef == B)
	set total1 25
	set total2 25
	set numSenR1 10
	set numSenR2 11
	set distance1 1906
	set distance2 2723
	div n_wifi1 $n_wifi1 $numSenR1
	mult n_wifi1 $n_wifi1 100
	div n_wifi2 $n_wifi2 $numSenR2
	mult n_wifi2 $n_wifi2 100
	div per_iluminacao1 $per_iluminacao1 $numSenR1
	mult per_iluminacao1 $per_iluminacao1 100
	div per_iluminacao2 $per_iluminacao2 $numSenR2
	mult per_iluminacao2 $per_iluminacao2 100
	if($temp1 > 21)
		plus total1 $total1 25
	end
	if($wifi1 > 3)
		plus total1 $total1 15
	end
	if($distance1 > 1500)
		plus total1 $total1 10
	end
	if($n_wifi1 > 80)
		plus total1 $total1 10
	end
	if($tempMax1<25)
		plus total1 $total1 15
	end
	if($temp2 > 21)
		plus total2 $total2 25
	end
	if($wifi2 > 3)
		plus total2 $total2 15
	if($distance2 > 1500)
		plus total2 $total2 10
	end
	if($n_wifi2 > 80)
		plus total1 $total2 10
	end
	if($tempMax2<25)
		plus total2 $total2 15
	end
	print $total1 $total2 
	if($total1 > $total2)
	data d B SENSOR25 route4
		send $d 225
	else
	data d B SENSOR25 route5
		send $d 225
	
end