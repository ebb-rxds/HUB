\p 0W

if[(`$"HUB down!")~HUB:@[system;"ps -eo pid,command|grep HUB.q|egrep -v 'rlwrap|grep'";`$"HUB down!"];0N!HUB;exit -1]
HUB:neg hopen"J"$first" "vs last":"vs first system"lsof -iTCP -sTCP:LISTEN -Pn|grep ",first" "vs ltrim first HUB

HUB@(upsert;`spoke;{update`$"."sv'string"i"$0x0 vs'IP," "sv'X,EXP:("D"$.z.l 1)-.z.D from`port`slaves`pid`IP xcol enlist(`p`s,`$'x)!(system@'"ps"),get each".z.",/:x}"iahuXPKk")
HUB@"update handle:.z.w from`spoke where pid=",string .z.i

HOP:{hopen"j"$neg[HUB]@(?;`spoke;enlist(like;`dir;"*/",$[0>type x;string x;x]);();(first;`port))}