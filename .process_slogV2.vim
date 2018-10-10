g!/^[0-9]\{6,8\} /d
g/Duplicate\|SP1 succeeded/d
%s/^\([0-9]\{6,8\}\).*	\([0-9]\{1,3\}\)	\(.*\)	\(SP1 failed\|SP1 possibly timed out\).*$/\2	\1	\3	\4/g
%sort n
g/Unidentified/m$
gg
/Unidentified
.s/^/\rUnidentified\r/
1s/^/SP2 Parser Failure\r/
$s/$/\r\rUnimplemented/
g/Unimplemented/m$
$s/$/\r\rSP1 Possibly Timed Out/
g/	SP1 possibly/m$
gg
/	SP1 possibly
.,$sort n
%s/\([0-9]\{6,8\}\)	.*/\1/g
