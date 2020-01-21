‰
ã/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Controllers/AvatarController.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Controllers )
{ 
public		 

class		 
AvatarController		 !
:		" #

Controller		$ .
{

 
private 
readonly 
IAvatarServico '
_avatarServico( 6
;6 7
private 
readonly 
IPretendenteServico ,
_pretendenteServico- @
;@ A
public 
AvatarController 
(  
IAvatarServico 
avatarServico (
,( )
IPretendenteServico 
pretendenteServico  2
)2 3
{ 	
_avatarServico 
= 
avatarServico *
;* +
_pretendenteServico 
=  !
pretendenteServico" 4
;4 5
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Alterar) 0
(0 1
Guid1 5
id6 8
)8 9
{ 	
var 
pretendente 
= 
await #
_pretendenteServico$ 7
.7 8

ObterAsync8 B
(B C
idC E
)E F
;F G
var 
model 
= 
new 
AlterarAvatarModel .
(. /
pretendente/ :
.: ;
Id; =
,= >
pretendente? J
.J K
NomeK O
)O P
;P Q
return 
View 
( 
model 
) 
; 
} 	
[ 	
HttpPost	 
( 
$str 
) 
]  
public 
async 
Task 
< 
IActionResult '
>' (
	Adicionar) 2
(2 3
AlterarAvatarModel3 E
modelF K
)K L
{ 	
var 
	resultado 
= 
await !
_avatarServico" 0
.0 1
AlterarAsync1 =
(= >
model> C
)C D
;D E
if   
(   
	resultado   
.   
Sucesso   !
)  ! "
return!! 
RedirectToAction!! '
(!!' (
$str!!( /
,!!/ 0
$str!!1 ?
)!!? @
;!!@ A
foreach## 
(## 
string## 
error## !
in##" $
	resultado##% .
.##. /
Errors##/ 5
)##5 6

ModelState$$ 
.$$ 
AddModelError$$ (
($$( )
$str$$) +
,$$+ ,
error$$- 2
)$$2 3
;$$3 4
return%% 
View%% 
(%% 
model%% 
)%% 
;%% 
}&& 	
[(( 	
HttpGet((	 
](( 
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
Imagem))) /
())/ 0
Guid))0 4
id))5 7
)))7 8
{** 	
byte++ 
[++ 
]++ 
img++ 
=++ 
await++ 
_avatarServico++ -
.++- .

ObterAsync++. 8
(++8 9
id++9 ;
)++; <
;++< =
if,, 
(,, 
img,, 
!=,, 
null,, 
),, 
{-- 
return.. 
File.. 
(.. 
img.. 
,..  
$str..! -
)..- .
;... /
}// 
return00 
File00 
(00 
$str00 7
,007 8
$str009 D
)00D E
;00E F
}11 	
}22 
}33 ¬
â/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Controllers/HomeController.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Controllers )
{ 
public 

class 
HomeController 
:  !

Controller" ,
{ 
private 
readonly 
ILogger  
_logger! (
;( )
private 
readonly 
IVotoServico %
_votoServico& 2
;2 3
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
HomeController 
( 
ILogger %
<% &
HomeController& 4
>4 5
logger6 <
,< =
IVotoServico> J
votoServicoK V
,V W
IConfigurationX f
configurationg t
)t u
{ 	
_logger 
= 
logger 
; 
_votoServico 
= 
votoServico &
;& '
_configuration 
= 
configuration *
;* +
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Index) .
(. /
)/ 0
{ 	
var 
vencedoresDiarios !
=" #
await$ )
_votoServico* 6
.6 7%
ListarVencedorDiarioAsync7 P
(P Q
)Q R
??S U
newV Y$
ListaVencedorDiarioModelZ r
(r s
)s t
;t u
var 
vencedoresSemanais "
=# $
await% *
_votoServico+ 7
.7 8&
ListarVencedorSemanalAsync8 R
(R S
)S T
??U W
newX [%
ListaVencedorSemanalModel\ u
(u v
)v w
;w x
var   
periodoVotacao   
=    
await  ! &
_votoServico  ' 3
.  3 4
ObterPeriodoVotacao  4 G
(  G H
)  H I
;  I J
var!! 
model!! 
=!! 
new!! 
	HomeModel!! %
(!!% &
periodoVotacao!!& 4
,!!4 5
vencedoresDiarios!!6 G
,!!G H
vencedoresSemanais!!I [
)!![ \
;!!\ ]
return"" 
View"" 
("" 
model"" 
)"" 
;"" 
}## 	
public%% 
IActionResult%% 
Privacy%% $
(%%$ %
)%%% &
{&& 	
return'' 
View'' 
('' 
)'' 
;'' 
}(( 	
[** 	
ResponseCache**	 
(** 
Duration** 
=**  !
$num**" #
,**# $
Location**% -
=**. /!
ResponseCacheLocation**0 E
.**E F
None**F J
,**J K
NoStore**L S
=**T U
true**V Z
)**Z [
]**[ \
public++ 
IActionResult++ 
Error++ "
(++" #
)++# $
{,, 	
return-- 
View-- 
(-- 
new-- 
ErrorViewModel-- *
{--+ ,
	RequestId--- 6
=--7 8
Activity--9 A
.--A B
Current--B I
?--I J
.--J K
Id--K M
??--N P
HttpContext--Q \
.--\ ]
TraceIdentifier--] l
}--m n
)--n o
;--o p
}.. 	
}// 
}00 ÅA
ë/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Controllers/PretendentesController.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Controllers )
{ 
public		 

class		 "
PretendentesController		 '
:		( )

Controller		* 4
{

 
private 
readonly 
IPretendenteServico ,
_servico- 5
;5 6
public "
PretendentesController %
(% &
IPretendenteServico& 9
servico: A
)A B
{ 	
_servico 
= 
servico 
; 
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Index) .
(. /
)/ 0
{ 	
return 
View 
( 
await 
_servico &
.& '
ListarAsync' 2
(2 3
)3 4
)4 5
;5 6
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Perfil) /
(/ 0
Guid0 4
id5 7
)7 8
{ 	
var 
model 
= 
await 
_servico &
.& '

ObterAsync' 1
(1 2
id2 4
)4 5
;5 6
return 
View 
( 
model 
) 
; 
} 	
public 
IActionResult 
	Adicionar &
(& '
)' (
{ 	
return 
View 
( 
new 
AdicionarModel *
(* +
$str+ -
,- .
$str/ 1
)1 2
)2 3
;3 4
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
	Adicionar) 2
(2 3
AdicionarModel3 A
modelB G
)G H
{ 	
if   
(   
!   

ModelState   
.   
IsValid   "
)  " #
return!! 
View!! 
(!! 
model!! !
)!!! "
;!!" #
var## 
	resultado## 
=## 
await## !
_servico##" *
.##* +
AdicionarAsync##+ 9
(##9 :
model##: ?
)##? @
;##@ A
if$$ 
($$ 
	resultado$$ 
.$$ 
Sucesso$$ !
)$$! "
return%% 
RedirectToAction%% '
(%%' (
$str%%( /
)%%/ 0
;%%0 1
foreach'' 
('' 
string'' 
error'' !
in''" $
	resultado''% .
.''. /
Errors''/ 5
)''5 6

ModelState(( 
.(( 
AddModelError(( (
(((( )
$str(() +
,((+ ,
error((- 2
)((2 3
;((3 4
return)) 
View)) 
()) 
model)) 
))) 
;)) 
}** 	
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' (
Editar++) /
(++/ 0
Guid++0 4
id++5 7
)++7 8
{,, 	
var-- 
pretendente-- 
=-- 
await-- #
_servico--$ ,
.--, -

ObterAsync--- 7
(--7 8
id--8 :
)--: ;
;--; <
if.. 
(.. 
pretendente.. 
!=.. 
null.. "
).." #
{// 
var00 
model00 
=00 
new00 
EditarModel00  +
(00+ ,
pretendente00, 7
.007 8
Id008 :
,00: ;
pretendente00< G
.00G H
Nome00H L
)00L M
;00M N
return11 
View11 
(11 
model11 !
)11! "
;11" #
}22 
return33 
RedirectToAction33 #
(33# $
$str33$ +
,33+ ,
$str33- 3
)333 4
;334 5
}44 	
[55 	
HttpPost55	 
]55 
public66 
async66 
Task66 
<66 
IActionResult66 '
>66' (
Editar66) /
(66/ 0
EditarModel660 ;
model66< A
)66A B
{77 	
if88 
(88 
!88 

ModelState88 
.88 
IsValid88 "
)88" #
return99 
View99 
(99 
model99 !
)99! "
;99" #
var;; 
	resultado;; 
=;; 
await;; !
_servico;;" *
.;;* +
AtualizarAsync;;+ 9
(;;9 :
model;;: ?
);;? @
;;;@ A
if<< 
(<< 
	resultado<< 
.<< 
Sucesso<< !
)<<! "
return== 
RedirectToAction== '
(==' (
$str==( /
)==/ 0
;==0 1
foreach?? 
(?? 
string?? 
error?? !
in??" $
	resultado??% .
.??. /
Errors??/ 5
)??5 6

ModelState@@ 
.@@ 
AddModelError@@ (
(@@( )
$str@@) +
,@@+ ,
error@@- 2
)@@2 3
;@@3 4
returnAA 
ViewAA 
(AA 
modelAA 
)AA 
;AA 
}BB 	
publicCC	 
asyncCC 
TaskCC 
<CC 
IActionResultCC (
>CC( )
RemoverCC* 1
(CC1 2
GuidCC2 6
idCC7 9
)CC9 :
{DD 	
varEE 
pretendenteEE 
=EE 
awaitEE #
_servicoEE$ ,
.EE, -

ObterAsyncEE- 7
(EE7 8
idEE8 :
)EE: ;
;EE; <
ifFF 
(FF 
pretendenteFF 
!=FF 
nullFF "
)FF" #
{GG 
varHH 
modelHH 
=HH 
newHH 
RemoverModelHH  ,
(HH, -
pretendenteHH- 8
.HH8 9
IdHH9 ;
,HH; <
pretendenteHH= H
.HHH I
NomeHHI M
)HHM N
;HHN O
returnII 
ViewII 
(II 
modelII !
)II! "
;II" #
}JJ 
returnKK 
RedirectToActionKK #
(KK# $
$strKK$ +
,KK+ ,
$strKK- 3
)KK3 4
;KK4 5
}LL 	
[MM 	
HttpPostMM	 
]MM 
publicNN 
asyncNN 
TaskNN 
<NN 
IActionResultNN '
>NN' (
RemoverNN) 0
(NN0 1
RemoverModelNN1 =
modelNN> C
)NNC D
{OO 	
ifPP 
(PP 
!PP 

ModelStatePP 
.PP 
IsValidPP "
)PP" #
returnQQ 
ViewQQ 
(QQ 
modelQQ !
)QQ! "
;QQ" #
varSS 
	resultadoSS 
=SS 
awaitSS !
_servicoSS" *
.SS* +
RemoverAsyncSS+ 7
(SS7 8
modelSS8 =
)SS= >
;SS> ?
ifTT 
(TT 
	resultadoTT 
.TT 
SucessoTT !
)TT! "
returnUU 
RedirectToActionUU '
(UU' (
$strUU( /
)UU/ 0
;UU0 1
foreachWW 
(WW 
stringWW 
errorWW !
inWW" $
	resultadoWW% .
.WW. /
ErrorsWW/ 5
)WW5 6

ModelStateXX 
.XX 
AddModelErrorXX (
(XX( )
$strXX) +
,XX+ ,
errorXX- 2
)XX2 3
;XX3 4
returnYY 
ViewYY 
(YY 
modelYY 
)YY 
;YY 
}ZZ 	
}[[ 
}\\ ç
â/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Controllers/VotoController.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Controllers )
{		 
public

 

class

 
VotoController

 
:

  !

Controller

" ,
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IPretendenteServico ,
_pretendenteServico- @
;@ A
private 
readonly 
IVotoServico %
_votoServico& 2
;2 3
public 
VotoController 
( 
IConfiguration ,
configuration- :
,: ;
IPretendenteServico< O
pretendenteServicoP b
,b c
IVotoServicod p
votoServicoq |
)| }
{ 	
_configuration 
= 
configuration *
;* +
_pretendenteServico 
=  !
pretendenteServico" 4
;4 5
_votoServico 
= 
votoServico &
;& '
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Votar) .
(. /
)/ 0
{ 	
var 
periodoVotacao 
=  
await! &
_votoServico' 3
.3 4
ObterPeriodoVotacao4 G
(G H
)H I
;I J
var !
resultadoEleicaoDoDia %
=& '
await( -
_votoServico. :
.: ;
ObterEleicaoDoDia; L
(L M
)M N
;N O
var 
model 
= 
new 

VotarModel &
(& '!
resultadoEleicaoDoDia' <
,< =
periodoVotacao> L
)L M
;M N
return 
View 
( 
model 
) 
; 
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
bool 
> 
Votar  %
(% &
Guid& *
pretendenteId+ 8
)8 9
{   	
var!! 
	resultado!! 
=!! 
await!! !
_votoServico!!" .
.!!. /

VotarAsync!!/ 9
(!!9 :
pretendenteId!!: G
)!!G H
;!!H I
return"" 
	resultado"" 
."" 
Sucesso"" $
;""$ %
}## 	
public%% 
IActionResult%% 
VotoConfirmado%% +
(%%+ ,
)%%, -
{&& 	
return'' 
View'' 
('' 
)'' 
;'' 
}(( 	
})) 
}** À
è/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Models/Avatar/AlterarAvatarModel.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Models $
.$ %
Avatar% +
{ 
public 

class 
AlterarAvatarModel #
{ 
public 
AlterarAvatarModel !
(! "
)" #
{		 	
}

 	
public 
AlterarAvatarModel !
(! "
Guid" &
idDoPretendente' 6
,6 7
string8 >
nomeDoPretendente? P
)P Q
{ 	
IdDoPretendente 
= 
idDoPretendente -
;- .
NomeDoPretendente 
= 
nomeDoPretendente  1
;1 2
} 	
public 
Guid 
IdDoPretendente #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
NomeDoPretendente '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
	IFormFile 
Arquivo  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
static 
byte 
[ 
] 
ArquivoToByte *
(* +
	IFormFile+ 4
arquivo5 <
)< =
{ 	
byte 
[ 
] 
data 
; 
using 
( 
var 
br 
= 
new 
BinaryReader  ,
(, -
arquivo- 4
.4 5
OpenReadStream5 C
(C D
)D E
)E F
)F G
data 
= 
br 
. 
	ReadBytes #
(# $
($ %
int% (
)( )
arquivo) 0
.0 1
OpenReadStream1 ?
(? @
)@ A
.A B
LengthB H
)H I
;I J
return 
data 
; 
} 	
} 
} í
Ñ/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Models/ErrorViewModel.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Models $
{ 
public 

class 
ErrorViewModel 
{ 
public 
string 
	RequestId 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
bool		 
ShowRequestId		 !
=>		" $
!		% &
string		& ,
.		, -
IsNullOrEmpty		- :
(		: ;
	RequestId		; D
)		D E
;		E F
}

 
} §
/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Models/HomeModel.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Models $
{ 
public 

class 
	HomeModel 
{ 
public 
	HomeModel 
( 
PeriodoVotacaoModel ,
periodoVotacao- ;
,; <$
ListaVencedorDiarioModel= U
listaVencedorDiaV f
,f g&
ListaVencedorSemanalModel	h Å"
listavencedorSemanal
Ç ñ
)
ñ ó
{ 	
PeriodoVotacao 
= 
periodoVotacao +
;+ ,#
ListaDeVencedoresDiario		 #
=		$ %
listaVencedorDia		& 6
;		6 7$
ListaDeVencedoresSemanal

 $
=

% & 
listavencedorSemanal

' ;
;

; <
} 	
public 
PeriodoVotacaoModel "
PeriodoVotacao# 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public $
ListaVencedorDiarioModel '#
ListaDeVencedoresDiario( ?
{@ A
getB E
;E F
setG J
;J K
}L M
public %
ListaVencedorSemanalModel ($
ListaDeVencedoresSemanal) A
{B C
getD G
;G H
setI L
;L M
}N O
} 
} ›
ê/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Models/Pretendente/AdicionarModel.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Models $
.$ %
Pretendente% 0
{ 
public 

class 
AdicionarModel 
{ 
public 
AdicionarModel 
( 
) 
{ 	
}

 	
public 
AdicionarModel 
( 
string $
nome% )
,) *
string+ 1
email2 7
)7 8
{ 	
Nome 
= 
nome 
; 
Email 
= 
email 
; 
} 	
[ 	
Required	 
( 
ErrorMessage 
=  
$str! ;
); <
]< =
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
( 
ErrorMessage 
=  
$str  <
)< =
]= >
[ 	
EmailAddress	 
( 
ErrorMessage "
=" #
$str# ?
)? @
]@ A
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
} £

ç/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Models/Pretendente/EditarModel.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Models $
.$ %
Pretendente% 0
{ 
public 

class 
EditarModel 
{ 
public 
EditarModel 
( 
) 
{		 	
} 	
public 
EditarModel 
( 
Guid 
id  "
," #
string$ *
nome+ /
)/ 0
{ 	
Id 
= 
id 
; 
Nome 
= 
nome 
; 
} 	
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
[ 	
Required	 
( 
ErrorMessage 
=  
$str! ;
); <
]< =
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
} 
} Ñ
ó/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Models/Pretendente/PretendenteListaModel.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Models $
.$ %
Pretendente% 0
{ 
public 

class !
PretendenteListaModel &
{ 
public !
PretendenteListaModel $
($ %
IEnumerable% 0
<0 1
PretendenteModel1 A
>A B
pretendentesC O
)O P
{ 	
Pretendentes		 
=		 
new		 
List		 #
<		# $
PretendenteModel		$ 4
>		4 5
(		5 6
)		6 7
;		7 8
if

 
(

 
pretendentes

 
!=

 
null

  $
)

$ %
Pretendentes 
. 
AddRange %
(% &
pretendentes& 2
.2 3
Select3 9
(9 :
p: ;
=>< >
new? B
PretendenteModelC S
(S T
pT U
.U V
IdV X
,X Y
pZ [
.[ \
Nome\ `
,` a
pb c
.c d
Emaild i
)i j
)j k
)k l
;l m
} 	
public 
List 
< 
PretendenteModel $
>$ %
Pretendentes& 2
{3 4
get5 8
;8 9
set; >
;> ?
}@ A
public 
bool 
TemPretendente "
{ 	
get 
{ 
return 
( 
Pretendentes $
!=% '
null( ,
&&- /
Pretendentes0 <
.< =
Any= @
(@ A
)A B
)B C
;C D
} 
} 	
} 
} Ω
í/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Models/Pretendente/PretendenteModel.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Models $
.$ %
Pretendente% 0
{ 
public 

class 
PretendenteModel !
{ 
public 
PretendenteModel 
(  
)  !
{" #
}$ %
public 
PretendenteModel 
(  
Guid  $
id% '
,' (
string) /
nome0 4
,4 5
string6 <
email= B
)B C
{ 	
Id		 
=		 
id		 
;		 
Nome

 
=

 
nome

 
;

 
Email 
= 
email 
; 
} 	
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ö	
é/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Models/Pretendente/RemoverModel.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Models $
.$ %
Pretendente% 0
{ 
public 

class 
RemoverModel 
{ 
public 
RemoverModel 
( 
) 
{ 	
}		 	
public

 
RemoverModel

 
(

 
Guid

  
id

! #
,

# $
string

% +
nome

, 0
)

0 1
{ 	
Id 
= 
id 
; 
Nome 
= 
nome 
; 
} 	
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
} 
} Ω
å/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Models/Voto/EleicaoDoDiaModel.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Models $
.$ %
Voto% )
{ 
public 

class 
EleicaoDoDiaModel "
{ 
public 
Guid 
PretendenteId !
{" #
get$ '
;' (
set* -
;- .
}/ 0
public 
string 
NomePretendente %
{& '
get( +
;+ ,
set. 1
;1 2
}3 4
public		 
int		 
TotalDeVotos		 
{		  !
get		" %
;		% &
set		( +
;		+ ,
}		- .
public

 
double

 
Porcentagem

 !
{

" #
get

$ '
;

' (
set

* -
;

- .
}

/ 0
} 
} —
ì/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Models/Voto/ListaVencedorDiarioModel.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Models $
.$ %
Voto% )
{ 
public 

class $
ListaVencedorDiarioModel )
{ 
public $
ListaVencedorDiarioModel '
(' (
)( )
{		 	
ListaDeVencedores

 
=

 
new

  #
List

$ (
<

( )
VencedorDoDia

) 6
>

6 7
(

7 8
)

8 9
;

9 :
} 	
public 
bool 
TemResultado  
{! "
get# &
{( )
return* 0
(1 2
ListaDeVencedores2 C
!=D F
nullG K
&&L N
ListaDeVencedoresO `
.` a
Anya d
(d e
)e f
)f g
;g h
}i j
}k l
public 
List 
< 
VencedorDoDia !
>! "
ListaDeVencedores# 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
} 
public 

class 
VencedorDoDia 
{ 
public 
DateTime 
Dia 
{ 
get !
;! "
set# &
;& '
}( )
public 
Guid 
PretendenteId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
NomePretendente %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
int 
TotalDeVotos 
{  !
get" %
;% &
set' *
;* +
}, -
public 
double 
Porcentagem !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
EmAndamento 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
FormatarData "
(" #
DateTime# +
data, 0
)0 1
{ 	
if 
( 
data 
== 
null 
) 
return #
string$ *
.* +
Empty+ 0
;0 1
return 
data 
. 
ToString  
(  !
$str! -
)- .
;. /
} 	
} 
} â
î/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Models/Voto/ListaVencedorSemanalModel.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Models $
.$ %
Voto% )
{ 
public 

class %
ListaVencedorSemanalModel *
{ 
public		 %
ListaVencedorSemanalModel		 (
(		( )
)		) *
{

 	
ListaDeVencedores 
= 
new  #
List$ (
<( )
VencedorDaSemana) 9
>9 :
(: ;
); <
;< =
} 	
public 
List 
< 
VencedorDaSemana $
>$ %
ListaDeVencedores& 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
bool 
TemResultado  
{! "
get# &
{' (
return) /
(0 1
ListaDeVencedores1 B
!=C E
nullF J
&&K M
ListaDeVencedoresN _
._ `
Any` c
(c d
)d e
)e f
;f g
}h i
}j k
} 
public 

class 
VencedorDaSemana !
{ 
public 
DateTime 
InicioDaSemana &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DateTime 
FimDaSemana #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
Guid 
PretendenteId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
NomePretendente %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
int 
TotalDeVotos 
{  !
get" %
;% &
set' *
;* +
}, -
public 
double 
Porcentagem !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
EmAndamento 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
FormatarData "
(" #
DateTime# +
data, 0
)0 1
{ 	
if 
( 
data 
== 
null 
) 
return $
string% +
.+ ,
Empty, 1
;1 2
return 
data 
. 
ToString  
(  !
$str! -
)- .
;. /
}   	
}!! 
}"" ƒ
é/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Models/Voto/PeriodoVotacaoModel.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Models $
.$ %
Voto% )
{ 
public 

class 
PeriodoVotacaoModel $
{ 
public 
DateTime 
InicioVotacao %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 

FimVotacao "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
VotacaoEncerrada $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public		 
string		 
Mensagem		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
}

 
} ∂
Ö/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Models/Voto/VotarModel.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Models $
.$ %
Voto% )
{ 
public 

class 

VotarModel 
{ 
public 

VotarModel 
( 
IEnumerable %
<% &
EleicaoDoDiaModel& 7
>7 8
resultadoDoDia9 G
,G H
PeriodoVotacaoModelI \
periodoVotacao] k
)k l
{		 	
ResultadoDoDia

 
=

 
resultadoDoDia

 +
;

+ ,
PeriodoVotacao 
= 
periodoVotacao +
;+ ,
} 	
public 
PeriodoVotacaoModel "
PeriodoVotacao# 1
{2 3
get4 7
;7 8
private9 @
setA D
;D E
}F G
public 
IEnumerable 
< 
EleicaoDoDiaModel ,
>, -
ResultadoDoDia. <
{= >
get? B
;B C
privateD K
setL O
;O P
}Q R
public 
bool 
TemResultado  
{! "
get# &
{' (
return) /
(0 1
ResultadoDoDia1 ?
!=@ B
nullC G
&&H J
ResultadoDoDiaK Y
.Y Z
AnyZ ]
(] ^
)^ _
)_ `
;` a
}b c
}d e
} 
} è
v/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Program.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
{ 
public 

class 
Program 
{ 
public		 
static		 
void		 
Main		 
(		  
string		  &
[		& '
]		' (
args		) -
)		- .
{

 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} $
Ö/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Services/AvatarServico.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Services &
{ 
public 

class 
AvatarServico 
:  
IAvatarServico! /
{ 
private 
readonly 

HttpClient #
_httpClient$ /
;/ 0
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
AvatarServico 
( 
IHttpClientFactory /
httpClientFactory0 A
,A B
IConfigurationC Q
configurationR _
)_ `
{ 	
_configuration 
= 
configuration *
;* +
_httpClient 
= 
httpClientFactory +
.+ ,
CreateClient, 8
(8 9
)9 :
;: ;
_httpClient 
. 
BaseAddress #
=$ %
new& )
Uri* -
(- .
_configuration. <
[< =
$str= E
]E F
)F G
;G H
} 	
public 
async 
Task 
< 
RequestResult '
>' (
AlterarAsync) 5
(5 6
AlterarAvatarModel6 H
modelI N
)N O
{ 	
var 
content 
= 
CriarContent &
(& '
model' ,
., -
Arquivo- 4
)4 5
;5 6
using 
( 
var 
response 
=  !
await" '
_httpClient( 3
.3 4
PutAsync4 <
(< =
$"= ?
avatar/? F
{F G
modelG L
.L M
IdDoPretendenteM \
}\ ]
"] ^
,^ _
content` g
)g h
)h i
{ 
if 
( 
response 
. 

StatusCode '
==( *
HttpStatusCode+ 9
.9 :
NotFound: B
)B C
return 
null 
;  
return   
await   
response   %
.  % &
Content  & -
.  - .
ReadAsAsync  . 9
<  9 :
RequestResult  : G
>  G H
(  H I
)  I J
;  J K
}!! 
}"" 	
private$$ $
MultipartFormDataContent$$ (
CriarContent$$) 5
($$5 6
	IFormFile$$6 ?
arquivo$$@ G
)$$G H
{%% 	
var&& 
bytes&& 
=&& 
new&& 
ByteArrayContent&& ,
(&&, -
AlterarAvatarModel&&- ?
.&&? @
ArquivoToByte&&@ M
(&&M N
arquivo&&N U
)&&U V
)&&V W
;&&W X
var'' 
content'' 
='' 
new'' $
MultipartFormDataContent'' 6
(''6 7
)''7 8
;''8 9
content(( 
.(( 
Headers(( 
.(( 
ContentType(( '
.((' (
	MediaType((( 1
=((2 3
$str((4 I
;((I J
content)) 
.)) 
Add)) 
()) 
bytes)) 
,)) 
$str)) (
,))( )
arquivo))* 1
.))1 2
FileName))2 :
))): ;
;)); <
return** 
content** 
;** 
},, 	
public.. 
async.. 
Task.. 
<.. 
byte.. 
[.. 
]..  
>..  !

ObterAsync.." ,
(.., -
Guid..- 1
pretendenteId..2 ?
)..? @
{// 	
using00 
(00 
var00 
response00 
=00  !
await00" '
_httpClient00( 3
.003 4
GetAsync004 <
(00< =
$"00= ?
avatar/00? F
{00F G
pretendenteId00G T
}00T U
"00U V
)00V W
)00W X
{11 
response22 
.22 #
EnsureSuccessStatusCode22 0
(220 1
)221 2
;222 3
return33 
await33 
response33 %
.33% &
Content33& -
.33- . 
ReadAsByteArrayAsync33. B
(33B C
)33C D
;33D E
}44 
}55 	
}66 
}77 ≤
Ü/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Services/IAvatarServico.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Services &
{ 
public 

	interface 
IAvatarServico #
{ 
Task		 
<		 
RequestResult		 
>		 
AlterarAsync		 (
(		( )
AlterarAvatarModel		) ;
model		< A
)		A B
;		B C
Task

 
<

 
byte

 
[

 
]

 
>

 

ObterAsync

 
(

  
Guid

  $
pretendenteId

% 2
)

2 3
;

3 4
} 
} ≤

ã/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Services/IPretendenteServico.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Services &
{ 
public 

	interface 
IPretendenteServico (
{		 
Task

 
<

 !
PretendenteListaModel

 "
>

" #
ListarAsync

$ /
(

/ 0
)

0 1
;

1 2
Task 
< 
PretendenteModel 
> 

ObterAsync )
() *
Guid* .
id/ 1
)1 2
;2 3
Task 
< 
RequestResult 
> 
AdicionarAsync *
(* +
AdicionarModel+ 9
model: ?
)? @
;@ A
Task 
< 
RequestResult 
> 
AtualizarAsync *
(* +
EditarModel+ 6
model7 <
)< =
;= >
Task 
< 
RequestResult 
> 
RemoverAsync (
(( )
RemoverModel) 5
id6 8
)8 9
;9 :
} 
} õ

