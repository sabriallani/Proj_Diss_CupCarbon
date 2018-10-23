set pef A
loop
wait
read s2
wait 
read s1
rdata $s1 wifi1 lumi1 temp1 
rdata $s2 wifi2 lumi2 temp2 
print $wifi2 $temp2 $lumi1
if($pef == A)
	set total1 0
	set total2 0
	if($temp1 > 16)
		plus total1 $total1 20
	end
	if($wifi1 > 2)
		plus total1 $total1 20
	end
	if($lumi1 > 0)
		plus total1 $total1 60
	end
	if($temp2 > 16)
		plus total2 $total2 20
	end
	if($wifi2 > 2)
		plus total2 $total2 20
	end
	if($lumi2 > 2)
		plus total2 $total2 60
	end  
	print $total1 $total2
	if($total1 > $total2)
		data d B SENSOR11 route1
		send $d 11
	else
		data d B SENSOR11 route2
		send $d 11
	end
end
if($pef == B)
	set total1 0
	set total2 0
	if($temp1 < 14)
		plus total1 $total1 65
	end
	if($wifi1 > 1)
		plus total1 $total1 35
	end
	if($temp2 < 14)
		plus total2 $total2 65
	end
	if($wifi2 > 1)
		plus total2 $total2 35
	end 
	print $total1 $total2
	if($total1 > $total2)
		data d B SENSOR11 route1
		send $d 11
	else
		data d B SENSOR11 route2
		send $d 11
	end
end