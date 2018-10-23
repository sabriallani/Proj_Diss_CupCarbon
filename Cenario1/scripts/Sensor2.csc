loop
wait
read m
if($m==A)
    data d C SENSOR25 route1
    send $d
end
delay 1000
