ã
MC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\MySqlConf.cs
	namespace 	
ApiMsqlData
 
{ 
public		 

class		 
	MySqlConf		 
{

 
public 
	MySqlConf 
( 
string 
Conexion  (
)( )
{ 	
this 
. 
Conexion 
= 
Conexion '
;' (
} 	
public 
string 
Conexion 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ì@
aC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\EquipoRepository.cs
	namespace

 	
ApiMsqlData


 
.

 
Repositories

 "
{ 
public 

class 
EquipoRepository !
:" #
IEquipoRepository$ 5
{ 
private 
	MySqlConf 
	_conexion #
;# $
public 
EquipoRepository 
(  
	MySqlConf  )
conexion* 2
)2 3
{ 	
	_conexion 
= 
conexion  
;  !
} 	
	protected 
MySqlConnection !
dbAbrirConexion" 1
(1 2
)2 3
{ 	
return 
new 
MySqlConnection &
(& '
	_conexion' 0
.0 1
Conexion1 9
)9 :
;: ;
} 	
	protected 
void 
dbCerrarConexion '
(' (
MySqlConnection( 7
conexion8 @
)@ A
{ 	
conexion 
. 
Close 
( 
) 
; 
} 	
public   
async   
Task   
<   
bool   
>   
DeleteEquipo    ,
(  , -
int  - 0
id  1 3
)  3 4
{!! 	
var"" 
db"" 
="" 
dbAbrirConexion"" $
(""$ %
)""% &
;""& '
var## 
sql## 
=## 
$str#% /
;%%/ 0
var&& 
result&& 
=&& 
await&& 
db&& !
.&&! "
ExecuteAsync&&" .
(&&. /
sql&&/ 2
,&&2 3
new&&4 7
{&&8 9
id&&: <
}&&= >
)&&> ?
;&&? @
dbCerrarConexion(( 
((( 
db(( 
)((  
;((  !
return)) 
result)) 
>)) 
$num)) 
;)) 
}** 	
public,, 
async,, 
Task,, 
<,, 
IEnumerable,, %
<,,% &
equipo,,& ,
>,,, -
>,,- .
GetAllEquipos,,/ <
(,,< =
),,= >
{-- 	
var.. 
db.. 
=.. 
dbAbrirConexion.. $
(..$ %
)..% &
;..& '
var// 
sql// 
=// 
$str/1 *
;11* +
var22 
	resultado22 
=22 
await22 !
db22" $
.22$ %

QueryAsync22% /
<22/ 0
equipo220 6
>226 7
(227 8
sql228 ;
,22; <
new22= @
{22A B
}22C D
)22D E
;22E F
this44 
.44 
dbCerrarConexion44 !
(44! "
db44" $
)44$ %
;44% &
return55 
	resultado55 
;55 
}66 	
public88 
async88 
Task88 
<88 
equipo88  
>88  !
	GetEquipo88" +
(88+ ,
int88, /
id880 2
)882 3
{99 	
var:: 
db:: 
=:: 
dbAbrirConexion:: $
(::$ %
)::% &
;::& '
var;; 
sql;; 
=;; 
$str;> @
;>>@ A
var@@ 
	resultado@@ 
=@@ 
await@@ !
db@@" $
.@@$ %$
QueryFirstOrDefaultAsync@@% =
<@@= >
equipo@@> D
>@@D E
(@@E F
sql@@F I
,@@I J
new@@K N
{@@O P
id@@Q S
=@@T U
id@@V X
}@@Y Z
)@@Z [
;@@[ \
thisBB 
.BB 
dbCerrarConexionBB !
(BB! "
dbBB" $
)BB$ %
;BB% &
returnCC 
	resultadoCC 
;CC 
}DD 	
publicFF 
asyncFF 
TaskFF 
<FF 
boolFF 
>FF 
InsertEquipoFF  ,
(FF, -
equipoFF- 3
teamFF4 8
)FF8 9
{GG 	
varHH 
dbHH 
=HH 
dbAbrirConexionHH $
(HH$ %
)HH% &
;HH& '
varII 
sqlII 
=II 
$strIJ 9
;JJ9 :
varKK 
resultKK 
=KK 
awaitKK 
dbKK !
.KK! "
ExecuteAsyncKK" .
(KK. /
sqlKK/ 2
,KK2 3
newKK4 7
{KK8 9
teamKK: >
.KK> ?
nombreEquipoKK? K
,KKK L
teamKKM Q
.KKQ R
paisKKR V
}KKW X
)KKX Y
;KKY Z
returnMM 
resultMM 
>MM 
$numMM 
;MM 
}NN 	
publicPP 
asyncPP 
TaskPP 
<PP 
boolPP 
>PP 
UpdateEquipoPP  ,
(PP, -
equipoPP- 3
teamPP4 8
)PP8 9
{QQ 	
varRR 
dbRR 
=RR 
dbAbrirConexionRR $
(RR$ %
)RR% &
;RR& '
varVV 
sqlVV 
=VV 
$strVW -
;WW- .
intYY 
resultYY 
=YY 
$numYY 
;YY 
bool[[ 
nombreEquipo[[ 
=[[ 
true[[  $
;[[$ %
bool\\ 
pais\\ 
=\\ 
true\\ 
;\\ 
if__ 
(__ 
String__ 
.__ 
IsNullOrEmpty__ $
(__$ %
team__% )
.__) *
nombreEquipo__* 6
)__6 7
)__7 8
{`` 
nombreEquipoaa 
=aa 
falseaa $
;aa$ %
}bb 
ifdd 
(dd 
Stringdd 
.dd 
IsNullOrEmptydd $
(dd$ %
teamdd% )
.dd) *
paisdd* .
)dd. /
)dd/ 0
{ee 
paisff 
=ff 
falseff 
;ff 
}gg 
ifkk 
(kk 
nombreEquipokk 
&&kk 
paiskk  $
)kk$ %
{ll 
sqlmm 
+=mm 
$strmm a
;mma b
resultnn 
=nn 
awaitnn 
dbnn !
.nn! "
ExecuteAsyncnn" .
(nn. /
sqlnn/ 2
,nn2 3
newnn4 7
{nn8 9
teamnn: >
.nn> ?
nombreEquiponn? K
,nnK L
teamnnM Q
.nnQ R
paisnnR V
,nnV W
teamnnX \
.nn\ ]
idEquiponn] e
}nnf g
)nng h
;nnh i
}oo 
ifqq 
(qq 
nombreEquipoqq 
&&qq 
!qq  
paisqq  $
)qq$ %
{rr 
sqlss 
+=ss 
$strss S
;ssS T
resulttt 
=tt 
awaittt 
dbtt !
.tt! "
ExecuteAsynctt" .
(tt. /
sqltt/ 2
,tt2 3
newtt4 7
{tt8 9
teamtt: >
.tt> ?
nombreEquipott? K
,ttK L
teamttM Q
.ttQ R
idEquipottR Z
}tt[ \
)tt\ ]
;tt] ^
}uu 
ifww 
(ww 
!ww 
nombreEquipoww 
&&ww 
paisww  $
)ww$ %
{xx 
sqlyy 
+=yy 
$stryy C
;yyC D
resultzz 
=zz 
awaitzz 
dbzz !
.zz! "
ExecuteAsynczz" .
(zz. /
sqlzz/ 2
,zz2 3
newzz4 7
{zz8 9
teamzz: >
.zz> ?
paiszz? C
,zzC D
teamzzE I
.zzI J
idEquipozzJ R
}zzS T
)zzT U
;zzU V
}{{ 
dbCerrarConexion 
( 
db 
)  
;  !
return
ÄÄ 
result
ÄÄ 
>
ÄÄ 
$num
ÄÄ 
;
ÄÄ 
}
ÅÅ 	
}
ÇÇ 
}ÉÉ ›-
bC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\EstadioRepository.cs
	namespace 	
ApiMsqlData
 
. 
Repositories "
{ 
public 

class 
EstadioRepository "
:# $
IEstadioRepository% 7
{ 
private 
	MySqlConf 
	_conexion #
;# $
public 
EstadioRepository  
(  !
	MySqlConf! *
Conexion+ 3
)3 4
{ 	
	_conexion 
= 
Conexion  
;  !
} 	
	protected 
MySqlConnection !
dbAbrirConexion" 1
(1 2
)2 3
{ 	
return 
new 
MySqlConnection &
(& '
	_conexion' 0
.0 1
Conexion1 9
)9 :
;: ;
} 	
	protected 
void 
dbCerrarConexion '
(' (
MySqlConnection( 7
conexion8 @
)@ A
{ 	
conexion 
. 
Close 
( 
) 
; 
}   	
public!! 
async!! 
Task!! 
<!! 
bool!! 
>!! 
DeleteEstadio!!  -
(!!- .
estadio!!. 5
est!!6 9
)!!9 :
{"" 	
var## 
db## 
=## 
dbAbrirConexion## $
(##$ %
)##% &
;##& '
var$$ 
sql$$ 
=$$ 
$str$& 5
;&&5 6
var'' 
result'' 
='' 
await'' 
db'' !
.''! "
ExecuteAsync''" .
(''. /
sql''/ 2
,''2 3
new''4 7
{''8 9
est'': =
.''= >
	idEstadio''> G
}''H I
)''I J
;''J K
dbCerrarConexion)) 
()) 
db)) 
)))  
;))  !
return** 
result** 
>** 
$num** 
;** 
}++ 	
public-- 
async-- 
Task-- 
<-- 
IEnumerable-- %
<--% &
estadio--& -
>--- .
>--. /
GetAllEstadios--0 >
(--> ?
)--? @
{.. 	
var// 
db// 
=// 
dbAbrirConexion// $
(//$ %
)//% &
;//& '
var00 
sql00 
=00 
$str02 *
;22* +
return55 
await55 
db55 
.55 

QueryAsync55 &
<55& '
estadio55' .
>55. /
(55/ 0
sql550 3
,553 4
new555 8
{559 :
}55; <
)55< =
;55= >
}66 	
public88 
async88 
Task88 
<88 
estadio88 !
>88! "
GetEstadioDetails88# 4
(884 5
int885 8
id889 ;
)88; <
{99 	
var:: 
db:: 
=:: 
dbAbrirConexion:: $
(::$ %
)::% &
;::& '
var<< 
sql<< 
=<< 
$str<? F
;??F G
returnAA 
awaitAA 
dbAA 
.AA $
QueryFirstOrDefaultAsyncAA 4
<AA4 5
estadioAA5 <
>AA< =
(AA= >
sqlAA> A
,AAA B
newAAC F
{AAG H
	idEstadioAAI R
=AAS T
idAAU W
}AAX Y
)AAY Z
;AAZ [
}BB 	
publicDD 
asyncDD 
TaskDD 
<DD 
boolDD 
>DD 
InsertEstadioDD  -
(DD- .
estadioDD. 5
estDD6 9
)DD9 :
{EE 	
varFF 
dbFF 
=FF 
dbAbrirConexionFF $
(FF$ %
)FF% &
;FF& '
varGG 
sqlGG 
=GG 
$strGI 4
;II4 5
varJJ 
resultJJ 
=JJ 
awaitJJ 
dbJJ !
.JJ! "
ExecuteAsyncJJ" .
(JJ. /
sqlJJ/ 2
,JJ2 3
newJJ4 7
{JJ8 9
estJJ: =
.JJ= >
nombreJJ> D
,JJD E
estJJF I
.JJI J
paisJJJ N
,JJN O
estJJP S
.JJS T
estadoJJT Z
}JJ[ \
)JJ\ ]
;JJ] ^
dbCerrarConexionMM 
(MM 
dbMM 
)MM  
;MM  !
returnNN 
resultNN 
>NN 
$numNN 
;NN 
}OO 	
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
boolQQ 
>QQ 
UpdateEstadioQQ  -
(QQ- .
estadioQQ. 5
estQQ6 9
)QQ9 :
{RR 	
varSS 
dbSS 
=SS 
dbAbrirConexionSS $
(SS$ %
)SS% &
;SS& '
varTT 
sqlTT 
=TT 
$strTV 5
;VV5 6
varWW 
resultWW 
=WW 
awaitWW 
dbWW !
.WW! "
ExecuteAsyncWW" .
(WW. /
sqlWW/ 2
,WW2 3
newWW4 7
{WW8 9
estWW: =
.WW= >
nombreWW> D
,WWD E
estWWF I
.WWI J
paisWWJ N
,WWN O
estWWP S
.WWS T
estadoWWT Z
,WWZ [
estWW\ _
.WW_ `
	idEstadioWW` i
}WWj k
)WWk l
;WWl m
dbCerrarConexionYY 
(YY 
dbYY 
)YY  
;YY  !
returnZZ 
resultZZ 
>ZZ 
$numZZ 
;ZZ 
}[[ 	
}\\ 
}]] ±	
bC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\IEquipoRepository.cs
	namespace 	
ApiMsqlData
 
. 
Repositories "
{		 
public

 

	interface

 
IEquipoRepository

 &
{ 
Task 
< 
IEnumerable 
< 
equipo 
>  
>  !
GetAllEquipos" /
(/ 0
)0 1
;1 2
Task 
< 
equipo 
> 
	GetEquipo 
( 
int "
id# %
)% &
;& '
Task 
< 
bool 
> 
InsertEquipo 
(  
equipo  &
team' +
)+ ,
;, -
Task 
< 
bool 
> 
UpdateEquipo 
(  
equipo  &
team' +
)+ ,
;, -
Task 
< 
bool 
> 
DeleteEquipo 
(  
int  #
id$ &
)& '
;' (
} 
} ∆	
cC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\IEstadioRepository.cs
	namespace 	
ApiMsqlData
 
. 
Repositories "
{		 
public

 

	interface

 
IEstadioRepository

 '
{ 
Task 
< 
IEnumerable 
< 
estadio  
>  !
>! "
GetAllEstadios# 1
(1 2
)2 3
;3 4
Task 
< 
estadio 
> 
GetEstadioDetails '
(' (
int( +
id, .
). /
;/ 0
Task 
< 
bool 
> 
InsertEstadio  
(  !
estadio! (
est) ,
), -
;- .
Task 
< 
bool 
> 
UpdateEstadio  
(  !
estadio! (
est) ,
), -
;- .
Task 
< 
bool 
> 
DeleteEstadio  
(  !
estadio! (
est) ,
), -
;- .
} 
} ¢	
`C:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\ILigaRepository.cs
	namespace		 	
ApiMsqlData		
 
.		 
Repositories		 "
{

 
public 

	interface 
ILigaRepository $
{ 
Task 
< 
IEnumerable 
< 
liga 
> 
> 
GetAllLigas  +
(+ ,
), -
;- .
Task 
< 
liga 
> 
GetLigaDetails !
(! "
int" %
id& (
)( )
;) *
Task 
< 
bool 
> 

InsertLiga 
( 
liga "
lig# &
)& '
;' (
Task 
< 
bool 
> 

UpdateLiga 
( 
liga "
lig# &
)& '
;' (
Task 
< 
bool 
> 

DeleteLiga 
( 
liga "
lig# &
)& '
;' (
} 
} ˆ	
gC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\ILigaUsuarioRepository.cs
	namespace 	
ApiMsqlData
 
. 
Repositories "
{		 
public

 

	interface

 "
ILigaUsuarioRepository

 +
{ 
Task 
< 
IEnumerable 
< 
ligaUsuario $
>$ %
>% &
GetAllLigaUsuarios' 9
(9 :
): ;
;; <
Task 
< 
ligaUsuario 
> !
GetLigaUsuarioDetails /
(/ 0
int0 3
id4 6
)6 7
;7 8
Task 
< 
bool 
> 
InsertLigaUsuario $
($ %
ligaUsuario% 0
lig1 4
)4 5
;5 6
Task 
< 
bool 
> 
UpdateLigaUsuario $
($ %
ligaUsuario% 0
lig1 4
)4 5
;5 6
Task 
< 
bool 
> 
DeleteLigaUsuario $
($ %
ligaUsuario% 0
lig1 4
)4 5
;5 6
} 
} “
`C:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\IPagoRepository.cs
	namespace 	
ApiMsqlData
 
. 
Repositories "
{		 
public

 

	interface

 
IPagoRepository

 $
{ 
Task	 
< 
IEnumerable 
< 
pago 
> 
>  
GetAllPagos! ,
(, -
)- .
;. /
Task 
< 
pago 
> 
GetPagoDetails !
(! "
int" %
idPago& ,
), -
;- .
Task 
< 
bool 
> 

InsertPago 
( 
pago "
pag# &
)& '
;' (
} 
} Õ	
cC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\ITarjetaRepository.cs
	namespace 	
ApiMsqlData
 
. 
Repositories "
{		 
public

 

	interface

 
ITarjetaRepository

 '
{ 
Task 
< 
IEnumerable 
< 
tarjeta  
>  !
>! "
GetAllTarjetas# 1
(1 2
)2 3
;3 4
Task 
< 
tarjeta 
> 
GetTarjetaDetails '
(' (
int( +
	idTarjeta, 5
)5 6
;6 7
Task 
< 
bool 
> 
InsertTarjeta  
(  !
tarjeta! (
tar) ,
), -
;- .
Task 
< 
bool 
> 
UpdateTarjeta  
(  !
tarjeta! (
tar) ,
), -
;- .
Task 
< 
bool 
> 
DeleteTarjeta  
(  !
tarjeta! (
tar) ,
), -
;- .
} 
} ∆	
cC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\IUsuarioRepository.cs
	namespace 	
ApiMsqlData
 
. 
Repositories "
{		 
public

 

	interface

 
IUsuarioRepository

 '
{ 
Task 
< 
IEnumerable 
< 
usuario  
>  !
>! "
GetAllUsuarios# 1
(1 2
)2 3
;3 4
Task 
< 
usuario 
> 
GetUsuarioDetails '
(' (
int( +
id, .
). /
;/ 0
Task 
< 
bool 
> 
InsertUsuario  
(  !
usuario! (
usu) ,
), -
;- .
Task 
< 
bool 
> 
UpdateUsuario  
(  !
usuario! (
usu) ,
), -
;- .
Task 
< 
bool 
> 
DeleteUsuario  
(  !
usuario! (
usu) ,
), -
;- .
} 
} ≈-
_C:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\LigaRepository.cs
	namespace 	
ApiMsqlData
 
. 
Repositories "
{ 
public 

class 
LigaRepository 
:  !
ILigaRepository" 1
{ 
private 
	MySqlConf 
	_conexion #
;# $
public 
LigaRepository 
( 
	MySqlConf '
Conexion( 0
)0 1
{ 	
	_conexion 
= 
Conexion  
;  !
} 	
public 
async 
Task 
< 
bool 
> 

DeleteLiga  *
(* +
liga+ /
lig0 3
)3 4
{ 	
var 
db 
= 
dbAbrirConexion $
($ %
)% &
;& '
var 
sql 
= 
$str /
;/ 0
var 
result 
= 
await 
db !
.! "
ExecuteAsync" .
(. /
sql/ 2
,2 3
new4 7
{8 9
lig: =
.= >
idLiga> D
}D E
)E F
;F G
return"" 
result"" 
>"" 
$num"" 
;"" 
}## 	
public&& 
async&& 
Task&& 
<&& 
IEnumerable&& %
<&&% &
liga&&& *
>&&* +
>&&+ ,
GetAllLigas&&- 8
(&&8 9
)&&9 :
{'' 	
var(( 
db(( 
=(( 
dbAbrirConexion(( $
((($ %
)((% &
;((& '
var)) 
sql)) 
=)) 
$str)+ (
;++( )
return-- 
await-- 
db-- 
.-- 

QueryAsync-- &
<--& '
liga--' +
>--+ ,
(--, -
sql--- 0
,--0 1
new--2 5
{--6 7
}--8 9
)--9 :
;--: ;
}.. 	
public11 
async11 
Task11 
<11 
liga11 
>11 
GetLigaDetails11  .
(11. /
int11/ 2
id113 5
)115 6
{22 	
var33 
db33 
=33 
dbAbrirConexion33 $
(33$ %
)33% &
;33& '
var55 
sql55 
=55 
$str58 :
;88: ;
return:: 
await:: 
db:: 
.:: $
QueryFirstOrDefaultAsync:: 4
<::4 5
liga::5 9
>::9 :
(::: ;
sql::; >
,::> ?
new::@ C
{::D E
id::F H
=::I J
id::K M
}::N O
)::O P
;::P Q
};; 	
public== 
async== 
Task== 
<== 
bool== 
>== 

InsertLiga==  *
(==* +
liga==+ /
lig==0 3
)==3 4
{>> 	
var?? 
db?? 
=?? 
dbAbrirConexion?? $
(??$ %
)??% &
;??& '
var@@ 
sql@@ 
=@@ 
$str@B }
;BB} ~
varDD 
resultDD 
=DD 
awaitDD "
dbDD# %
.DD% &
ExecuteAsyncDD& 2
(DD2 3
sqlDD3 6
,DD6 7
newDD8 ;
{DD< =
ligDD> A
.DDA B

nombreLigaDDB L
,DDL M
ligDDN Q
.DDQ R
fechaCreacionDDR _
,DD_ `
ligDDa d
.DDd e
fechaCierreDDe p
,DDp q
ligDDr u
.DDu v

tipodeLiga	DDv Ä
,
DDÄ Å
lig
DDÇ Ö
.
DDÖ Ü#
precioDeParticipacion
DDÜ õ
,
DDõ ú
lig
DDù †
.
DD† °
sede
DD° •
}
DD¶ ß
)
DDß ®
;
DD® ©
returnEE 
resultEE 
>EE 
$numEE  !
;EE! "
}HH 	
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
boolJJ 
>JJ 

UpdateLigaJJ  *
(JJ* +
ligaJJ+ /
ligJJ0 3
)JJ3 4
{KK 	
varLL 
dbLL 
=LL 
dbAbrirConexionLL $
(LL$ %
)LL% &
;LL& '
varMM 
sqlMM 
=MM 
$strMO /
;OO/ 0
varPP 
resultPP 
=PP 
awaitPP 
dbPP !
.PP! "
ExecuteAsyncPP" .
(PP. /
sqlPP/ 2
,PP2 3
newPP4 7
{PP8 9
ligPP9 <
.PP< =
idLigaPP= C
,PPC D
ligPPE H
.PPH I

nombreLigaPPI S
,PPS T
ligPPU X
.PPX Y
fechaCreacionPPY f
,PPf g
ligPPh k
.PPk l
fechaCierrePPl w
,PPw x
ligPPy |
.PP| }

tipodeLiga	PP} á
,
PPá à
lig
PPâ å
.
PPå ç#
precioDeParticipacion
PPç ¢
,
PP¢ £
lig
PP§ ß
.
PPß ®
sede
PP® ¨
,
PP¨ ≠
lig
PPÆ ±
.
PP± ≤
estado
PP≤ ∏
}
PPπ ∫
)
PP∫ ª
;
PPª º
returnRR 
resultRR 
>RR 
$numRR 
;RR 
}SS 	
	protectedVV 
MySqlConnectionVV !
dbAbrirConexionVV" 1
(VV1 2
)VV2 3
{WW 	
returnXX 
newXX 
MySqlConnectionXX &
(XX& '
	_conexionXX' 0
.XX0 1
ConexionXX1 9
)XX9 :
;XX: ;
}YY 	
}]] 
}^^ ˜/
fC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\LigaUsuarioRepository.cs
	namespace

 	
ApiMsqlData


 
.

 
Repositories

 "
{ 
public 

class !
LigaUsuarioRepository &
:& '"
ILigaUsuarioRepository( >
{ 
private 
	MySqlConf 
	_conexion #
;# $
public !
LigaUsuarioRepository $
($ %
	MySqlConf% .
Conexion/ 7
)7 8
{ 	
	_conexion 
= 
Conexion  
;  !
} 	
	protected 
MySqlConnection !
dbAbrirConexion" 1
(1 2
)2 3
{ 	
return 
new 
MySqlConnection &
(& '
	_conexion' 0
.0 1
Conexion1 9
)9 :
;: ;
} 	
	protected 
void 
dbCerrarConexion '
(' (
MySqlConnection( 7
conexion8 @
)@ A
{ 	
conexion 
. 
Close 
( 
) 
; 
} 	
public"" 
async"" 
Task"" 
<"" 
bool"" 
>"" 
InsertLigaUsuario""  1
(""1 2
ligaUsuario""2 =
lig""> A
)""A B
{## 	
var$$ 
db$$ 
=$$ 
dbAbrirConexion$$ $
($$$ %
)$$% &
;$$& '
var%% 
sql%% 
=%% 
$str%' B
;''B C
var(( 
result(( 
=(( 
await(( 
db(( !
.((! "
ExecuteAsync((" .
(((. /
sql((/ 2
,((2 3
new((4 7
{((8 9
lig((9 <
.((< =

idRegistro((= G
,((G H
lig((H K
.((K L
idLiga((L R
,((R S
lig((S V
.((V W
	idUsuario((W `
,((` a
lig((b e
.((e f
punteo((f l
,((l m
lig((n q
.((q r
estado((r x
}((y z
)((z {
;(({ |
dbCerrarConexion++ 
(++ 
db++ 
)++  
;++  !
return,, 
result,, 
>,, 
$num,, 
;,, 
}-- 	
public// 
async// 
Task// 
<// 
bool// 
>// 
UpdateLigaUsuario//  1
(//1 2
ligaUsuario//2 =
lig//> A
)//A B
{00 	
var11 
db11 
=11 
dbAbrirConexion11 $
(11$ %
)11% &
;11& '
var22 
sql22 
=22 
$str24 7
;447 8
var55 
result55 
=55 
await55 
db55 !
.55! "
ExecuteAsync55" .
(55. /
sql55/ 2
,552 3
new554 7
{558 9
lig55: =
.55= >
idLiga55> D
,55D E
lig55E H
.55H I
	idUsuario55I R
,55R S
lig55T W
.55W X
punteo55X ^
,55^ _
lig55` c
.55c d
estado55d j
,55j k
lig55l o
.55o p

idRegistro55p z
}55z {
)55{ |
;55| }
dbCerrarConexion77 
(77 
db77 
)77  
;77  !
return88 
result88 
>88 
$num88 
;88 
}99 	
public;; 
async;; 
Task;; 
<;; 
bool;; 
>;; 
DeleteLigaUsuario;;  1
(;;1 2
ligaUsuario;;2 =
lig;;> A
);;A B
{<< 	
var== 
db== 
=== 
dbAbrirConexion== $
(==$ %
)==% &
;==& '
var>> 
sql>> 
=>> 
$str>@ 7
;@@7 8
varAA 
resultAA 
=AA 
awaitAA 
dbAA !
.AA! "
ExecuteAsyncAA" .
(AA. /
sqlAA/ 2
,AA2 3
newAA4 7
{AA8 9
ligAA: =
.AA= >

idRegistroAA> H
}AAI J
)AAJ K
;AAK L
dbCerrarConexionCC 
(CC 
dbCC 
)CC  
;CC  !
returnDD 
resultDD 
>DD 
$numDD 
;DD 
}EE 	
publicGG 
asyncGG 
TaskGG 
<GG 
ligaUsuarioGG %
>GG% &!
GetLigaUsuarioDetailsGG' <
(GG< =
intGG= @
idGGA C
)GGC D
{HH 	
varII 
dbII 
=II 
dbAbrirConexionII $
(II$ %
)II% &
;II& '
varKK 
sqlKK 
=KK 
$strKN 9
;NN9 :
returnPP 
awaitPP 
dbPP 
.PP $
QueryFirstOrDefaultAsyncPP 4
<PP4 5
ligaUsuarioPP5 @
>PP@ A
(PPA B
sqlPPB E
,PPE F
newPPG J
{PPK L

idRegistroPPM W
=PPX Y
idPPZ \
}PP] ^
)PP^ _
;PP_ `
}QQ 	
publicSS 
asyncSS 
TaskSS 
<SS 
IEnumerableSS %
<SS% &
ligaUsuarioSS& 1
>SS1 2
>SS2 3
GetAllLigaUsuariosSS4 F
(SSF G
)SSG H
{TT 	
varUU 
dbUU 
=UU 
dbAbrirConexionUU $
(UU$ %
)UU% &
;UU& '
varVV 
sqlVV 
=VV 
$strVX *
;XX* +
return[[ 
await[[ 
db[[ 
.[[ 

QueryAsync[[ &
<[[& '
ligaUsuario[[' 2
>[[2 3
([[3 4
sql[[4 7
,[[7 8
new[[9 <
{[[= >
}[[? @
)[[@ A
;[[A B
}\\ 	
}]] 
}^^ º
_C:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\PagoRepository.cs
	namespace

 	
ApiMsqlData


 
.

 
Repositories

 "
{ 
public 

class 
PagoRepository 
:  !
IPagoRepository" 1
{ 
private 
	MySqlConf 
	_conexion #
;# $
public 
PagoRepository 
( 
	MySqlConf '
Conexion( 0
)0 1
{ 	
	_conexion 
= 
Conexion  
;  !
} 	
	protected 
MySqlConnection !
dbAbrirConexion" 1
(1 2
)2 3
{ 	
return 
new 
MySqlConnection &
(& '
	_conexion' 0
.0 1
Conexion1 9
)9 :
;: ;
} 	
	protected 
void 
dbCerrarConexion '
(' (
MySqlConnection( 7
conexion8 @
)@ A
{ 	
conexion 
. 
Close 
( 
) 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
pago& *
>* +
>+ ,
GetAllPagos- 8
(8 9
)9 :
{ 	
var   
db   
=   
dbAbrirConexion   $
(  $ %
)  % &
;  & '
var!! 
sql!! 
=!! 
$str!" #
;""# $
return## 
await## 
db## 
.## 

QueryAsync## &
<##& '
pago##' +
>##+ ,
(##, -
sql##- 0
,##0 1
new##2 5
{##6 7
}##8 9
)##9 :
;##: ;
}$$ 	
public&& 
async&& 
Task&& 
<&& 
pago&& 
>&& 
GetPagoDetails&&  .
(&&. /
int&&/ 2
idPago&&3 9
)&&9 :
{'' 	
var(( 
db(( 
=(( 
dbAbrirConexion(( &
(((& '
)((' (
;((( )
var** 
sql** 
=** 
$str*- 0
;--0 1
return.. 
await.. 
db.. 
... $
QueryFirstOrDefaultAsync.. 4
<..4 5
pago..5 9
>..9 :
(..: ;
sql..; >
,..> ?
new..@ C
{..D E
idPago..F L
=..M N
idPago..O U
}..V W
)..W X
;..X Y
}// 	
public11 
async11 
Task11 
<11 
bool11 
>11 

InsertPago11  *
(11* +
pago11+ /
pag110 3
)113 4
{22 	
var33 
db33 
=33 
dbAbrirConexion33 $
(33$ %
)33% &
;33& '
var44 
sql44 
=44 
$str46 P
;66P Q
var77 
result77 
=77 
await77 
db77 !
.77! "
ExecuteAsync77" .
(77. /
sql77/ 2
,772 3
new774 7
{778 9
pag77: =
.77= >
	idUsuario77> G
,77G H
pag77I L
.77L M
	idTarjeta77M V
,77V W
pag77X [
.77[ \
idLiga77\ b
,77b c
pag77d g
.77g h
fechaDePago77h s
}77t u
)77u v
;77v w
return88 
result88 
>88 
$num88 
;88 
}99 	
};; 
}<< Ó/
bC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\TarjetaRepository.cs
	namespace

 	
ApiMsqlData


 
.

 
Repositories

 "
{ 
public 

class 
TarjetaRepository "
:# $
ITarjetaRepository% 7
{ 
private 
	MySqlConf 
	_conexion #
;# $
public 
TarjetaRepository  
(  !
	MySqlConf! *
Conexion+ 3
)3 4
{ 	
	_conexion 
= 
Conexion  
;  !
} 	
	protected 
MySqlConnection !
dbAbrirConexion" 1
(1 2
)2 3
{ 	
return 
new 
MySqlConnection &
(& '
	_conexion' 0
.0 1
Conexion1 9
)9 :
;: ;
} 	
	protected 
void 
dbCerrarConexion '
(' (
MySqlConnection( 7
conexion8 @
)@ A
{ 	
conexion 
. 
Close 
( 
) 
; 
} 	
public!! 
async!! 
Task!! 
<!! 
bool!! 
>!! 
DeleteTarjeta!!  -
(!!- .
tarjeta!!. 5
tar!!6 9
)!!9 :
{"" 	
var## 
db## 
=## 
dbAbrirConexion## $
(##$ %
)##% &
;##& '
var$$ 
sql$$ 
=$$ 
$str$& 5
;&&5 6
var'' 
result'' 
='' 
await'' 
db'' !
.''! "
ExecuteAsync''" .
(''. /
sql''/ 2
,''2 3
new''4 7
{''8 9
tar'': =
.''= >
	idTarjeta''> G
}''H I
)''I J
;''J K
dbCerrarConexion(( 
((( 
db(( 
)((  
;((  !
return)) 
result)) 
>)) 
$num)) 
;)) 
}** 	
public,, 
async,, 
Task,, 
<,, 
IEnumerable,, %
<,,% &
tarjeta,,& -
>,,- .
>,,. /
GetAllTarjetas,,0 >
(,,> ?
),,? @
{-- 	
var.. 
db.. 
=.. 
dbAbrirConexion.. $
(..$ %
)..% &
;..& '
var// 
sql// 
=// 
$str/1 *
;11* +
return22 
await22 
db22 
.22 

QueryAsync22 &
<22& '
tarjeta22' .
>22. /
(22/ 0
sql220 3
,223 4
new225 8
{229 :
}22; <
)22< =
;22= >
}33 	
public55 
async55 
Task55 
<55 
tarjeta55 !
>55! "
GetTarjetaDetails55# 4
(554 5
int555 8
	idTarjeta559 B
)55B C
{66 	
var77 
db77 
=77 
dbAbrirConexion77 $
(77$ %
)77% &
;77& '
var99 
sql99 
=99 
$str9< F
;<<F G
return== 
await== 
db== 
.== $
QueryFirstOrDefaultAsync== 4
<==4 5
tarjeta==5 <
>==< =
(=== >
sql==> A
,==A B
new==C F
{==G H
	idTarjeta==I R
===S T
	idTarjeta==U ^
}==_ `
)==` a
;==a b
}>> 	
public@@ 
async@@ 
Task@@ 
<@@ 
bool@@ 
>@@ 
InsertTarjeta@@  -
(@@- .
tarjeta@@. 5
tar@@6 9
)@@9 :
{AA 	
varBB 
dbBB 
=BB 
dbAbrirConexionBB $
(BB$ %
)BB% &
;BB& '
varCC 
sqlCC 
=CC 
$strCE h
;EEh i
varFF 
resultFF 
=FF 
awaitFF 
dbFF !
.FF! "
ExecuteAsyncFF" .
(FF. /
sqlFF/ 2
,FF2 3
newFF4 7
{FF8 9
tarFF: =
.FF= >
nombreEncargadoFF> M
,FFM N
tarFFO R
.FFR S
numerodeTarjetaFFS b
,FFb c
tarFFd g
.FFg h
cvcFFh k
,FFk l
tarFFm p
.FFp q
fechaDeCaducidad	FFq Å
,
FFÅ Ç
tar
FFÉ Ü
.
FFÜ á
tipo
FFá ã
}
FFå ç
)
FFç é
;
FFé è
returnGG 
resultGG 
>GG 
$numGG 
;GG 
}HH 	
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
boolJJ 
>JJ 
UpdateTarjetaJJ  -
(JJ- .
tarjetaJJ. 5
tarJJ6 9
)JJ9 :
{KK 	
varLL 
dbLL 
=LL 
dbAbrirConexionLL $
(LL$ %
)LL% &
;LL& '
varMM 
sqlMM 
=MM 
$strMO 5
;OO5 6
varPP 
resultPP 
=PP 
awaitPP 
dbPP !
.PP! "
ExecuteAsyncPP" .
(PP. /
sqlPP/ 2
,PP2 3
newPP4 7
{PP8 9
tarPP: =
.PP= >
	idTarjetaPP> G
,PPG H
tarPPI L
.PPL M
nombreEncargadoPPM \
,PP\ ]
tarPP^ a
.PPa b
numerodeTarjetaPPb q
,PPq r
tarPPs v
.PPv w
cvcPPw z
,PPz {
tarPP| 
.	PP Ä
fechaDeCaducidad
PPÄ ê
,
PPê ë
tar
PPí ï
.
PPï ñ
tipo
PPñ ö
}
PPõ ú
)
PPú ù
;
PPù û
dbCerrarConexionQQ 
(QQ 
dbQQ 
)QQ  
;QQ  !
returnRR 
resultRR 
>RR 
$numRR 
;RR 
}SS 	
}TT 
}UU ‹-
bC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlData\Repositories\UsuarioRepository.cs
	namespace 	
ApiMsqlData
 
. 
Repositories "
{ 
public 

class 
UsuarioRepository "
:# $
IUsuarioRepository% 7
{ 
private 
	MySqlConf 
	_conexion #
;# $
public 
UsuarioRepository  
(  !
	MySqlConf! *
Conexion+ 3
)3 4
{ 	
	_conexion 
= 
Conexion  
;  !
} 	
	protected 
MySqlConnection !
dbAbrirConexion" 1
(1 2
)2 3
{ 	
return 
new 
MySqlConnection &
(& '
	_conexion' 0
.0 1
Conexion1 9
)9 :
;: ;
} 	
	protected 
void 
dbCerrarConexion '
(' (
MySqlConnection( 7
conexion8 @
)@ A
{ 	
conexion 
. 
Close 
( 
) 
; 
}   	
public"" 
async"" 
Task"" 
<"" 
bool"" 
>"" 
DeleteUsuario""  -
(""- .
usuario"". 5
usu""6 9
)""9 :
{## 	
var$$ 
db$$ 
=$$ 
dbAbrirConexion$$ $
($$$ %
)$$% &
;$$& '
var%% 
sql%% 
=%% 
$str%' 7
;''7 8
var(( 
result(( 
=(( 
await(( 
db(( !
.((! "
ExecuteAsync((" .
(((. /
sql((/ 2
,((2 3
new((4 7
{((8 9
usu((: =
.((= >
	idUsuario((> G
}((H I
)((I J
;((J K
dbCerrarConexion** 
(** 
db** 
)**  
;**  !
return++ 
result++ 
>++ 
$num++ 
;++ 
},, 	
public.. 
async.. 
Task.. 
<.. 
IEnumerable.. %
<..% &
usuario..& -
>..- .
>... /
GetAllUsuarios..0 >
(..> ?
)..? @
{// 	
var00 
db00 
=00 
dbAbrirConexion00 $
(00$ %
)00% &
;00& '
var11 
sql11 
=11 
$str13 *
;33* +
return66 
await66 
db66 
.66 

QueryAsync66 &
<66& '
usuario66' .
>66. /
(66/ 0
sql660 3
,663 4
new665 8
{669 :
}66; <
)66< =
;66= >
}77 	
public99 
async99 
Task99 
<99 
usuario99 !
>99! "
GetUsuarioDetails99# 4
(994 5
int995 8
id999 ;
)99; <
{:: 	
var;; 
db;; 
=;; 
dbAbrirConexion;; $
(;;$ %
);;% &
;;;& '
var== 
sql== 
=== 
$str=@ A
;@@A B
returnBB 
awaitBB 
dbBB 
.BB $
QueryFirstOrDefaultAsyncBB 4
<BB4 5
usuarioBB5 <
>BB< =
(BB= >
sqlBB> A
,BBA B
newBBC F
{BBG H
idBBI K
=BBL M
idBBN P
}BBQ R
)BBR S
;BBS T
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
boolEE 
>EE 
InsertUsuarioEE  -
(EE- .
usuarioEE. 5
usuEE6 9
)EE9 :
{FF 	
varGG 
dbGG 
=GG 
dbAbrirConexionGG $
(GG$ %
)GG% &
;GG& '
varHH 
sqlHH 
=HH 
$strHJ B
;JJB C
varKK 
resultKK 
=KK 
awaitKK 
dbKK !
.KK! "
ExecuteAsyncKK" .
(KK. /
sqlKK/ 2
,KK2 3
newKK4 7
{KK8 9
usuKK: =
.KK= >

nomUsuarioKK> H
,KKH I
usuKKJ M
.KKM N
passKKN R
,KKR S
usuKKT W
.KKW X
emailKKX ]
}KK^ _
)KK_ `
;KK` a
dbCerrarConexionNN 
(NN 
dbNN 
)NN  
;NN  !
returnOO 
resultOO 
>OO 
$numOO 
;OO 
}PP 	
publicRR 
asyncRR 
TaskRR 
<RR 
boolRR 
>RR 
UpdateUsuarioRR  -
(RR- .
usuarioRR. 5
usuRR6 9
)RR9 :
{SS 	
varTT 
dbTT 
=TT 
dbAbrirConexionTT $
(TT$ %
)TT% &
;TT& '
varUU 
sqlUU 
=UU 
$strUW 7
;WW7 8
varXX 
resultXX 
=XX 
awaitXX 
dbXX !
.XX! "
ExecuteAsyncXX" .
(XX. /
sqlXX/ 2
,XX2 3
newXX4 7
{XX8 9
usuXX9 <
.XX< =

nomUsuarioXX= G
,XXG H
usuXXI L
.XXL M
passXXM Q
,XXQ R
usuXXS V
.XXV W
emailXXW \
,XX\ ]
usuXX^ a
.XXa b
	idUsuarioXXb k
}XXl m
)XXm n
;XXn o
dbCerrarConexionZZ 
(ZZ 
dbZZ 
)ZZ  
;ZZ  !
return[[ 
result[[ 
>[[ 
$num[[ 
;[[ 
}\\ 	
}]] 
}^^ 