loop
randb wifi 0 5
set n_wifi 0
randb iluminacao 0 1
set per_iluminacao 0
areadsensor v
if($v!=X)
rdata $v a b c
int c $c
set d 0
if($wifi == 0) 
	set n_wifi 1
end
if($iluminacao == 1) 
	set per_iluminacao 1
end
data e $wifi $n_wifi $c $c $c $per_iluminacao 2
send $e 
end
delay 1000