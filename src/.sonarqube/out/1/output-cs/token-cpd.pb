ø	
é/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Commands/Base/CommandResult.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Commands  (
.( )
Base) -
{ 
public 

class 
CommandResult 
{ 
public 
CommandResult 
( 
bool !
sucesso" )
,) *
string+ 1
mensagem2 :
): ;
{ 	
this 
. 
Sucesso 
= 
sucesso "
;" #
this 
. 
Mensagem 
= 
mensagem $
;$ %
}		 	
public

 
bool

 
Sucesso

 
{

 
get

 !
;

! "
private

# *
set

+ .
;

. /
}

0 1
public 
string 
Mensagem 
{  
get! $
;$ %
private& -
set. 1
;1 2
}3 4
} 
} ô
â/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Commands/Base/ICommand.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Commands  (
.( )
Base) -
{ 
public 

	interface 
ICommand 
: 
IRequest  (
<( )
RequestResult) 6
>6 7
{ 
} 
}		 ∞
ü/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Commands/Pretendente/CriarPretendenteCommand.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Commands  (
.( )
Pretendente) 4
{ 
public 

class #
CriarPretendenteCommand (
:) *
ICommand+ 3
{ 
public #
CriarPretendenteCommand &
(& '
)' (
{ 	
}		 	
public

 #
CriarPretendenteCommand

 &
(

& '
string

' -
nome

. 2
,

2 3
string

4 :
email

; @
)

@ A
{ 	
Nome 
= 
nome 
; 
Email 
= 
email 
; 
} 	
[ 	
Required	 
( 
ErrorMessage 
=  
$str! E
)E F
]F G
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
( 
ErrorMessage 
=  
$str! G
)G H
]H I
[ 	
EmailAddress	 
( 
ErrorMessage "
=# $
$str% 7
)7 8
]8 9
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
} Ü
†/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Commands/Pretendente/EditarPretendenteCommand.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Commands  (
.( )
Pretendente) 4
{ 
public 

class $
EditarPretendenteCommand )
:* +
ICommand, 4
{ 
public $
EditarPretendenteCommand '
(' (
)( )
{		 	
} 	
public $
EditarPretendenteCommand '
(' (
Guid( ,
id- /
,/ 0
string1 7
nome8 <
)< =
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
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
[ 	
Required	 
( 
ErrorMessage 
=  
$str! E
)E F
]F G
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
} 
} å
°/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Commands/Pretendente/RemoverPretendenteCommand.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Commands  (
.( )
Pretendente) 4
{ 
public 

class %
RemoverPretendenteCommand *
:+ ,
ICommand- 5
{ 
public %
RemoverPretendenteCommand (
(( )
Guid) -
id. 0
)0 1
{		 	
Id

 
=

 
id

 
;

 
} 	
public 
Guid 
Id 
{ 
get 
; 
private %
set& )
;) *
}+ ,
} 
} Ú<
â/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Entities/AvatarArquivo.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Entities  (
{		 
public

 

class

 
AvatarArquivo

 
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
AvatarArquivo 
( 
string #
	diretorio$ -
,- .
IConfiguration/ =
configuration> K
)K L
{ 	
_configuration 
= 
configuration *
;* +
	Diretorio 
= 
Path 
. 
Combine $
($ %
Path% )
.) *
Combine* 1
(1 2
	Directory2 ;
.; <
GetCurrentDirectory< O
(O P
)P Q
,Q R
$strS ]
,] ^
	diretorio_ h
)h i
)i j
;j k
} 	
public 
AvatarArquivo 
( 
string #
	diretorio$ -
,- .
	IFormFile/ 8
arquivo9 @
,@ A
IConfigurationB P
configurationQ ^
)^ _
: 
this 
( 
	diretorio 
, 
configuration +
)+ ,
{ 	
Arquivo 
= 
arquivo 
; 
} 	
public 
string 
	Diretorio 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 
	IFormFile 
