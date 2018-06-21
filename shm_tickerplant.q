/-----------------------------------------------------------------------------
/ MarketGrid Market Database
/ Copyright (C) 2017 MarketGrid Systems Pty Ltd 
/ author : ys
/ date   : 20171208
/-----------------------------------------------------------------------------
/ Shared memory tickerplant
/-----------------------------------------------------------------------------

.proc.loadf[(src:$[`schemafile in key .proc.params;raze .proc.params`schemafile;"sym"]),".q"];


\d .u

init[]

sel:{[x;y] x}


\d .

\c 2000 2000

upd:{[t;x]
	.u.pub[t; update linetime:.z.P from $[99=type x;x;cols[t]!x]]
 }

upd:{[f;t;x]
	handler:{[t;x;e] .lg.e[`upd] "inserting to table ",string[t]," - ",e," - record is: ",-3!x}[t;x];
	.[f;(t;x);handler]
 }[upd]

.z.exit:{
	.te.disconnect_all[];
 }