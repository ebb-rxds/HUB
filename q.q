/ use explicit -p option to bypass HUB. -p 0 for local instance
if[(not "-p"in .z.X)&1<count .z.X;system"l ",getenv[`HOME],"/HUB/spoke.q"];
