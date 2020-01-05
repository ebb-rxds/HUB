# HUB
HUB/spoke manager for dynamic ports in q on mac and linux

The magic. Setting a port to infinity sets it to a non blocked free port.
To take advantage of this we will have a registrar called HUB.
This is started in the HUB directory which in this case is in the home directory.
Wherever the HUB directory ends up residing replace the environment variable in this line in q.q.

```system"l ",getenv[`HOME],"/HUB/spoke.q"```

q.q lives in QHOME and is loaded with every invocation of q after q.k is loaded.
However spoke.q checks that HUB.q has been instaniated and is currently running.

ebb$ q3.7

`HUB down!
 
ebb$ pwd

/Users/ebb/HUB

ebb$ q3.7 HUB.q

Ideally these sessions will be run in screen or kmon.
At this point the spoke table in the HUB instance will have one record.

q)flip 0!spoke

key|value
------|------------------------------
pid   | 88912                        
port  | 63947                        
slaves| 0                            
IP    | 192.168.1.252                
h     | ebbs-mbp.fios-router.home    
u     | ebb                          
X     | "/Users/ebb/q/m64/q HUB.q"   
P     | 2020.01.04D13:12:13.689473000
K     | 3.7                          
k     | 2019.12.12                   
EXP   | 355                          
handle| 0                            
up    | 0D00:03:10.003498000         
dir   | "/Users/ebb/HUB"       

Now we can bring up as many q instances as we like.
They will all be assigned a random non blocked port that will be registered with HUB.

ebb$ pwd

/Users/ebb/rxds/imdb

ebb$ q3.7 qa

ebb$ q3.7 dev -s 8

/ app instance

ebb$ pwd

/Users/ebb

ebb$ q3.7

/ in HUB

q)select pid,port,X,up,dir from spoke

pid|port|X|up|dir
-----|-----|---------------------------|--------------------|------------------------
88912|63947|/Users/ebb/q/m64/q HUB.q|0D02:04:30.023138000|/Users/ebb/HUB
89117|63976|/Users/ebb/q/m64/q qa|0D01:56:34.503904000|/Users/ebb/rxds/imdb/qa
89148|63980|/Users/ebb/q/m64/q dev -s 8|0D01:55:58.630640000|/Users/ebb/rxds/imdb/dev
89173|63984|/Users/ebb/q/m64/q|0D01:55:34.166582000|/Users/ebb

HUB keeps 3 q tables in the HUB dir which are spoke, memst(memory stats) and down (crash reports)

If Hub goes down it re establishes handles with spoke(s) based on the spoke disk image when it is restarted.

If a spoke goes down it is removed from the spoke table and registered with the down table.

/ example down entry

key|value
------|------------------------------
port  | 63663i
slaves| 8i
IP    | `192.168.1.252
h     | `ebbs-mbp.fios-router.home
u     | `ebb
X     | "/Users/ebb/q/m64/q dev -s 8"
P     | 2020.01.04D12:40:36.288073000
K     | 3.7
k     | 2019.12.12
EXP   | 354i
handle| 10i
up    | 0D00:05:07.094446000
dir   | "/Users/ebb/rxds/imdb/dev"
used  | 351712
heap  | 67108864
peak  | 67108864
wmax  | 0
mmap  | 0
mphy  | 17179869184
syms  | 697
symw  | 37563
crash | 2020.01.04D12:45:45.902820000

All spoke(s) make connections with named services by using HOP instead of hopen.

```q)h:HOP"dev"```

```q)h"\\pwd"```

```"/Users/ebb/rxds/imdb/dev"```

HOP which consults with HUB can take sym or string.

```q)h:HOP`dev```
