/ start from the HUB dir. screen -dmS HUB rlwrap -r $QHOME/$QARCH/q HUB.q 

\c 25 250

if[not"-p"in .z.X;system"p 0W"]

/ by putting flags before the dir to be loaded we can prevent the load and retain the dir in .z.X to later protect load in .z.vs
reStart:{system" "sv("screen -dmS";last"/"vs x`X;"rlwrap -r";x`X);}

HOP:{[v;s](v;"j"$exec first port from spoke where STY like("*",raze string s))}

upDate:{
 if[not null exec last err from x;:(::)];
 hdl:exec last handle from x;
 s:hdl@(system;"echo $STY");
 r:hdl@({.Q.trp[(0;)@value@;x;{(1;.Q.sbt y)}]};(.Q.l;`$last" "vs exec last X from x where handle=hdl));
 d:`$hdl@(system;"pwd");
 update dir:d,STY:s,err:first r from`spoke where handle=hdl;
 if[first r;`error upsert update stack:enlist last r from select from spoke where handle=hdl];}

/ init tables
spoke:{update`$"."sv'string"i"$0x0 vs'IP," "sv'X,EXP:("D"$.z.l 1)-.z.D,handle:0i,up:"n"$P-P,dir:`$system"pwd",STY:system"echo $STY",err:0 from`port`slaves`pid`IP xcol enlist(`p`s,`$'x)!(system@'"ps"),get each".z.",/:x}"iahuXPKk"
client:delete dir,STY,err from delete from spoke;
memst:`pid xkey update pid:.z.i from enlist .Q.w[];
down:delete from update crash:.z.P from lj[spoke;memst];
error:update err:0N,stack:enlist""from select from spoke where 0b;

/ apply disk image 
{if[x in key`:.;x upsert get hsym x]}each`spoke`memst`down`error`client;

/ instructions for table changes
.z.vs:{[x;y]if[x=`spoke;upDate spoke];if[x in`spoke`memst`down`error`client;save x]}

/ re establish handles and clean up spoke
if[count spoke;update P:.z.P,handle:@[hopen;;0Ni]each"j"$port from`spoke;delete from`spoke where null handle];
if[count client;update P:.z.P,handle:@[hopen;;0Ni]each"j"$port from`client;delete from`client where null handle];

/ append to down table when spoke dissapears and reStart. if reStart is not wanted use killHndl[handle]
.z.pc:{delete from`client where handle=x;`down upsert update crash:.z.P from lj[d:select from spoke where handle=x;memst];delete from`spoke where handle=x;if[count d;reStart last down]}

.z.ts:{update up:"n"$.z.P-P from`spoke;update up:"n"$.z.P-P from`client;`memst set`pid xkey{update pid:x[`pid]from x[`handle]@".Q.w[]"}each spoke}
\t 10000

/ bounce and kill servers only
bounceHndl:{neg[x]@\:"\\\\";}
bounceAll:{bounceHndl exec handle from spoke where handle<>0i;}
killHndl:{delete from`spoke where handle in x;bounceHndl x;delete from`down where handle in x;delete from`error where handle in x;}
killAll:{killHndl exec handle from spoke where handle<>0i;}
downTime:{update dntm:Ps-Pd from select dir,Pd,Ps from aj[`dir`P;select dir,P,Ps:P from spoke;select dir,P:crash,Pd:crash from down]where not null Pd}

.z.exit:{system"screen -dmS HUB rlwrap -r $QHOME/$QARCH/q HUB.q"}

/L:{enlist[`X]!enlist" "sv("/Users/ebb/q/m64/q";"-s";string rand .z.c;"-dbdir";x)}each system"find /Users/ebb/rxds/imdb/* -depth 0"
/`:t/ set .Q.en[`:.]flip(`$'10#.Q.a)!(10#10)?\:`8
