‡	
/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain.Shared/Entities/CompararData.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Shared  &
.& '
Entities' /
{ 
public 

static 
class 
CompararData $
{ 
public 
static 
bool 
MaiorIgualHoje )
() *
DateTime* 2
data3 7
)7 8
=>9 ;
data< @
.@ A
DateA E
>=F H
DateTimeI Q
.Q R
UtcNowR X
.X Y
DateY ]
;] ^
public 
static 
bool 
MenorIgualHoje )
() *
DateTime* 2
data3 7
)7 8
=>9 ;
data< @
.@ A
DateA E
<=F H
DateTimeI Q
.Q R
UtcNowR X
.X Y
DateY ]
;] ^
}		 
}

 ¸
/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/services/GL.ReiDoAlmoco.Domain.Shared/Entities/RequestResult.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Domain 
.  
Shared  &
.& '
Entities' /
{ 
public 

class 
RequestResult 
{ 
public 
bool 
Sucesso 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
Mensagem		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
HttpStatusCode

 

StatusCode

 (
{

) *
get

+ .
;

. /
set

0 3
;

3 4
}

5 6
public 
string 
[ 
] 
Errors 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
RequestResult 
Ok 
(  
)  !
{ 	
Sucesso 
= 
true 
; 
Mensagem 
= 
$str 8
;8 9

StatusCode 
= 
HttpStatusCode '
.' (
OK( *
;* +
return 
this 
; 
} 	
public 
RequestResult 

BadRequest '
(' (
string( .
[. /
]/ 0
errors1 7
)7 8
{ 	
Sucesso 
= 
false 
; 
Mensagem 
= 
$str .
;. /

StatusCode 
= 
HttpStatusCode '
.' (

BadRequest( 2
;2 3
Errors 
= 
errors 
; 
return 
this 
; 
} 	
public 
RequestResult 
NotFound %
(% &
)& '
{ 	
Sucesso 
= 
false 
; 
Mensagem 
= 
$" #
Objeto nÃ£o encontrado. /
"/ 0
;0 1

StatusCode   
=   
HttpStatusCode   '
.  ' (
NotFound  ( 0
;  0 1
return!! 
this!! 
;!! 
}"" 	
}## 
}$$ 