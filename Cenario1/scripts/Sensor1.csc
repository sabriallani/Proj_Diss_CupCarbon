loop
areadsensor v
if($v!=X)
rdata $v a b c
int c $c
print $c
if($c < 20)
	data d B SENSOR25 route2
	send $d 5
else
	data d B SENSOR25 route1
	send $d 5
end
delay 1000