Ñ/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Services/IVotoServico.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
. 
Services &
{ 
public 

	interface 
IVotoServico !
{		 
Task

 
<

 $
ListaVencedorDiarioModel

 %
>

% &%
ListarVencedorDiarioAsync

' @
(

@ A
)

A B
;

B C
Task 
< %
ListaVencedorSemanalModel &
>& '&
ListarVencedorSemanalAsync( B
(B C
)C D
;D E
Task 
< 
RequestResult 
> 

VotarAsync &
(& '
Guid' +
pretendenteId, 9
)9 :
;: ;
Task 
< 
PeriodoVotacaoModel  
>  !
ObterPeriodoVotacao" 5
(5 6
)6 7
;7 8
Task 
< 
IEnumerable 
< 
EleicaoDoDiaModel *
>* +
>+ ,
ObterEleicaoDoDia- >
(> ?
)? @
;@ A
} 
} ı4
ä/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Services/PretendenteServico.cs
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
 
Site

 
.

 
Services

 &
{ 
public 

class 
PretendenteServico #
:$ %
IPretendenteServico& 9
{ 
private 
readonly 

HttpClient #
_httpClient$ /
;/ 0
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
PretendenteServico !
(! "
IHttpClientFactory" 4
httpClientFactory5 F
,F G
IConfigurationH V
configurationW d
)d e
{ 	
_configuration 
= 
configuration *
;* +
_httpClient 
= 
httpClientFactory +
.+ ,
CreateClient, 8
(8 9
)9 :
;: ;
_httpClient 
. 
BaseAddress #
=$ %
new& )
Uri* -
(- .
_configuration. <
[< =
$str= E
]E F
)F G
;G H
} 	
public 
async 
Task 
< 
RequestResult '
>' (
AdicionarAsync) 7
(7 8
AdicionarModel8 F
modelG L
)L M
{ 	
using 
( 
var 
response 
=  !
await" '
_httpClient( 3
.3 4
PostAsJsonAsync4 C
(C D
$strD Q
,Q R
modelS X
)X Y
)Y Z
{ 
if 
( 
response 
. 

StatusCode '
==( *
HttpStatusCode+ 9
.9 :
NotFound: B
)B C
return 
null 
;  
return 
await 
response %
.% &
Content& -
.- .
ReadAsAsync. 9
<9 :
RequestResult: G
>G H
(H I
)I J
;J K
} 
}   	
public"" 
async"" 
Task"" 
<"" 
RequestResult"" '
>""' (
AtualizarAsync"") 7
(""7 8
EditarModel""8 C
model""D I
)""I J
{## 	
using$$ 
($$ 
var$$ 
response$$ 
=$$  !
await$$" '
_httpClient$$( 3
.$$3 4
PutAsJsonAsync$$4 B
($$B C
$"$$C E
pretendente/$$E Q
{$$Q R
model$$R W
.$$W X
Id$$X Z
}$$Z [
"$$[ \
,$$\ ]
model$$^ c
)$$c d
)$$d e
{%% 
return&& 
await&& 
response&& %
.&&% &
Content&&& -
.&&- .
ReadAsAsync&&. 9
<&&9 :
RequestResult&&: G
>&&G H
(&&H I
)&&I J
;&&J K
}'' 
}(( 	
public** 
async** 
Task** 
<** !
PretendenteListaModel** /
>**/ 0
ListarAsync**1 <
(**< =
)**= >
{++ 	
using,, 
(,, 
var,, 
response,, 
=,,  !
await,," '
_httpClient,,( 3
.,,3 4
GetAsync,,4 <
(,,< =
$str,,= J
),,J K
),,K L
{-- 
if.. 
(.. 
response.. 
... 

StatusCode.. '
==..( *
HttpStatusCode..+ 9
...9 :
NotFound..: B
)..B C
return// 
new// !
PretendenteListaModel// 4
(//4 5
null//5 9
)//9 :
;//: ;
response11 
.11 #
EnsureSuccessStatusCode11 0
(110 1
)111 2
;112 3
var22 
result22 
=22 
await22 "
response22# +
.22+ ,
Content22, 3
.223 4
ReadAsAsync224 ?
<22? @
IEnumerable22@ K
<22K L
PretendenteModel22L \
>22\ ]
>22] ^
(22^ _
)22_ `
;22` a
return33 
new33 !
PretendenteListaModel33 0
(330 1
result331 7
)337 8
;338 9
}44 
}55 	
public77 
async77 
Task77 
<77 
PretendenteModel77 *
>77* +

ObterAsync77, 6
(776 7
Guid777 ;
id77< >
)77> ?
{88 	
using99 
(99 
var99 
response99 
=99  !
await99" '
_httpClient99( 3
.993 4
GetAsync994 <
(99< =
$"99= ?
pretendente/99? K
{99K L
id99L N
}99N O
"99O P
)99P Q
)99Q R
{:: 
if;; 
(;; 
response;; 
.;; 

StatusCode;; '
==;;( *
HttpStatusCode;;+ 9
.;;9 :
NotFound;;: B
);;B C
return<< 
null<< 
;<<  
response>> 
.>> #
EnsureSuccessStatusCode>> 0
(>>0 1
)>>1 2
;>>2 3
return?? 
await?? 
response?? %
.??% &
Content??& -
.??- .
ReadAsAsync??. 9
<??9 :
PretendenteModel??: J
>??J K
(??K L
)??L M
;??M N
}@@ 
}AA 	
publicCC 
asyncCC 
TaskCC 
<CC 
RequestResultCC '
>CC' (
RemoverAsyncCC) 5
(CC5 6
RemoverModelCC6 B
modelCCC H
)CCH I
{DD 	
usingEE 
(EE 
varEE 
responseEE 
=EE  !
awaitEE" '
_httpClientEE( 3
.EE3 4
DeleteAsyncEE4 ?
(EE? @
$"EE@ B
pretendente/EEB N
{EEN O
modelEEO T
.EET U
IdEEU W
}EEW X
"EEX Y
)EEY Z
)EEZ [
{FF 
returnGG 
awaitGG 
responseGG %
.GG% &
ContentGG& -
.GG- .
ReadAsAsyncGG. 9
<GG9 :
RequestResultGG: G
>GGG H
(GGH I
)GGI J
;GGJ K
}HH 
}II 	
}JJ 
}KK Ä6
É/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Services/VotoServico.cs
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
 
Site

 
.

 
Services

 &
{ 
public 

class 
VotoServico 
: 
IVotoServico +
{ 
private 
readonly 

HttpClient #
_httpClient$ /
;/ 0
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
VotoServico 
( 
IHttpClientFactory -
httpClientFactory. ?
,? @
IConfigurationA O
configurationP ]
)] ^
{ 	
_configuration 
= 
configuration *
;* +
_httpClient 
= 
httpClientFactory +
.+ ,
CreateClient, 8
(8 9
)9 :
;: ;
_httpClient 
. 
BaseAddress #
=$ %
new& )
Uri* -
(- .
_configuration. <
[< =
$str= E
]E F
)F G
;G H
} 	
public 
async 
Task 
< $
ListaVencedorDiarioModel 2
>2 3%
ListarVencedorDiarioAsync4 M
(M N
)N O
{ 	
using 
( 
var 
response 
=  !
await" '
_httpClient( 3
.3 4
GetAsync4 <
(< =
$str= R
)R S
)S T
{ 
if 
( 
response 
. 

StatusCode '
==( *
HttpStatusCode+ 9
.9 :
OK: <
)< =
{ 
var 
result 
=  
await! &
response' /
./ 0
Content0 7
.7 8
ReadAsAsync8 C
<C D$
ListaVencedorDiarioModelD \
>\ ]
(] ^
)^ _
;_ `
return 
result !
;! "
} 
return   
null   
;   
}!! 
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ %
ListaVencedorSemanalModel$$ 3
>$$3 4&
ListarVencedorSemanalAsync$$5 O
($$O P
)$$P Q
{%% 	
using&& 
(&& 
var&& 
response&& 
=&&  !
await&&" '
_httpClient&&( 3
.&&3 4
GetAsync&&4 <
(&&< =
$str&&= R
)&&R S
)&&S T
{'' 
if(( 
((( 
response(( 
.(( 

StatusCode(( '
==((( *
HttpStatusCode((+ 9
.((9 :
OK((: <
)((< =
{)) 
var** 
result** 
=**  
await**! &
response**' /
.**/ 0
Content**0 7
.**7 8
ReadAsAsync**8 C
<**C D%
ListaVencedorSemanalModel**D ]
>**] ^
(**^ _
)**_ `
;**` a
return++ 
result++ !
;++! "
},, 
return-- 
null-- 
;-- 
}.. 
}// 	
public11 
async11 
Task11 
<11 
IEnumerable11 %
<11% &
EleicaoDoDiaModel11& 7
>117 8
>118 9
ObterEleicaoDoDia11: K
(11K L
)11L M
{22 	
using33 
(33 
var33 
response33  
=33! "
await33# (
_httpClient33) 4
.334 5
GetAsync335 =
(33= >
$str33> S
)33S T
)33T U
{44 
if55 
(55 
response55 
.55 

StatusCode55 '
==55( *
HttpStatusCode55+ 9
.559 :
OK55: <
)55< =
{66 
var77 
result77 
=77  
await77! &
response77' /
.77/ 0
Content770 7
.777 8
ReadAsAsync778 C
<77C D
IEnumerable77D O
<77O P
EleicaoDoDiaModel77P a
>77a b
>77b c
(77c d
)77d e
;77e f
return88 
result88 !
;88! "
}99 
return:: 
null:: 
;:: 
};; 
}<< 	
public>> 
async>> 
Task>> 
<>> 
PeriodoVotacaoModel>> -
>>>- .
ObterPeriodoVotacao>>/ B
(>>B C
)>>C D
{?? 	
using@@ 
(@@ 
var@@ 
response@@ 
=@@  !
await@@" '
_httpClient@@( 3
.@@3 4
GetAsync@@4 <
(@@< =
$str@@= Y
)@@Y Z
)@@Z [
{AA 
ifBB 
(BB 
responseBB 
.BB 

StatusCodeBB '
==BB( *
HttpStatusCodeBB+ 9
.BB9 :
OKBB: <
)BB< =
{CC 
varDD 
resultDD 
=DD  
awaitDD! &
responseDD' /
.DD/ 0
ContentDD0 7
.DD7 8
ReadAsAsyncDD8 C
<DDC D
PeriodoVotacaoModelDDD W
>DDW X
(DDX Y
)DDY Z
;DDZ [
returnEE 
resultEE !
;EE! "
}FF 
returnGG 
nullGG 
;GG 
}HH 
}II 	
publicKK 
asyncKK 
TaskKK 
<KK 
RequestResultKK '
>KK' (

VotarAsyncKK) 3
(KK3 4
GuidKK4 8
pretendenteIdKK9 F
)KKF G
{LL 	
usingMM 
(MM 
varMM 
responseMM 
=MM  !
awaitMM" '
_httpClientMM( 3
.MM3 4
PutAsyncMM4 <
(MM< =
$"MM= ?
voto/MM? D
{MMD E
pretendenteIdMME R
}MMR S
"MMS T
,MMT U
nullMMV Z
)MMZ [
)MM[ \
{NN 
ifOO 
(OO 
responseOO 
.OO 

StatusCodeOO '
==OO( *
HttpStatusCodeOO+ 9
.OO9 :
NotFoundOO: B
)OOB C
returnPP 
nullPP 
;PP  
returnQQ 
awaitQQ 
responseQQ %
.QQ% &
ContentQQ& -
.QQ- .
ReadAsAsyncQQ. 9
<QQ9 :
RequestResultQQ: G
>QQG H
(QQH I
)QQI J
;QQJ K
}RR 
}SS 	
}TT 
}UU ∞
v/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/client/GL.ReiDoAlmoco.Site/Startup.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Site 
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
. #
AddControllersWithViews ,
(, -
)- .
;. /
services 
. 
	AddScoped 
< 
IPretendenteServico 2
,2 3
PretendenteServico4 F
>F G
(G H
)H I
;I J
services 
. 
	AddScoped 
< 
IAvatarServico -
,- .
AvatarServico/ <
>< =
(= >
)> ?
;? @
services 
. 
	AddScoped 
< 
IVotoServico +
,+ ,
VotoServico- 8
>8 9
(9 :
): ;
;; <
services 
. 
AddHttpClient "
(" #
)# $
;$ %
}   	
public## 
void## 
	Configure## 
(## 
IApplicationBuilder## 1
app##2 5
,##5 6
IWebHostEnvironment##7 J
env##K N
)##N O
{$$ 	
if%% 
(%% 
env%% 
.%% 
IsDevelopment%% !
(%%! "
)%%" #
)%%# $
{&& 
app'' 
.'' %
UseDeveloperExceptionPage'' -
(''- .
)''. /
;''/ 0
}(( 
else)) 
{** 
app++ 
.++ 
UseExceptionHandler++ '
(++' (
$str++( 5
)++5 6
;++6 7
app-- 
.-- 
UseHsts-- 
(-- 
)-- 
;-- 
}.. 
app// 
.// 
UseHttpsRedirection// #
(//# $
)//$ %
;//% &
app00 
.00 
UseStaticFiles00 
(00 
)00  
;00  !
app22 
.22 

UseRouting22 
(22 
)22 
;22 
app44 
.44 
UseAuthorization44  
(44  !
)44! "
;44" #
app66 
.66 
UseEndpoints66 
(66 
	endpoints66 &
=>66' )
{77 
	endpoints88 
.88 
MapControllerRoute88 ,
(88, -
name99 
:99 
$str99 #
,99# $
pattern:: 
::: 
$str:: E
)::E F
;::F G
};; 
);; 
;;; 
}<< 	
}== 
}>> 