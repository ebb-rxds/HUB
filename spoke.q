if[not"-p"in .z.X;system"p 0W"]

if[(`$"HUB down!")~HUB:@[system;"ps -eo pid,command|grep HUB.q|egrep -v 'rlwrap|grep'";`$"HUB down!"];0N!HUB;exit -1]
HUB:hopen"J"$first" "vs last":"vs first system"lsof -iTCP -sTCP:LISTEN -Pn|grep ",first" "vs ltrim first HUB

HUB@(upsert;$["-dbdir"in .z.X;`spoke;`client];{update`$"."sv'string"i"$0x0 vs'IP," "sv'X,EXP:("D"$.z.l 1)-.z.D,handle:HUB".z.w",up:"n"$P-P from`port`slaves`pid`IP xcol enlist(`p`s,`$'x)!(system@'"ps"),get each".z.",/:x}"iahuXPKk");

/ (r)equest (h)andle (f)unction (v)ariable
HOP:{[v;s]v set @[hopen;last HUB@(`HOP;v;s);0];if[0=h:get v;:string[s]," not found"];`HDL upsert 1!enlist`r`h`f`v`p!(s;h;get[.z.s]4;v;system"p")}

if[("-dbdir"in .z.X)&HUB"count client";{h:neg hopen"j"$x`p;h@(eval;enlist each x`f`v`r)}each select from raze[0!'HUB["hsym`$\"::\",/:string client`port"]@\:`HDL]where r=`$last"."vs first system"echo $STY"]
