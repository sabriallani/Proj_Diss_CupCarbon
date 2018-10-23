loop
wait
read s1
rdata $s1 wifi n_wifi temp tempMin tempMax per_iluminacao id
areadsensor v
if($v!=X)
rdata $v a b c
int c $c
if($c < $tempMin)
  set tempMin $c
end
if($c > $tempMax)
  set tempMax $c
end
plus c $c $temp 
div c $c 2
randb wifi2 0 5
if($wifi2 == 0)
	plus n_wifi $n_wifi 1 
end
plus wifi2 $wifi2 $wifi
div wifi2 $wifi2 2
randb iluminacao2 0 1
if($iluminacao2 == 1)
	plus per_iluminacao $per_iluminacao 1 
end
plus id $id 1
print $wifi2 $n_wifi $c $tempMin $tempMax $per_iluminacao $id
data p $wifi2 $n_wifi $c $tempMin $tempMax $per_iluminacao $id
send $p 80
end
delay 1000