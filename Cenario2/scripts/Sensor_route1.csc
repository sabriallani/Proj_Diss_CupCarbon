loop
randb x 0 4
areadsensor v
if($v!=X)
rdata $v a b c d e
int c $c
int e $e
print $x $c $e
data p $x $c $e
send $p 4
end
delay 1000