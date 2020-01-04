\p 0W
\c 25 250

/ init tables
spoke:`pid xkey{update`$"."sv'string"i"$0x0 vs'IP," "sv'X,EXP:("D"$.z.l 1)-.z.D,handle:0i,up:.z.N,dir:system"\\pwd"from`port`slaves`pid`IP xcol enlist(`p`s,`$'x)!(system@'"ps"),get each".z.",/:x}"iahuXPKk"
memst:`pid xkey update pid:.z.i from enlist .Q.w[];
down:delete from update crash:.z.P from lj[spoke;memst];

/ apply disk image 
{if[x in key`:.;x upsert get hsym x]}each`spoke`memst`down;

/ instructions for table changes
.z.vs:{[x;y]if[x=`spoke;update dir:handle@\:"\\cd"from`spoke where handle>0];if[x in`spoke`memst`down;save x]}

/ re establish handles and clean up spoke
if[count spoke;update P:.z.P,handle:@[hopen;;0Ni]each"j"$port from`spoke;delete from`spoke where null handle];

/ append to down table when spoke dissapears
.z.pc:{`down upsert update crash:.z.P from lj[select from spoke where handle=x;memst];delete from`spoke where handle=x}
 
 / update up time and mem stats every 10 seconds
.z.ts:{update up:"n"$.z.P-P from`spoke;`memst set{x[`handle]@".Q.w[]"}each spoke}
\t 10000

\
select from down where crash>exec max P from spoke