Arquivo  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
public 
string 
Nome 
{ 
get  
{  !
return" (
$str) 6
;6 7
}8 9
}: ;
public 
string 
DiretorioNoProfile (
{) *
get+ .
{/ 0
return1 7
Path8 <
.< =
Combine= D
(D E
	DirectoryE N
.N O
GetCurrentDirectoryO b
(b c
)c d
,d e
$strf 
)	 Ä
;
Ä Å
}
Ç É
}
Ñ Ö
public 
async 
Task 
< 
bool 
> 
CopiarAvatarAsync  1
(1 2
)2 3
{ 	
CriarDiretorio   
(   
)   
;   
var!! 
path!! 
=!! 
$"!! 
{!! 
	Diretorio!! #
}!!# $
/!!$ %
{!!% &
Nome!!& *
}!!* +
"!!+ ,
;!!, -
using"" 
("" 
var"" 
bits"" 
="" 
new"" !

FileStream""" ,
("", -
path""- 1
,""1 2
FileMode""3 ;
.""; <
Create""< B
)""B C
)""C D
{## 
await$$ 
Arquivo$$ 
.$$ 
CopyToAsync$$ )
($$) *
bits$$* .
)$$. /
;$$/ 0
return%% 
	Directory%%  
.%%  !
Exists%%! '
(%%' (
	Diretorio%%( 1
)%%1 2
;%%2 3
}&& 
}'' 	
public(( 
byte(( 
[(( 
](( 
ObterAvatar(( !
(((! "
)((" #
{)) 	
var** 
path** 
=** 
Path** 
.** 
Combine** #
(**# $
	Diretorio**$ -
,**- .
Nome**/ 3
)**3 4
;**4 5
if,, 
(,, 
!,, 
	Directory,, 
.,, 
Exists,, !
(,,! "
	Diretorio,," +
),,+ ,
),,, -
path-- 
=-- 
DiretorioNoProfile-- )
;--) *
byte// 
[// 
]// 
data// 
;// 
using00 
(00 
StreamReader00 
sr00  "
=00# $
new00% (
StreamReader00) 5
(005 6
path006 :
)00: ;
)00; <
{11 
using22 
(22 
MemoryStream22 #
ms22$ &
=22' (
new22) ,
MemoryStream22- 9
(229 :
)22: ;
)22; <
{33 
sr44 
.44 

BaseStream44 !
.44! "
CopyTo44" (
(44( )
ms44) +
)44+ ,
;44, -
data55 
=55 
ms55 
.55 
ToArray55 %
(55% &
)55& '
;55' (
}66 
}77 
return88 
data88 
;88 
}99 	
public:: 
bool:: 
RemoverAvatar:: !
(::! "
)::" #
{;; 	
if<< 
(<< 
	Directory<< 
.<< 
Exists<<  
(<<  !
	Diretorio<<! *
)<<* +
)<<+ ,
	Directory== 
.== 
Delete==  
(==  !
	Diretorio==! *
,==* +
true==, 0
)==0 1
;==1 2
return?? 
!?? 
	Directory?? 
.?? 
Exists?? $
(??$ %
	Diretorio??% .
)??. /
;??/ 0
}@@ 	
privateAA 
boolAA 
CriarDiretorioAA #
(AA# $
)AA$ %
{BB 	
RemoverAvatarCC 
(CC 
)CC 
;CC 
ifDD 
(DD 
!DD 
	DirectoryDD 
.DD 
ExistsDD !
(DD! "
	DiretorioDD" +
)DD+ ,
)DD, -
	DirectoryEE 
.EE 
CreateDirectoryEE )
(EE) *
	DiretorioEE* 3
)EE3 4
;EE4 5
returnFF 
	DirectoryFF 
.FF 
ExistsFF #
(FF# $
	DiretorioFF$ -
)FF- .
;FF. /
}GG 	
}HH 
publicJJ 

classJJ "
AvatarArquivoValidatorJJ '
:JJ( )
AbstractValidatorJJ* ;
<JJ; <
AvatarArquivoJJ< I
>JJI J
{KK 
publicLL "
AvatarArquivoValidatorLL %
(LL% &
)LL& '
{MM 	
RuleForNN 
(NN 
pNN 
=>NN 
pNN 
.NN 
	DiretorioNN $
)NN$ %
.OO 
NotNullOO 
(OO 
)OO 
.PP 
NotEmptyPP 
(PP 
)PP 
.QQ 
WithMessageQQ 
(QQ 
$strQQ ?
)QQ? @
;QQ@ A
RuleForSS 
(SS 
pSS 
=>SS 
pSS 
.SS 
NomeSS 
)SS  
.TT 
NotNullTT 
(TT 
)TT 
.UU 
NotEmptyUU 
(UU 
)UU 
.VV 
WithMessageVV 
(VV 
$strVV :
)VV: ;
;VV; <
RuleForXX 
(XX 
pXX 
=>XX 
pXX 
.XX 
ArquivoXX "
)XX" #
.YY 
NotNullYY 
(YY 
)YY 
.ZZ 
WithMessageZZ 
(ZZ 
$strZZ 7
)ZZ7 8
;ZZ8 9
}[[ 	
}\\ 
}]] Ö/
ä/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Entities/PeriodoVotacao.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Entities  (
{ 
public 

class 
PeriodoVotacao 
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
PeriodoVotacao 
( 
IConfiguration ,
configuration- :
): ;
{		 	
_configuration

 
=

 
configuration

 *
;

* +
} 	
public 
DateTime 
InicioVotacao %
{& '
get( +
{, -
return. 4
ObterValorData5 C
(C D
trueD H
)H I
;I J
}K L
}M N
public 
DateTime 

FimVotacao "
{# $
get% (
{) *
return+ 1
ObterValorData2 @
(@ A
falseA F
)F G
;G H
}I J
}K L
public 
bool 
VotacaoAberta !
{ 	
get 
{ 
if 
( 
DateTime 
. 
UtcNow #
>=$ &
InicioVotacao' 4
&&5 7
DateTime  
.  !
UtcNow! '
<=( *

FimVotacao+ 5
)5 6
return 
true 
;  
return 
false 
; 
} 
} 	
public 
bool 
VotacaoEncerrada $
{ 	
get 
{ 
if 
( 
DateTime 
. 
UtcNow #
<=$ &
InicioVotacao' 4
||5 7
DateTime  
.  !
UtcNow! '
>=( *

FimVotacao+ 5
)5 6
return 
true 
;  
return 
false 
; 
}   
}!! 	
public"" 
string"" 
Mensagem"" 
{## 	
get$$ 
{%% 
return&& 
VotacaoEncerrada&& '
?&&( )
$"'' J
>As vota√ß√µes foram encerradas. Novas elei√ß√µes a partir das '' P
{''P Q
InicioVotacao''Q ^
.''^ _
ToString''_ g
(''g h
$str''h o
)''o p
}''p q
 ao ''q u
{''u v

FimVotacao	''v Ä
.
''Ä Å
ToString
''Å â
(
''â ä
$str
''ä ë
)
''ë í
}
''í ì
.
''ì î
"
''î ï
:
''ñ ó
$str(( B
;((B C
})) 
}** 	
public,, 
DateTime,, 
ObterValorData,, &
(,,& '
bool,,' +

dataInicio,,, 6
),,6 7
{-- 	
var.. 
hoje.. 
=.. 
DateTime.. 
...  
Today..  %
;..% &
try// 
{00 
var11 
config11 
=11 

dataInicio11 '
?11( )
_configuration22 *
.22* +

GetSection22+ 5
(225 6
$str226 O
)22O P
.22P Q
Value22Q V
:22W X
_configuration33 *
.33* +

GetSection33+ 5
(335 6
$str336 L
)33L M
.33M N
Value33N S
;33S T
var55 
valores55 
=55 
config55 $
.55$ %
Split55% *
(55* +
$char55+ .
)55. /
;55/ 0
int66 
hora66 
=66 
int66 
.66 
Parse66 $
(66$ %
valores66% ,
.66, -
GetValue66- 5
(665 6
$num666 7
)667 8
.668 9
ToString669 A
(66A B
)66B C
)66C D
;66D E
int77 
minuto77 
=77 
int77  
.77  !
Parse77! &
(77& '
valores77' .
.77. /
GetValue77/ 7
(777 8
$num778 9
)779 :
.77: ;
ToString77; C
(77C D
)77D E
)77E F
;77F G
return88 
new88 
DateTime88 #
(88# $
hoje88$ (
.88( )
Year88) -
,88- .
hoje88/ 3
.883 4
Month884 9
,889 :
hoje88; ?
.88? @
Day88@ C
,88C D
hora88E I
,88I J
minuto88K Q
,88Q R
$num88S T
)88T U
;88U V
}99 
catch:: 
(:: 
	Exception:: 
ex:: 
)::  
{;; 
Console<< 
.<< 
	WriteLine<< !
(<<! "
ex<<" $
.<<$ %
Message<<% ,
)<<, -
;<<- .
return== 

dataInicio== !
?==" #
new>> 
DateTime>>  (
(>>( )
hoje>>) -
.>>- .
Year>>. 2
,>>2 3
hoje>>4 8
.>>8 9
Month>>9 >
,>>> ?
hoje>>@ D
.>>D E
Day>>E H
,>>H I
$num>>J L
,>>L M
$num>>N P
,>>P Q
$num>>R S
)>>S T
:>>U V
new?? 
DateTime??  (
(??( )
hoje??) -
.??- .
Year??. 2
,??2 3
hoje??4 8
.??8 9
Month??9 >
,??> ?
hoje??@ D
.??D E
Day??E H
,??H I
$num??J L
,??L M
$num??N P
,??P Q
$num??R S
)??S T
;??T U
}@@ 
}AA 	
}BB 
}CC ò%
á/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Entities/Pretendente.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Entities  (
{ 
public		 

class		 
Pretendente		 
{

 
public 
Pretendente 
( 
string !
nome" &
,& '
string( .
email/ 4
)4 5
{ 	
Id 
= 
Guid 
. 
NewGuid 
( 
) 
;  
Nome 
= 
nome 
; 
Email 
= 
email 
; 
} 	
public 
Guid 
Id 
{ 
get 
; 
private %
set& )
;) *
}+ ,
public 
string 
Nome 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
string 
Email 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
virtual 
ICollection "
<" #
Voto# '
>' (
Votos) .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
void 
AtualizarNome !
(! "
string" (
nome) -
)- .
{ 	
Nome 
= 
nome 
; 
} 	
} 
public 

class  
PretendenteValidator %
:& '
AbstractValidator( 9
<9 :
Pretendente: E
>E F
{ 
private 
readonly #
IPretendenteRepositorio 0
_repositorio1 =
;= >
public  
PretendenteValidator #
(# $#
IPretendenteRepositorio$ ;
repositorio< G
)G H
{   	
_repositorio!! 
=!! 
repositorio!! &
;!!& '
RuleFor## 
(## 
p## 
=>## 
p## 
.## 
Nome## 
)##  
.$$ 
NotEmpty$$ 
($$ 
)$$ 
.%% 
NotNull%% 
(%% 
)%% 
.&& 
WithMessage&&  
(&&  !
$str&&! E
)&&E F
;&&F G
RuleFor(( 
((( 
p(( 
=>(( 
p(( 
.(( 
Email((  
)((  !
.)) 
NotEmpty)) 
()) 
))) 
.** 
NotNull** 
(** 
)** 
.++ 
WithMessage++  
(++  !
$str++! M
)++M N
.,, 
EmailAddress,, 
(,, 
),, 
.-- 
WithMessage--  
(--  !
$str--! J
)--J K
;--K L
RuleFor// 
(// 
p// 
=>// 
new// 
{// 
p//  
.//  !
Id//! #
,//# $
p//% &
.//& '
Email//' ,
}//- .
)//. /
./// 0
Must//0 4
(//4 5
c//5 6
=>//7 9
EmailDisponivel//: I
(//I J
c//J K
.//K L
Id//L N
,//N O
c//P Q
.//Q R
Email//R W
)//W X
.//X Y
Result//Y _
)//_ `
.00 
WithMessage00 
(00 
$str00 ?
)00? @
;00@ A
}11 	
public22 
async22 
Task22 
<22 
bool22 
>22 
EmailDisponivel22  /
(22/ 0
Guid220 4
id225 7
,227 8
string229 ?
email22@ E
)22E F
{33 	
var44 
pretendente44 
=44 
await44 #
_repositorio44$ 0
.440 1
ObterPorEmailAsync441 C
(44C D
email44D I
)44I J
;44J K
if55 
(55 
pretendente55 
==55 
null55 "
)55" #
return55$ *
true55+ /
;55/ 0
return66 
(66 
pretendente66 
.66  
Id66  "
==66# %
id66& (
)66( )
;66) *
}77 	
}88 
}99 ∞
Ä/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Entities/Voto.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Entities  (
{ 
public 

class 
Voto 
{ 
public 
Voto 
( 
) 
{ 	
Id		 
=		 
Guid		 
.		 
NewGuid		 
(		 
)		 
;		  
Data

 
=

 
DateTime

 
.

 
UtcNow

 "
;

" #
} 	
public 
Voto 
( 
Guid 
pretendenteId &
)& '
: 
this 
( 
) 
{ 	
PretendenteId 
= 
pretendenteId )
;) *

Quantidade 
= 
$num 
; 
} 	
public 
Guid 
Id 
{ 
get 
; 
private %
set& )
;) *
}+ ,
public 
DateTime 
Data 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
int 

Quantidade 
{ 
get  #
;# $
private% ,
set- 0
;0 1
}2 3
public 
Guid 
PretendenteId !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
Pretendente 
Pretendente &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
void 
Computar 
( 
) 
{ 	

Quantidade 
++ 
; 
} 	
} 
public 

class 
VotoValidator 
:  
AbstractValidator! 2
<2 3
Voto3 7
>7 8
{ 
public   
VotoValidator   
(   
)   
{!! 	
RuleFor"" 
("" 
p"" 
=>"" 
p"" 
."" 
Data"" 
)""  
.##  
GreaterThanOrEqualTo## %
(##% &
DateTime##& .
.##. /
UtcNow##/ 5
)##5 6
.$$ 
WithMessage$$ 
($$ 
$str$$ T
)$$T U
;$$U V
RuleFor&& 
(&& 
p&& 
=>&& 
p&& 
.&& 

Quantidade&& %
)&&% &
.'' 
GreaterThan'' 
('' 
$num'' 
)'' 
.(( 
WithMessage(( 
((( 
$str(( ?
)((? @
;((@ A
})) 	
}** 
}++ Ÿ
Ö/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Events/Base/IEvent.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Events  &
.& '
Base' +
{ 
public 

class 
IEvent 
: 
INotification '
{ 
} 
} ±	
ú/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Events/Pretendente/PretendenteCriadoEvent.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Events  &
.& '
Pretendente' 2
{ 
public 

class "
PretendenteCriadoEvent '
:( )
IEvent* 0
{ 
public "
PretendenteCriadoEvent %
(% &
string& ,
nome- 1
,1 2
string3 9
email: ?
)? @
{ 	
Nome		 
=		 
nome		 
;		 
Email

 
=

 
email

 
;

 
} 	
public 
string 
Nome 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
string 
Email 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
} 
} á	
ù/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Events/Pretendente/PretendenteEditadoEvent.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Events  &
.& '
Pretendente' 2
{ 
public 

class #
PretendenteEditadoEvent (
:) *
IEvent+ 1
{ 
public #
PretendenteEditadoEvent &
(& '
Guid' +
id, .
,. /
string0 6
nome7 ;
); <
{ 	
this		 
.		 
Nome		 
=		 
nome		 
;		 
}

 	
public 
Guid 
Id 
{ 
get 
; 
private %
set& )
;) *
}+ ,
public 
string 
Nome 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
} 
} §
û/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Events/Pretendente/PretendenteRemovidoEvent.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Events  &
.& '
Pretendente' 2
{ 
public 

class $
PretendenteRemovidoEvent )
:* +
IEvent, 2
{ 
public $
PretendenteRemovidoEvent '
(' (
Guid( ,
id- /
)/ 0
{ 	
this		 
.		 
Id		 
=		 
id		 
;		 
}

 	
public 
Guid 
Id 
{ 
get 
; 
private %
set& )
;) *
}+ ,
} 
} »
å/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Interfaces/IAvatarServico.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  

Interfaces  *
{ 
public 

	interface 
IAvatarServico #
{		 
Task

 
<

 
RequestResult

 
>

 
AdicionarAsync

 *
(

* +
Guid

+ /
pretendenteId

0 =
,

= >
	IFormFile

? H
arquivo

I P
)

P Q
;

Q R
byte 
[ 
] 
Obter 
( 
Guid 
pretendenteId '
)' (
;( )
RequestResult 
Remover 
( 
Guid "
pretendenteId# 0
)0 1
;1 2
} 
} ˇ

ï/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Interfaces/IPretendenteRepositorio.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  

Interfaces  *
{ 
public 

	interface #
IPretendenteRepositorio ,
{		 
Task

	 
<

 
IEnumerable

 
<

 
Pretendente

 %
>

% &
>

& '
ListarAsync

( 3
(

3 4
)

4 5
;

5 6
Task	 
< 
Pretendente 
> 

ObterAsync %
(% &
Guid& *
id+ -
)- .
;. /
Task	 
< 
Pretendente 
> 
ObterPorEmailAsync -
(- .
string. 4
email5 :
): ;
;; <
Task	 
AdicionarAsync 
( 
Pretendente (
pretendente) 4
)4 5
;5 6
Task	 
AtualizarAsync 
( 
Pretendente (
pretendente) 4
)4 5
;5 6
Task	 
RemoverAsync 
( 
Guid 
id  "
)" #
;# $
} 
} ﬁ	
é/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Interfaces/IVotoRepositorio.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  

Interfaces  *
{ 
public 

	interface 
IVotoRepositorio %
{ 
Task		 
<		 
IEnumerable		 
<		 
Voto		 
>		 
>		 
ListarAsync		  +
(		+ ,
)		, -
;		- .
Task

 
<

 
Voto

 
>

 

ObterDoDia

 
(

 
Guid

 "
pretendenteId

# 0
)

0 1
;

1 2
Task 
< 
IEnumerable 
< 
Voto 
> 
> 
ListarDoDiaAsync  0
(0 1
)1 2
;2 3
Task 
AdicionarAsync 
( 
Voto  
voto! %
)% &
;& '
Task 
AtualizarAsync 
( 
Voto  
voto! %
)% &
;& '
} 
} ‰	
ä/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Interfaces/IVotoServico.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  

Interfaces  *
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
 
RequestResult

 
>

 
ComputarAsync

 )
(

) *
Voto

* .
voto

/ 3
)

3 4
;

4 5
Task 
< !
ListaDoVencedorDiario "
>" #%
ListarVencedorPorDiaAsync$ =
(= >
)> ?
;? @
Task 
< "
ListaDoVencedorSemanal #
># $&
ListarVencedorSemanalAsync% ?
(? @
)@ A
;A B
PeriodoVotacao 
ObterPeriodoVotacao *
(* +
)+ ,
;, -
Task 
< 
IEnumerable 
< 
EleicaoDoDia %
>% &
>& '"
ObterEleicaoDoDiaAsync( >
(> ?
)? @
;@ A
} 
} ﬂ
Ü/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Models/EleicaoDoDia.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Models  &
{ 
public 

class 
EleicaoDoDia 
{ 
public 
EleicaoDoDia 
( 
Guid  
pretendenteId! .
,. /
string0 6
nomePretendente7 F
)F G
{ 	
PretendenteId 
= 
pretendenteId )
;) *
NomePretendente		 
=		 
nomePretendente		 -
;		- .
}

 	
public 
EleicaoDoDia 
( 
Guid  
pretendenteId! .
,. /
string0 6
nomePretendente7 F
,F G
intH K
totalDeVotosL X
,X Y
doubleZ `
porcentagema l
)l m
: 
this 
( 
pretendenteId  
,  !
nomePretendente" 1
)1 2
{ 	
TotalDeVotos 
= 
totalDeVotos '
;' (
Porcentagem 
= 
porcentagem %
;% &
} 	
public 
Guid 
PretendenteId !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
string 
NomePretendente %
{& '
get( +
;+ ,
private- 4
set5 8
;8 9
}: ;
public 
int 
TotalDeVotos 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 
double 
Porcentagem !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
} 
} ·
è/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Models/ListaDoVencedorDiario.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Models  &
{ 
public 

class !
ListaDoVencedorDiario &
{ 
public !
ListaDoVencedorDiario $
($ %
)% &
{		 	
}

 	
public 
List 
< 
VencedorDoDia !
>! "
ListaDeVencedores# 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
void 
AdicionarVencedor %
(% &
VencedorDoDia& 3
vencedor4 <
)< =
{ 	
ListaDeVencedores 
= 
(  !
ListaDeVencedores! 2
??3 5
new6 9
List: >
<> ?
VencedorDoDia? L
>L M
(M N
)N O
)O P
;P Q
ListaDeVencedores 
. 
Add !
(! "
vencedor" *
)* +
;+ ,
} 	
} 
public 

class 
VencedorDoDia 
{ 
public 
VencedorDoDia 
( 
DateTime %
dia& )
,) *
Guid+ /
pretendenteId0 =
,= >
string? E
nomePretendenteF U
,U V
intW Z
totalDeVotos[ g
,g h
doublei o
porcentagemp {
,{ |
bool	} Å
emAndamento
Ç ç
)
ç é
{ 	
Dia 
= 
dia 
; 
PretendenteId 
= 
pretendenteId )
;) *
NomePretendente 
= 
nomePretendente -
;- .
TotalDeVotos 
= 
totalDeVotos '
;' (
Porcentagem 
= 
porcentagem %
;% &
EmAndamento 
= 
emAndamento %
;% &
} 	
public 
DateTime 
Dia 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public   
Guid   
PretendenteId   !
{  " #
get  $ '
;  ' (
private  ) 0
set  1 4
;  4 5
}  6 7
public!! 
string!! 
NomePretendente!! %
{!!& '
get!!( +
;!!+ ,
private!!- 4
set!!5 8
;!!8 9
}!!: ;
public"" 
int"" 
TotalDeVotos"" 
{""  !
get""" %
;""% &
private""' .
set""/ 2
;""2 3
}""4 5
public## 
double## 
Porcentagem## !
{##" #
get##$ '
;##' (
private##) 0
set##1 4
;##4 5
}##6 7
public$$ 
bool$$ 
EmAndamento$$ 
{$$  !
get$$" %
;$$% &
private$$' .
set$$/ 2
;$$2 3
}$$4 5
}%% 
}&& Ì
ê/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Models/ListaDoVencedorSemanal.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Models  &
{ 
public 

class "
ListaDoVencedorSemanal '
{ 
public "
ListaDoVencedorSemanal %
(% &
)& '
{		 	
}

 	
public 
List 
< 
VencedorDaSemana $
>$ %
ListaDeVencedores& 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
void 
AdicionarVencedor %
(% &
VencedorDaSemana& 6
vencedor7 ?
)? @
{ 	
ListaDeVencedores 
= 
(  !
ListaDeVencedores! 2
??3 5
new6 9
List: >
<> ?
VencedorDaSemana? O
>O P
(P Q
)Q R
)R S
;S T
ListaDeVencedores 
. 
Add !
(! "
vencedor" *
)* +
;+ ,
} 	
} 
public 

class 
VencedorDaSemana !
{ 
public 
VencedorDaSemana 
(  
DateTime  (
inicioDaSemana) 7
,7 8
DateTime9 A
fimDaSemanaB M
,M N
GuidO S
pretendenteIdT a
,a b
stringc i
nomePretendentej y
,y z
int{ ~
totalDeVotos	 ã
,
ã å
double
ç ì
porcentagem
î ü
,
ü †
bool
° •
emAndamento
¶ ±
)
± ≤
{ 	
InicioDaSemana 
= 
inicioDaSemana +
;+ ,
FimDaSemana 
= 
fimDaSemana %
;% &
PretendenteId 
= 
pretendenteId )
;) *
NomePretendente 
= 
nomePretendente -
;- .
TotalDeVotos 
= 
totalDeVotos '
;' (
Porcentagem 
= 
porcentagem %
;% &
EmAndamento 
= 
emAndamento %
;% &
} 	
public   
DateTime   
InicioDaSemana   &
{  ' (
get  ) ,
;  , -
private  . 5
set  6 9
;  9 :
}  ; <
public!! 
DateTime!! 
FimDaSemana!! #
{!!$ %
get!!& )
;!!) *
private!!+ 2
set!!3 6
;!!6 7
}!!8 9
public"" 
Guid"" 
PretendenteId"" !
{""" #
get""$ '
;""' (
private"") 0
set""1 4
;""4 5
}""6 7
public## 
string## 
NomePretendente## %
{##& '
get##( +
;##+ ,
private##- 4
set##5 8
;##8 9
}##: ;
public$$ 
int$$ 
TotalDeVotos$$ 
{$$  !
get$$" %
;$$% &
private$$' .
set$$/ 2
;$$2 3
}$$4 5
public%% 
double%% 
Porcentagem%% !
{%%" #
get%%$ '
;%%' (
private%%) 0
set%%1 4
;%%4 5
}%%6 7
public&& 
bool&& 
EmAndamento&& 
{&&  !
get&&" %
;&&% &
private&&' .
set&&/ 2
;&&2 3
}&&4 5
}'' 
}(( Ê*
â/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Services/AvatarServico.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Services  (
{ 
public 

class 
AvatarServico 
:  
IAvatarServico! /
{ 
private 
readonly 
ILogger  
_logger! (
;( )
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
AvatarServico 
( 
IConfiguration +
configuration, 9
,9 :
ILogger; B
<B C
AvatarServicoC P
>P Q
loggerR X
)X Y
{ 	
_configuration 
= 
configuration *
;* +
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
RequestResult '
>' (
AdicionarAsync) 7
(7 8
Guid8 <
pretendenteId= J
,J K
	IFormFileL U
arquivoV ]
)] ^
{ 	
var 
avatarArquivo 
= 
new  #
AvatarArquivo$ 1
(1 2
pretendenteId2 ?
.? @
ToString@ H
(H I
)I J
,J K
arquivoL S
,S T
_configurationU c
)c d
;d e
var 
	validacao 
= 
new "
AvatarArquivoValidator  6
(6 7
)7 8
.8 9
Validate9 A
(A B
avatarArquivoB O
)O P
;P Q
if 
( 
! 
	validacao 
. 
IsValid "
)" #
{ 
_logger 
. 
LogError  
(  !
$str! 8
+9 :
	validacao; D
.D E
ErrorsE K
.K L
FirstOrDefaultL Z
(Z [
)[ \
.\ ]
ErrorMessage] i
)i j
;j k
return 
new 
RequestResult (
(( )
)) *
.* +

BadRequest+ 5
(5 6
	validacao6 ?
.? @
Errors@ F
.F G
SelectG M
(M N
pN O
=>P R
pS T
.T U
ErrorMessageU a
)a b
.b c
ToArrayc j
(j k
)k l
)l m
;m n
}   
if"" 
("" 
!"" 
await"" 
avatarArquivo"" $
.""$ %
CopiarAvatarAsync""% 6
(""6 7
)""7 8
)""8 9
{## 
_logger$$ 
.$$ 
LogError$$  
($$  !
$str$$! N
)$$N O
;$$O P
return%% 
new%% 
RequestResult%% (
(%%( )
)%%) *
.%%* +

BadRequest%%+ 5
(%%5 6
new%%6 9
string%%: @
[%%@ A
]%%A B
{%%C D
$str%%E ]
}%%^ _
)%%_ `
;%%` a
}&& 
return(( 
new(( 
RequestResult(( $
((($ %
)((% &
.((& '
Ok((' )
((() *
)((* +
;((+ ,
})) 	
public++ 
byte++ 
[++ 
]++ 
Obter++ 
(++ 
Guid++  
pretendenteId++! .
)++. /
{,, 	
var-- 
avatarArquivo-- 
=-- 
new--  #
AvatarArquivo--$ 1
(--1 2
pretendenteId--2 ?
.--? @
ToString--@ H
(--H I
)--I J
,--J K
_configuration--L Z
)--Z [
;--[ \
return.. 
avatarArquivo..  
...  !
ObterAvatar..! ,
(.., -
)..- .
;... /
}// 	
public11 
RequestResult11 
Remover11 $
(11$ %
Guid11% )
pretendenteId11* 7
)117 8
{22 	
var33 
avatarArquivo33 
=33 
new33  #
AvatarArquivo33$ 1
(331 2
pretendenteId332 ?
.33? @
ToString33@ H
(33H I
)33I J
,33J K
_configuration33L Z
)33Z [
;33[ \
if55 
(55 
avatarArquivo55 
.55 
RemoverAvatar55 +
(55+ ,
)55, -
)55- .
return66 
new66 
RequestResult66 (
(66( )
)66) *
.66* +
Ok66+ -
(66- .
)66. /
;66/ 0
_logger88 
.88 
LogError88 
(88 
$str88 I
)88I J
;88J K
return99 
new99 
RequestResult99 $
(99$ %
)99% &
.99& '

BadRequest99' 1
(991 2
new992 5
string996 <
[99< =
]99= >
{99? @
$str99A Z
}99[ \
)99\ ]
;99] ^
}:: 	
};; 
}<< úº
á/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain/Services/VotoServico.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Services  (
{ 
public 

class 
VotoServico 
: 
IVotoServico +
{ 
private 
readonly 
IVotoRepositorio )
_votoRepositorio* :
;: ;
private 
readonly #
IPretendenteRepositorio 0#
_pretendenteRepositorio1 H
;H I
private 
readonly 
ILogger  
_logger! (
;( )
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
VotoServico 
( 
IVotoRepositorio +
votoRepositorio, ;
,; <#
IPretendenteRepositorio= T"
pretendenteRepositorioU k
,k l
ILoggerm t
<t u
VotoServico	u Ä
>
Ä Å
logger
Ç à
,
à â
IConfiguration
ä ò
configuration
ô ¶
)
¶ ß
{ 	
_votoRepositorio 
= 
votoRepositorio .
;. /#
_pretendenteRepositorio #
=$ %"
pretendenteRepositorio& <
;< =
_logger 
= 
logger 
; 
_configuration 
= 
configuration *
;* +
} 	
public 
PeriodoVotacao 
ObterPeriodoVotacao 1
(1 2
)2 3
{ 	
return 
new 
PeriodoVotacao %
(% &
_configuration& 4
)4 5
;5 6
} 	
public   
async   
Task   
<   
RequestResult   (
>  ( )
ComputarAsync  * 7
(  7 8
Voto  8 <
voto  = A
)  A B
{!! 	
var"" 
pretendente"" 
="" 
await"" ##
_pretendenteRepositorio""$ ;
.""; <

ObterAsync""< F
(""F G
voto""G K
.""K L
PretendenteId""L Y
)""Y Z
;""Z [
if## 
(## 
pretendente## 
==## 
null## "
)##" #
{$$ 
_logger%% 
.%% 
LogError%%  
(%%  !
$"%%! #G
;[VotoServico - ComputarAsync - Pretendente n√£o encontrado %%# ]
{%%] ^
voto%%^ b
.%%b c
PretendenteId%%c p
}%%p q
"%%q r
)%%r s
;%%s t
return&& 
new&& 
RequestResult&& (
(&&( )
)&&) *
.&&* +
NotFound&&+ 3
(&&3 4
)&&4 5
;&&5 6
}'' 
var(( 
votoDb(( 
=(( 
await(( 
_votoRepositorio(( /
.((/ 0

ObterDoDia((0 :
(((: ;
voto((; ?
.((? @
PretendenteId((@ M
)((M N
;((N O
if)) 
()) 
votoDb)) 
==)) 
null)) 
))) 
await** 
_votoRepositorio** &
.**& '
AdicionarAsync**' 5
(**5 6
voto**6 :
)**: ;
;**; <
else++ 
{,, 
votoDb-- 
.-- 
Computar-- 
(--  
)--  !
;--! "
await.. 
_votoRepositorio.. &
...& '
AtualizarAsync..' 5
(..5 6
votoDb..6 <
)..< =
;..= >
}// 
_logger00 
.00 
LogInformation00 "
(00" #
$"00# %.
"Voto computado para o pretendente 00% G
{00G H
voto00H L
.00L M
PretendenteId00M Z
}00Z [
.00[ \
"00\ ]
)00] ^
;00^ _
return11 
new11 
RequestResult11 $
(11$ %
)11% &
.11& '
Ok11' )
(11) *
)11* +
;11+ ,
}22 	
public44 
async44 
Task44 
<44 !
ListaDoVencedorDiario44 /
>44/ 0%
ListarVencedorPorDiaAsync441 J
(44J K
)44K L
{55 	
var66 
votos66 
=66 
await66 
_votoRepositorio66 .
.66. /
ListarAsync66/ :
(66: ;
)66; <
;66< =
if77 
(77 
votos77 
==77 
null77 
||77  
!77! "
votos77" '
.77' (
Any77( +
(77+ ,
)77, -
)77- .
return77/ 5
null776 :
;77: ;
var99 
	resultado99 
=99 
new99 !
ListaDoVencedorDiario99  5
(995 6
)996 7
;997 8
var<< 
votosAgrupados<< 
=<<  
votos<<! &
.<<& '
OrderByDescending<<' 8
(<<8 9
p<<9 :
=><<; =
p<<> ?
.<<? @
Data<<@ D
)<<D E
.<<E F
GroupBy<<F M
(<<M N
p<<N O
=><<P R
p<<S T
.<<T U
Data<<U Y
.<<Y Z
Date<<Z ^
)<<^ _
.<<_ `
ToArray<<` g
(<<g h
)<<h i
;<<i j
foreach== 
(== 
var== 

votosDoDia== #
in==$ &
votosAgrupados==' 5
)==5 6
	resultado>> 
.>> 
AdicionarVencedor>> +
(>>+ ,
ObterVencedorDiario>>, ?
(>>? @

votosDoDia>>@ J
)>>J K
)>>K L
;>>L M
return@@ 
	resultado@@ 
;@@ 
}AA 	
privateBB 
VencedorDoDiaBB 
ObterVencedorDiarioBB 1
(BB1 2
IEnumerableBB2 =
<BB= >
VotoBB> B
>BBB C
votosBBD I
)BBI J
{CC 	
ifDD 
(DD 
votosDD 
==DD 
nullDD 
)DD 
returnDD %
nullDD& *
;DD* +
varEE 
diaDosVotosEE 
=EE 
votosEE #
.EE# $
SelectEE$ *
(EE* +
pEE+ ,
=>EE- /
pEE0 1
.EE1 2
DataEE2 6
)EE6 7
.EE7 8
FirstOrDefaultEE8 F
(EEF G
)EEG H
;EEH I
varFF 
periodoVotacaoFF 
=FF  
ObterPeriodoVotacaoFF! 4
(FF4 5
)FF5 6
;FF6 7
varGG 
emAndamentoGG 
=GG 
CompararDataGG *
.GG* +
MaiorIgualHojeGG+ 9
(GG9 :
diaDosVotosGG: E
)GGE F
&&GGG I
CompararDataGGJ V
.GGV W
MenorIgualHojeGGW e
(GGe f
diaDosVotosGGf q
)GGq r
;GGr s
varHH 
totalDeVotosHH 
=HH 
votosHH $
.HH$ %
SumHH% (
(HH( )
pHH) *
=>HH+ -
pHH. /
.HH/ 0

QuantidadeHH0 :
)HH: ;
;HH; <
varII 
vencedorII 
=II 
votosII  
.II  !
OrderByDescendingII! 2
(II2 3
pII3 4
=>II5 7
pII8 9
.II9 :

QuantidadeII: D
)IID E
.IIE F
FirstOrDefaultIIF T
(IIT U
)IIU V
;IIV W
returnJJ 
newJJ 
VencedorDoDiaJJ $
(JJ$ %
vencedorKK  
.KK  !
DataKK! %
,KK% &
vencedorKK' /
.KK/ 0
PretendenteIdKK0 =
,KK= >
vencedorKK? G
.KKG H
PretendenteKKH S
.KKS T
NomeKKT X
,KKX Y
vencedorKKZ b
.KKb c

QuantidadeKKc m
,KKm n
CalcularPorcentagemLL +
(LL+ ,
vencedorLL, 4
.LL4 5

QuantidadeLL5 ?
,LL? @
totalDeVotosLLA M
)LLM N
,LLN O
emAndamentoLLP [
)LL[ \
;LL\ ]
}MM 	
publicNN 
asyncNN 
TaskNN 
<NN "
ListaDoVencedorSemanalNN 0
>NN0 1&
ListarVencedorSemanalAsyncNN2 L
(NNL M
)NNM N
{OO 	
varPP 
votosPP 
=PP 
awaitPP 
_votoRepositorioPP .
.PP. /
ListarAsyncPP/ :
(PP: ;
)PP; <
;PP< =
ifQQ 
(QQ 
votosQQ 
==QQ 
nullQQ 
||QQ  
!QQ! "
votosQQ" '
.QQ' (
AnyQQ( +
(QQ+ ,
)QQ, -
)QQ- .
returnQQ/ 5
nullQQ6 :
;QQ: ;
varRR 
	resultadoRR 
=RR 
newRR "
ListaDoVencedorSemanalRR  6
(RR6 7
)RR7 8
;RR8 9
varUU 
semanasUU 
=UU 
ObterSemanasUU &
(UU& '
votosUU' ,
.UU, -
OrderByDescendingUU- >
(UU> ?
pUU? @
=>UUA C
pUUD E
.UUE F
DataUUF J
)UUJ K
.UUK L
SelectUUL R
(UUR S
pUUS T
=>UUU W
pUUX Y
.UUY Z
DataUUZ ^
.UU^ _
DateUU_ c
)UUc d
.UUd e
DistinctUUe m
(UUm n
)UUn o
)UUo p
;UUp q
foreachYY 
(YY 
varYY 
semanaYY 
inYY  "
semanasYY# *
)YY* +
{ZZ 
var[[ 
votosAgrupados[[ "
=[[# $
votos[[% *
.[[* +
OrderByDescending[[+ <
([[< =
p[[= >
=>[[? A
p[[B C
.[[C D
Data[[D H
)[[H I
.[[I J
Where[[J O
([[O P
p[[P Q
=>[[R T
p[[U V
.[[V W
Data[[W [
.[[[ \
Date[[\ `
>=[[a c
semana[[d j
.[[j k
Inicio[[k q
.[[q r
Date[[r v
&&[[w y
p[[z {
.[[{ |
Data	[[| Ä
.
[[Ä Å
Date
[[Å Ö
<=
[[Ü à
semana
[[â è
.
[[è ê
Fim
[[ê ì
.
[[ì î
Date
[[î ò
)
[[ò ô
.
[[ô ö
ToArray
[[ö °
(
[[° ¢
)
[[¢ £
;
[[£ §
	resultado\\ 
.\\ 
AdicionarVencedor\\ +
(\\+ , 
ObterVencedorSemanal\\, @
(\\@ A
votosAgrupados\\A O
,\\O P
semana\\Q W
)\\W X
)\\X Y
;\\Y Z
}]] 
return^^ 
	resultado^^ 
;^^ 
}__ 	
private`` 
VencedorDaSemana``   
ObterVencedorSemanal``! 5
(``5 6
IEnumerable``6 A
<``A B
Voto``B F
>``F G
votos``H M
,``M N"
DataInicioEFimDaSemana``O e
periodo``f m
)``m n
{aa 	
ifbb 
(bb 
votosbb 
==bb 
nullbb 
)bb 
returnbb %
nullbb& *
;bb* +
varcc 
totalDeVotoscc 
=cc 
votoscc $
.cc$ %
Sumcc% (
(cc( )
pcc) *
=>cc+ -
pcc. /
.cc/ 0

Quantidadecc0 :
)cc: ;
;cc; <
vardd 
emAndamentodd 
=dd 
CompararDatadd +
.dd+ ,
MaiorIgualHojedd, :
(dd: ;
periododd; B
.ddB C
InicioddC I
)ddI J
&&ddK M
CompararDataddN Z
.ddZ [
MenorIgualHojedd[ i
(ddi j
periododdj q
.ddq r
Fimddr u
)ddu v
;ddv w
varee 
vencedoree 
=ee 
votosee $
.ee$ %
OrderByDescendingee% 6
(ee6 7
pee7 8
=>ee9 ;
pee< =
.ee= >

Quantidadeee> H
)eeH I
.eeI J
FirstOrDefaulteeJ X
(eeX Y
)eeY Z
;eeZ [
returnff 
newff 
VencedorDaSemanaff '
(ff' (
periodoff( /
.ff/ 0
Inicioff0 6
,ff6 7
periodoff8 ?
.ff? @
Fimff@ C
,ffC D
vencedorffE M
.ffM N
PretendenteIdffN [
,ff[ \
vencedorff] e
.ffe f
Pretendentefff q
.ffq r
Nomeffr v
,ffv w
vencedor	ffx Ä
.
ffÄ Å

Quantidade
ffÅ ã
,
ffã å!
CalcularPorcentagem
ffç †
(
ff† °
vencedor
ff° ©
.
ff© ™

Quantidade
ff™ ¥
,
ff¥ µ
totalDeVotos
ff∂ ¬
)
ff¬ √
,
ff√ ƒ
emAndamento
ff≈ –
)
ff– —
;
ff— “
}gg 	
privatehh 
Listhh 
<hh "
DataInicioEFimDaSemanahh +
>hh+ ,
ObterSemanashh- 9
(hh9 :
IEnumerablehh: E
<hhE F
DateTimehhF N
>hhN O
datashhP U
)hhU V
{ii 	
ifjj 
(jj 
datasjj 
==jj 
nulljj 
||jj  
!jj! "
datasjj" '
.jj' (
Anyjj( +
(jj+ ,
)jj, -
)jj- .
returnjj/ 5
nulljj6 :
;jj: ;
varkk 
	resultadokk 
=kk 
newkk 
Listkk  $
<kk$ %"
DataInicioEFimDaSemanakk% ;
>kk; <
(kk< =
)kk= >
;kk> ?
foreachll 
(ll 
varll 
datall 
inll  
datasll! &
.ll& '
Selectll' -
(ll- .
pll. /
=>ll0 2
pll3 4
.ll4 5
Datell5 9
)ll9 :
)ll: ;
{mm 
varnn 
existeNaListann !
=nn" #
(nn$ %
	resultadonn% .
.nn. /
Wherenn/ 4
(nn4 5
pnn5 6
=>nn7 9
pnn: ;
.nn; <
Inicionn< B
.nnB C
DatennC G
<=nnH J
datannK O
.nnO P
DatennP T
&&nnU W
pnnX Y
.nnY Z
FimnnZ ]
.nn] ^
Datenn^ b
>=nnc e
datannf j
.nnj k
Datennk o
)nno p
)nnp q
;nnq r
ifoo 
(oo 
existeNaListaoo !
.oo! "
Anyoo" %
(oo% &
)oo& '
)oo' (
continueoo) 1
;oo1 2
switchqq 
(qq 
dataqq 
.qq 
	DayOfWeekqq &
)qq& '
{rr 
casess 
	DayOfWeekss "
.ss" #
Sundayss# )
:ss) *
	resultadott !
.tt! "
Addtt" %
(tt% &
newtt& )"
DataInicioEFimDaSemanatt* @
(tt@ A
datattA E
,ttE F
datattG K
.ttK L
AddDaysttL S
(ttS T
+ttT U
$numttU V
)ttV W
)ttW X
)ttX Y
;ttY Z
breakuu 
;uu 
casevv 
	DayOfWeekvv "
.vv" #
Mondayvv# )
:vv) *
	resultadoww !
.ww! "
Addww" %
(ww% &
newww& )"
DataInicioEFimDaSemanaww* @
(ww@ A
datawwA E
.wwE F
AddDayswwF M
(wwM N
-wwN O
$numwwO P
)wwP Q
,wwQ R
datawwS W
.wwW X
AddDayswwX _
(ww_ `
+ww` a
$numwwa b
)wwb c
)wwc d
)wwd e
;wwe f
breakxx 
;xx 
caseyy 
	DayOfWeekyy "
.yy" #
Tuesdayyy# *
:yy* +
	resultadozz !
.zz! "
Addzz" %
(zz% &
newzz& )"
DataInicioEFimDaSemanazz* @
(zz@ A
datazzA E
.zzE F
AddDayszzF M
(zzM N
-zzN O
$numzzO P
)zzP Q
,zzQ R
datazzS W
.zzW X
AddDayszzX _
(zz_ `
+zz` a
$numzza b
)zzb c
)zzc d
)zzd e
;zze f
break{{ 
;{{ 
case|| 
	DayOfWeek|| "
.||" #
	Wednesday||# ,
:||, -
	resultado}} !
.}}! "
Add}}" %
(}}% &
new}}& )"
DataInicioEFimDaSemana}}* @
(}}@ A
data}}A E
.}}E F
AddDays}}F M
(}}M N
-}}N O
$num}}O P
)}}P Q
,}}Q R
data}}S W
.}}W X
AddDays}}X _
(}}_ `
+}}` a
$num}}a b
)}}b c
)}}c d
)}}d e
;}}e f
break~~ 
;~~ 
case 
	DayOfWeek "
." #
Thursday# +
:+ ,
	resultado
ÄÄ !
.
ÄÄ! "
Add
ÄÄ" %
(
ÄÄ% &
new
ÄÄ& )$
DataInicioEFimDaSemana
ÄÄ* @
(
ÄÄ@ A
data
ÄÄA E
.
ÄÄE F
AddDays
ÄÄF M
(
ÄÄM N
-
ÄÄN O
$num
ÄÄO P
)
ÄÄP Q
,
ÄÄQ R
data
ÄÄS W
.
ÄÄW X
AddDays
ÄÄX _
(
ÄÄ_ `
+
ÄÄ` a
$num
ÄÄa b
)
ÄÄb c
)
ÄÄc d
)
ÄÄd e
;
ÄÄe f
break
ÅÅ 
;
ÅÅ 
case
ÇÇ 
	DayOfWeek
ÇÇ "
.
ÇÇ" #
Friday
ÇÇ# )
:
ÇÇ) *
	resultado
ÉÉ !
.
ÉÉ! "
Add
ÉÉ" %
(
ÉÉ% &
new
ÉÉ& )$
DataInicioEFimDaSemana
ÉÉ* @
(
ÉÉ@ A
data
ÉÉA E
.
ÉÉE F
AddDays
ÉÉF M
(
ÉÉM N
-
ÉÉN O
$num
ÉÉO P
)
ÉÉP Q
,
ÉÉQ R
data
ÉÉS W
.
ÉÉW X
AddDays
ÉÉX _
(
ÉÉ_ `
+
ÉÉ` a
$num
ÉÉa b
)
ÉÉb c
)
ÉÉc d
)
ÉÉd e
;
ÉÉe f
break
ÑÑ 
;
ÑÑ 
case
ÖÖ 
	DayOfWeek
ÖÖ "
.
ÖÖ" #
Saturday
ÖÖ# +
:
ÖÖ+ ,
	resultado
ÜÜ !
.
ÜÜ! "
Add
ÜÜ" %
(
ÜÜ% &
new
ÜÜ& )$
DataInicioEFimDaSemana
ÜÜ* @
(
ÜÜ@ A
data
ÜÜA E
.
ÜÜE F
AddDays
ÜÜF M
(
ÜÜM N
-
ÜÜN O
$num
ÜÜO P
)
ÜÜP Q
,
ÜÜQ R
data
ÜÜS W
)
ÜÜW X
)
ÜÜX Y
;
ÜÜY Z
break
áá 
;
áá 
}
àà 
}
ââ 
return
ää 
	resultado
ää 
;
ää 
}
ãã 	
private
åå 
double
åå !
CalcularPorcentagem
åå *
(
åå* +
int
åå+ .
votos
åå/ 4
,
åå4 5
int
åå6 9
total
åå: ?
)
åå? @
{
çç 	
var
éé 
porcentagem
éé 
=
éé 
(
éé 
votos
éé $
*
éé% &
$num
éé' *
)
éé* +
/
éé, -
total
éé. 3
;
éé3 4
return
èè 
porcentagem
èè 
;
èè 
}
êê 	
public
íí 
async
íí 
Task
íí 
<
íí 
IEnumerable
íí %
<
íí% &
EleicaoDoDia
íí& 2
>
íí2 3
>
íí3 4$
ObterEleicaoDoDiaAsync
íí5 K
(
ííK L
)
ííL M
{
ìì 	
var
îî 
pretendentes
îî 
=
îî 
await
îî $%
_pretendenteRepositorio
îî% <
.
îî< =
ListarAsync
îî= H
(
îîH I
)
îîI J
;
îîJ K
var
ïï 
votos
ïï 
=
ïï 
await
ïï 
_votoRepositorio
ïï .
.
ïï. /
ListarDoDiaAsync
ïï/ ?
(
ïï? @
)
ïï@ A
;
ïïA B
var
ññ 
	resultado
ññ 
=
ññ 
new
ññ 
List
ññ  $
<
ññ$ %
EleicaoDoDia
ññ% 1
>
ññ1 2
(
ññ2 3
)
ññ3 4
;
ññ4 5
foreach
óó 
(
óó 
var
óó 
pretendente
óó $
in
óó% '
pretendentes
óó( 4
)
óó4 5
{
òò 
var
ôô 
voto
ôô 
=
ôô 
votos
ôô  
.
ôô  !
FirstOrDefault
ôô! /
(
ôô/ 0
p
ôô0 1
=>
ôô2 4
p
ôô5 6
.
ôô6 7
PretendenteId
ôô7 D
==
ôôE G
pretendente
ôôH S
.
ôôS T
Id
ôôT V
)
ôôV W
;
ôôW X
if
öö 
(
öö 
voto
öö 
!=
öö 
null
öö 
)
öö  
{
õõ 
var
úú 
totalDeVotos
úú $
=
úú% &
votos
úú' ,
.
úú, -
Sum
úú- 0
(
úú0 1
p
úú1 2
=>
úú3 5
p
úú6 7
.
úú7 8

Quantidade
úú8 B
)
úúB C
;
úúC D
	resultado
ùù 
.
ùù 
Add
ùù !
(
ùù! "
new
ûû 
EleicaoDoDia
ûû (
(
ûû( )
pretendente
ûû) 4
.
ûû4 5
Id
ûû5 7
,
ûû7 8
pretendente
ûû9 D
.
ûûD E
Nome
ûûE I
,
ûûI J
voto
ûûK O
.
ûûO P

Quantidade
ûûP Z
,
ûûZ [!
CalcularPorcentagem
ûû\ o
(
ûûo p
voto
ûûp t
.
ûût u

Quantidade
ûûu 
,ûû Ä
totalDeVotosûûÅ ç
)ûûç é
)ûûé è
)ûûè ê
;ûûê ë
}
üü 
else
†† 
	resultado
†† 
.
†† 
Add
†† "
(
††" #
new
††# &
EleicaoDoDia
††' 3
(
††3 4
pretendente
††4 ?
.
††? @
Id
††@ B
,
††B C
pretendente
††D O
.
††O P
Nome
††P T
)
††T U
)
††U V
;
††V W
}
°° 
return
¢¢ 
	resultado
¢¢ 
.
¢¢ 
ToArray
¢¢ $
(
¢¢$ %
)
¢¢% &
;
¢¢& '
}
££ 	
}
§§ 
public
¶¶ 

class
¶¶ $
DataInicioEFimDaSemana
¶¶ '
{
ßß 
public
®® $
DataInicioEFimDaSemana
®® %
(
®®% &
)
®®& '
{
©© 	
}
´´ 	
public
≠≠ $
DataInicioEFimDaSemana
≠≠ %
(
≠≠% &
DateTime
≠≠& .
inicio
≠≠/ 5
,
≠≠5 6
DateTime
≠≠7 ?
fim
≠≠@ C
)
≠≠C D
{
ÆÆ 	
Inicio
ØØ 
=
ØØ 
inicio
ØØ 
;
ØØ 
Fim
∞∞ 
=
∞∞ 
fim
∞∞ 
;
∞∞ 
}
±± 	
public
≥≥ 
DateTime
≥≥ 
Inicio
≥≥ 
{
≥≥  
get
≥≥! $
;
≥≥$ %
set
≥≥& )
;
≥≥) *
}
≥≥+ ,
public
¥¥ 
DateTime
¥¥ 
Fim
¥¥ 
{
¥¥ 
get
¥¥ !
;
¥¥! "
set
¥¥# &
;
¥¥& '
}
¥¥( )
public
∂∂ 
void
∂∂ 
	SetInicio
∂∂ 
(
∂∂ 
DateTime
∂∂ &
data
∂∂' +
)
∂∂+ ,
{
∑∑ 	
Inicio
∏∏ 
=
∏∏ 
data
∏∏ 
;
∏∏ 
}
ππ 	
public
∫∫ 
void
∫∫ 
SetFim
∫∫ 
(
∫∫ 
DateTime
∫∫ #
data
∫∫$ (
)
∫∫( )
{
ªª 	
Fim
ºº 
=
ºº 
data
ºº 
;
ºº 
}
ΩΩ 	
}
ææ 
}øø 