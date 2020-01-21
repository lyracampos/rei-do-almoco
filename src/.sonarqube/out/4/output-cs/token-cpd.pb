÷
å/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Api/Controllers/AvatarController.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Api 
. 
Controllers (
{ 
[ 
ApiController 
] 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
Produces

 
(

 
$str

  
)

  !
]

! "
public 

class 
AvatarController !
:" #
ControllerPadrao$ 4
{ 
private 
readonly 
IAvatarServico '
_avatarServico( 6
;6 7
public 
AvatarController 
(  
IAvatarServico  .
avatarServico/ <
)< =
{ 	
_avatarServico 
= 
avatarServico *
;* +
} 	
[ 	
HttpPut	 
( 
$str 
) 
] 
[ 	
Consumes	 
( 
$str '
)' (
]( )
public 
async 
Task 
< 
IActionResult '
>' (
Put) ,
(, -
Guid- 1
id2 4
,4 5
[6 7
FromForm7 ?
]? @
	IFormFileA J
arquivoK R
)R S
{ 	
if 
( 

ModelState 
. 
IsValid "
)" #
return !
RetornarRequestResult ,
(, -
await- 2
_avatarServico3 A
.A B
AdicionarAsyncB P
(P Q
idQ S
,S T
arquivoU \
)\ ]
)] ^
;^ _
return 

BadRequest 
( 
) 
;  
} 	
[ 	

HttpDelete	 
( 
$str 
) 
] 
public 
IActionResult 
Delete #
(# $
Guid$ (
id) +
)+ ,
{ 	
var   
	resultado   
=   
_avatarServico   *
.  * +
Remover  + 2
(  2 3
id  3 5
)  5 6
;  6 7
if!! 
(!! 
	resultado!! 
.!! 
Sucesso!! !
)!!! "
return"" 
Ok"" 
("" 
	resultado"" #
)""# $
;""$ %
return## 

BadRequest## 
(## 
	resultado## '
)##' (
;##( )
}$$ 	
[&& 	
HttpGet&&	 
(&& 
$str&& 
)&& 
]&& 
public'' 
IActionResult'' 
Get''  
(''  !
Guid''! %
id''& (
)''( )
{(( 	
var)) 
avatar)) 
=)) 
_avatarServico)) '
.))' (
Obter))( -
())- .
id)). 0
)))0 1
;))1 2
return** 
File** 
(** 
avatar** 
,** 
$str**  ,
)**, -
;**- .
}++ 	
},, 
}-- ò
å/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Api/Controllers/ControllerPadrao.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Api 
. 
Controllers (
{ 
public 

abstract 
class 
ControllerPadrao *
:+ ,
ControllerBase- ;
{ 
	protected 
IActionResult !
RetornarRequestResult  5
(5 6
RequestResult6 C
	resultadoD M
)M N
{		 	
switch

 
(

 
	resultado

 
.

 

StatusCode

 (
)

( )
{ 
case 
HttpStatusCode #
.# $
OK$ &
:& '
return 
Ok 
( 
	resultado '
)' (
;( )
case 
HttpStatusCode #
.# $
NotFound$ ,
:, -
return 
NotFound #
(# $
	resultado$ -
)- .
;. /
case 
HttpStatusCode #
.# $

BadRequest$ .
:. /
return 

BadRequest %
(% &
	resultado& /
)/ 0
;0 1
default 
: 
return 

BadRequest %
(% &
)& '
;' (
} 
} 	
} 
} ”/
ë/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Api/Controllers/PretendenteController.cs
	namespace

 	
GL


 
.

 
ReiDoAlmoco

 
.

 
Api

 
.

 
Controllers

 (
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
Produces 
( 
$str  
)  !
]! "
public 

class !
PretendenteController &
:' (
ControllerPadrao) 9
{ 
private 
readonly #
IPretendenteRepositorio 0#
_pretendenteRepositorio1 H
;H I
private 
readonly 
	IMediator "
_bus# '
;' (
public !
PretendenteController $
($ %
	IMediator% .
bus/ 2
,2 3#
IPretendenteRepositorio4 K"
pretendenteRepositorioL b
)b c
{ 	
_bus 
= 
bus 
; #
_pretendenteRepositorio #
=$ %"
pretendenteRepositorio& <
;< =
} 	
[ 	
HttpGet	 
( 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Get) ,
(, -
)- .
{ 	
var 
pretendentes 
= 
await $#
_pretendenteRepositorio% <
.< =
ListarAsync= H
(H I
)I J
;J K
if 
( 
pretendentes 
!= 
null #
&&$ &
pretendentes' 3
.3 4
Any4 7
(7 8
)8 9
)9 :
return 
Ok 
( 
await #
_pretendenteRepositorio  7
.7 8
ListarAsync8 C
(C D
)D E
)E F
;F G
return 
NotFound 
( 
null  
)  !
;! "
}   	
["" 	
HttpGet""	 
("" 
$str"" 
)"" 
]"" 
public## 
async## 
Task## 
<## 
IActionResult## '
>##' (
Get##) ,
(##, -
Guid##- 1
id##2 4
)##4 5
{$$ 	
var%% 
pretendente%% 
=%% 
await%% ##
_pretendenteRepositorio%%$ ;
.%%; <

ObterAsync%%< F
(%%F G
id%%G I
)%%I J
;%%J K
if&& 
(&& 
pretendente&& 
!=&& 
null&& #
)&&# $
return'' 
Ok'' 
('' 
pretendente'' %
)''% &
;''& '
return(( 
NotFound(( 
((( 
$str(( 9
)((9 :
;((: ;
})) 	
[++ 	
HttpPost++	 
]++ 
public,, 
async,, 
Task,, 
<,, 
IActionResult,, '
>,,' (
Post,,) -
(,,- .
[,,. /
FromBody,,/ 7
],,7 8#
CriarPretendenteCommand,,9 P
model,,Q V
,,,V W
CancellationToken,,X i
cancellationToken,,j {
),,{ |
{-- 	
if.. 
(.. 

ModelState.. 
... 
IsValid.. "
).." #
return// !
RetornarRequestResult// ,
(//, -
await//- 2
_bus//3 7
.//7 8
Send//8 <
(//< =
model//= B
,//B C
cancellationToken//D U
)//U V
)//V W
;//W X
return00 

BadRequest00 
(00 
model00 #
)00# $
;00$ %
}11 	
[33 	
HttpPut33	 
(33 
$str33 
)33 
]33 
public44 
async44 
Task44 
<44 
IActionResult44 '
>44' (
Put44) ,
(44, -
Guid44- 1
id442 4
,444 5
[445 6
FromBody446 >
]44> ?$
EditarPretendenteCommand44@ X
model44Y ^
,44^ _
CancellationToken44` q
cancellationToken	44r É
)
44É Ñ
{55 	
if66 
(66 

ModelState66 
.66 
IsValid66 "
)66" #
{77 
model88 
.88 
Id88 
=88 
id88 
;88 
return99 !
RetornarRequestResult99 ,
(99, -
await99- 2
_bus993 7
.997 8
Send998 <
(99< =
model99= B
,99B C
cancellationToken99D U
)99U V
)99V W
;99W X
}:: 
return;; 

BadRequest;; 
(;; 
model;; #
);;# $
;;;$ %
}<< 	
[>> 	

HttpDelete>>	 
(>> 
$str>> 
)>> 
]>> 
public?? 
async?? 
Task?? 
<?? 
IActionResult?? '
>??' (
Delete??) /
(??/ 0
Guid??0 4
id??5 7
,??7 8
CancellationToken??9 J
cancellationToken??K \
)??\ ]
{@@ 	
varAA 
commandAA 
=AA 
newAA %
RemoverPretendenteCommandAA 7
(AA7 8
idAA8 :
)AA: ;
;AA; <
returnBB !
RetornarRequestResultBB (
(BB( )
awaitBB) .
_busBB/ 3
.BB3 4
SendBB4 8
(BB8 9
commandBB9 @
,BB@ A
cancellationTokenBBB S
)BBS T
)BBT U
;BBU V
}CC 	
}DD 
}EE  
ä/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Api/Controllers/VotoController.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Api 
. 
Controllers (
{		 
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str 
) 
] 
[ 
Produces 
( 
$str  
)  !
]! "
public 

class 
VotoController 
:  !
ControllerPadrao" 2
{ 
private 
readonly 
IVotoServico %
_votoServico& 2
;2 3
public 
VotoController 
( 
IVotoServico *
votoServico+ 6
)6 7
{ 	
_votoServico 
= 
votoServico &
;& '
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
)  
]  !
public 
async 
Task 
< 
IActionResult '
>' ( 
ListarVencedorPorDia) =
(= >
)> ?
{ 	
return 
Ok 
( 
await 
_votoServico (
.( )%
ListarVencedorPorDiaAsync) B
(B C
)C D
)D E
;E F
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
)  
]  !
public 
async 
Task 
< 
IActionResult '
>' (!
ListarVencedorSemanal) >
(> ?
)? @
{ 	
var   
	resultado   
=   
await   !
_votoServico  " .
.  . /&
ListarVencedorSemanalAsync  / I
(  I J
)  J K
;  K L
return!! 
Ok!! 
(!! 
	resultado!! 
)!!  
;!!  !
}"" 	
[$$ 	
HttpGet$$	 
]$$ 
[%% 	
Route%%	 
(%% 
$str%% 
)%%  
]%%  !
public&& 
async&& 
Task&& 
<&& 
IActionResult&& '
>&&' (
ObterEleicaoDoDia&&) :
(&&: ;
)&&; <
{'' 	
var(( 
	resultado(( 
=(( 
await(( !
_votoServico((" .
.((. /"
ObterEleicaoDoDiaAsync((/ E
(((E F
)((F G
;((G H
return)) 
Ok)) 
()) 
	resultado)) 
)))  
;))  !
}** 	
[,, 	
HttpPut,,	 
(,, 
$str,, 
),, 
],, 
public-- 
async-- 
Task-- 
<-- 
IActionResult-- '
>--' (
Computar--) 1
(--1 2
Guid--2 6
id--7 9
)--9 :
{.. 	
return// !
RetornarRequestResult// (
(//( )
await//) .
_votoServico/// ;
.//; <
ComputarAsync//< I
(//I J
new//J M
Voto//N R
(//R S
id//S U
)//U V
)//V W
)//W X
;//X Y
}00 	
[22 	
HttpGet22	 
]22 
[33 	
Route33	 
(33 
$str33 &
)33& '
]33' (
public44 
IActionResult44 
ObterPeriodoVotacao44 0
(440 1
)441 2
{55 	
return66 
Ok66 
(66 
_votoServico66 "
.66" #
ObterPeriodoVotacao66# 6
(666 7
)667 8
)668 9
;669 :
}77 	
}88 
}99 §O
í/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Api/Handlers/PretendenteCommandHandler.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Api 
. 
Handlers %
{ 
public 

class %
PretendenteCommandHandler *
:+ ,
IRequestHandler 
< #
CriarPretendenteCommand /
,/ 0
RequestResult1 >
>> ?
,? @
IRequestHandler 
< $
EditarPretendenteCommand 0
,0 1
RequestResult2 ?
>? @
,@ A
IRequestHandler 
< %
RemoverPretendenteCommand 1
,1 2
RequestResult3 @
>@ A
{ 
private 
readonly #
IPretendenteRepositorio 0#
_pretendenteRepositorio1 H
;H I
private 
readonly 
	IMediator "
_bus# '
;' (
private 
readonly 
ILogger  
_logger! (
;( )
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public %
PretendenteCommandHandler (
(( )#
IPretendenteRepositorio #"
pretendenteRepositorio$ :
,: ;
	IMediator 
bus 
, 
ILogger 
< %
PretendenteCommandHandler -
>- .
logger/ 5
,5 6
IConfiguration 
configuration (
)( )
{ 	#
_pretendenteRepositorio #
=$ %"
pretendenteRepositorio& <
;< =
_bus 
= 
bus 
; 
_logger 
= 
logger 
; 
_configuration   
=   
configuration   *
;  * +
}!! 	
public"" 
async"" 
Task"" 
<"" 
RequestResult"" '
>""' (
Handle"") /
(""/ 0#
CriarPretendenteCommand""0 G
request""H O
,""O P
CancellationToken""Q b
cancellationToken""c t
)""t u
{## 	
var$$ 
pretendente$$ 
=$$ 
new$$ !
Domain$$" (
.$$( )
Entities$$) 1
.$$1 2
Pretendente$$2 =
($$= >
request$$> E
.$$E F
Nome$$F J
,$$J K
request$$L S
.$$S T
Email$$T Y
)$$Y Z
;$$Z [
var%% 
validate%% 
=%% 
new%%  
PretendenteValidator%% 3
(%%3 4#
_pretendenteRepositorio%%4 K
)%%K L
.%%L M
Validate%%M U
(%%U V
pretendente%%V a
)%%a b
;%%b c
if&& 
(&& 
!&& 
validate&& 
.&& 
IsValid&& !
)&&! "
{'' 
_logger(( 
.(( 
LogError((  
(((  !
$str((! =
+((> ?
validate((@ H
.((H I
Errors((I O
.((O P
FirstOrDefault((P ^
(((^ _
)((_ `
.((` a
ErrorMessage((a m
)((m n
;((n o
return)) 
new)) 
RequestResult)) (
())( )
)))) *
.))* +

BadRequest))+ 5
())5 6
validate))6 >
.))> ?
Errors))? E
.))E F
Select))F L
())L M
p))M N
=>))O Q
p))R S
.))S T
ErrorMessage))T `
)))` a
.))a b
ToArray))b i
())i j
)))j k
)))k l
;))l m
}** 
await,, #
_pretendenteRepositorio,, )
.,,) *
AdicionarAsync,,* 8
(,,8 9
pretendente,,9 D
),,D E
;,,E F
await-- 
_bus-- 
.-- 
Publish-- 
(-- 
new-- ""
PretendenteCriadoEvent--# 9
(--9 :
request--: A
.--A B
Nome--B F
,--F G
request--H O
.--O P
Email--P U
)--U V
,--V W
cancellationToken--X i
)--i j
;--j k
return.. 
new.. 
RequestResult.. $
(..$ %
)..% &
...& '
Ok..' )
(..) *
)..* +
;..+ ,
}// 	
public11 
async11 
Task11 
<11 
RequestResult11 '
>11' (
Handle11) /
(11/ 0$
EditarPretendenteCommand110 H
request11I P
,11P Q
CancellationToken11R c
cancellationToken11d u
)11u v
{22 	
var33 
pretendenteDb33 
=33 
await33  %#
_pretendenteRepositorio33& =
.33= >

ObterAsync33> H
(33H I
request33I P
.33P Q
Id33Q S
)33S T
;33T U
if44 
(44 
pretendenteDb44 
==44  
null44! %
)44% &
{55 
_logger66 
.66 
LogError66  
(66  !
$"66! #/
#[Editar pretendente] - pretendente 66# F
{66F G
request66G N
.66N O
Id66O Q
}66Q R
 n√£o encontrato.66R b
"66b c
)66c d
;66d e
return77 
new77 
RequestResult77 (
(77( )
)77) *
.77* +
NotFound77+ 3
(773 4
)774 5
;775 6
}88 
pretendenteDb:: 
.:: 
AtualizarNome:: '
(::' (
request::( /
.::/ 0
Nome::0 4
)::4 5
;::5 6
var<< 
validate<< 
=<< 
new<<  
PretendenteValidator<< 3
(<<3 4#
_pretendenteRepositorio<<4 K
)<<K L
.<<L M
Validate<<M U
(<<U V
pretendenteDb<<V c
)<<c d
;<<d e
if== 
(== 
!== 
validate== 
.== 
IsValid== !
)==! "
{>> 
_logger?? 
.?? 
LogError??  
(??  !
$str??! :
+??; <
validate??= E
.??E F
Errors??F L
.??L M
FirstOrDefault??M [
(??[ \
)??\ ]
.??] ^
ErrorMessage??^ j
)??j k
;??k l
return@@ 
new@@ 
RequestResult@@ (
(@@( )
)@@) *
.@@* +

BadRequest@@+ 5
(@@5 6
validate@@6 >
.@@> ?
Errors@@? E
.@@E F
Select@@F L
(@@L M
p@@M N
=>@@O Q
p@@R S
.@@S T
ErrorMessage@@T `
)@@` a
.@@a b
ToArray@@b i
(@@i j
)@@j k
)@@k l
;@@l m
}AA 
awaitCC #
_pretendenteRepositorioCC )
.CC) *
AtualizarAsyncCC* 8
(CC8 9
pretendenteDbCC9 F
)CCF G
;CCG H
awaitDD 
_busDD 
.DD 
PublishDD 
(DD 
newDD "#
PretendenteEditadoEventDD# :
(DD: ;
requestDD; B
.DDB C
IdDDC E
,DDE F
requestDDG N
.DDN O
NomeDDO S
)DDS T
,DDT U
cancellationTokenDDV g
)DDg h
;DDh i
returnEE 
newEE 
RequestResultEE $
(EE$ %
)EE% &
.EE& '
OkEE' )
(EE) *
)EE* +
;EE+ ,
}FF 	
publicHH 
asyncHH 
TaskHH 
<HH 
RequestResultHH '
>HH' (
HandleHH) /
(HH/ 0%
RemoverPretendenteCommandHH0 I
requestHHJ Q
,HHQ R
CancellationTokenHHS d
cancellationTokenHHe v
)HHv w
{II 	
varJJ 
pretendenteDbJJ 
=JJ 
awaitJJ  %#
_pretendenteRepositorioJJ& =
.JJ= >

ObterAsyncJJ> H
(JJH I
requestJJI P
.JJP Q
IdJJQ S
)JJS T
;JJT U
ifKK 
(KK 
pretendenteDbKK 
==KK  
nullKK! %
)KK% &
{LL 
_loggerMM 
.MM 
LogErrorMM  
(MM  !
$"MM! #0
$[Remover pretendente] - pretendente MM# G
{MMG H
requestMMH O
.MMO P
IdMMP R
}MMR S
 n√£o encontrato.MMS c
"MMc d
)MMd e
;MMe f
returnNN 
newNN 
RequestResultNN (
(NN( )
)NN) *
.NN* +
NotFoundNN+ 3
(NN3 4
)NN4 5
;NN5 6
}OO 
awaitQQ #
_pretendenteRepositorioQQ )
.QQ) *
RemoverAsyncQQ* 6
(QQ6 7
requestQQ7 >
.QQ> ?
IdQQ? A
)QQA B
;QQB C
awaitRR 
_busRR 
.RR 
PublishRR 
(RR 
newRR "$
PretendenteRemovidoEventRR# ;
(RR; <
requestRR< C
.RRC D
IdRRD F
)RRF G
)RRG H
;RRH I
varTT 
avatarTT 
=TT 
newTT 
AvatarArquivoTT *
(TT* +
requestTT+ 2
.TT2 3
IdTT3 5
.TT5 6
ToStringTT6 >
(TT> ?
)TT? @
,TT@ A
_configurationTTB P
)TTP Q
;TTQ R
avatarUU 
.UU 
RemoverAvatarUU  
(UU  !
)UU! "
;UU" #
returnWW 
newWW 
RequestResultWW $
(WW$ %
)WW% &
.WW& '
OkWW' )
(WW) *
)WW* +
;WW+ ,
}XX 	
}YY 
}ZZ ‰
ê/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Api/Handlers/PretendenteEventHandler.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Api 
. 
Handlers %
{ 
public 

class #
PretendenteEventHandler (
:) * 
INotificationHandler		 
<		 "
PretendenteCriadoEvent		 3
>		3 4
,		4 5 
INotificationHandler

 
<

 #
PretendenteEditadoEvent

 4
>

4 5
,

5 6 
INotificationHandler 
< $
PretendenteRemovidoEvent 5
>5 6
{ 
private 
readonly 
ILogger  
_logger! (
;( )
public #
PretendenteEventHandler &
(& '
ILogger 
< #
PretendenteEventHandler +
>+ ,
logger- 3
)3 4
{ 	
_logger 
= 
logger 
; 
} 	
public 
Task 
Handle 
( "
PretendenteCriadoEvent 1
notification2 >
,> ?
CancellationToken@ Q
cancellationTokenR c
)c d
{ 	
_logger 
. 
LogInformation "
(" #
$"# %*
Novo pretendente: \r\n  nome: % C
{C D
notificationD P
.P Q
NomeQ U
}U V
 \r\n  e-mail: V e
{e f
notificationf r
.r s
Emails x
}x y
"y z
)z {
;{ |
return 
Task 
. 
CompletedTask %
;% &
} 	
public 
Task 
Handle 
( #
PretendenteEditadoEvent 2
notification3 ?
,? @
CancellationTokenA R
cancellationTokenS d
)d e
{ 	
_logger 
. 
LogInformation "
(" #
$"# %
Pretendente % 1
{1 2
notification2 >
.> ?
Id? A
}A B(
 teve o nome alterado para: B ^
{^ _
notification_ k
.k l
Nomel p
}p q
.q r
"r s
)s t
;t u
return 
Task 
. 
CompletedTask %
;% &
} 	
public 
Task 
Handle 
( $
PretendenteRemovidoEvent 3
notification4 @
,@ A
CancellationTokenB S
cancellationTokenT e
)e f
{   	
_logger!! 
.!! 
LogInformation!! "
(!!" #
$"!!# %
Pretendente !!% 1
{!!1 2
notification!!2 >
.!!> ?
Id!!? A
}!!A B
 foi removido.!!B P
"!!P Q
)!!Q R
;!!R S
return"" 
Task"" 
."" 
CompletedTask"" %
;""% &
}## 	
}$$ 
}%% Ì

w/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Api/Program.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Api 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	 
CreateWebHostBuilder  
(  !
args! %
)% &
.& '
Run' *
(* +
)+ ,
;, -
} 	
public 
static 
IWebHost  
CreateWebHostBuilder 3
(3 4
string4 :
[: ;
]; <
args= A
)A B
=>C E
WebHost 
.  
CreateDefaultBuilder (
(( )
args) -
)- .
. 

UseStartup 
< 
Startup #
># $
($ %
)% &
. 
UseUrls 
( 
$str 0
)0 1
. 

UseKestrel 
( 
) 
. 
Build 
( 
) 
; 
} 
} É
w/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Api/Startup.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Api 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddControllers #
(# $
)$ %
;% &
var 
assembly 
= 
	AppDomain $
.$ %
CurrentDomain% 2
.2 3
Load3 7
(7 8
$str8 L
)L M
;M N
services 
. 

AddMediatR 
(  
assembly  (
)( )
;) *
services 
. 
	AddScoped 
< 
ReiDoAlmocoContext 1
>1 2
(2 3
)3 4
;4 5
services   
.   
	AddScoped   
<   #
IPretendenteRepositorio   6
,  6 7"
PretendenteRepositorio  8 N
>  N O
(  O P
)  P Q
;  Q R
services!! 
.!! 
	AddScoped!! 
<!! 
IAvatarServico!! -
,!!- .
AvatarServico!!/ <
>!!< =
(!!= >
)!!> ?
;!!? @
services"" 
."" 
	AddScoped"" 
<"" 
IVotoRepositorio"" /
,""/ 0
VotoRepositorio""1 @
>""@ A
(""A B
)""B C
;""C D
services## 
.## 
	AddScoped## 
<## 
IVotoServico## +
,##+ ,
VotoServico##- 8
>##8 9
(##9 :
)##: ;
;##; <
}$$ 	
public'' 
void'' 
	Configure'' 
('' 
IApplicationBuilder'' 1
app''2 5
,''5 6
IWebHostEnvironment''7 J
env''K N
)''N O
{(( 	
if)) 
()) 
env)) 
.)) 
IsDevelopment)) !
())! "
)))" #
)))# $
{** 
app++ 
.++ %
UseDeveloperExceptionPage++ -
(++- .
)++. /
;++/ 0
},, 
app.. 
... 
UseHttpsRedirection.. #
(..# $
)..$ %
;..% &
app00 
.00 

UseRouting00 
(00 
)00 
;00 
app22 
.22 
UseAuthorization22  
(22  !
)22! "
;22" #
app33 
.33 
UseStaticFiles33 
(33 
)33  
;33  !
app55 
.55 
UseEndpoints55 
(55 
	endpoints55 &
=>55' )
{66 
	endpoints77 
.77 
MapControllers77 (
(77( )
)77) *
;77* +
}88 
)88 
;88 
}99 	
}:: 
};; 