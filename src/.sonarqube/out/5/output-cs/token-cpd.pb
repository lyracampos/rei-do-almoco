€
ê/Users/guilhermelyracampos/Documents/profissional/projetos/git/rei-do-almoco/src/tests/GL.ReiDoAlmoco.Tests.Shared/PretendenteRepositorioFake.cs
	namespace 	
GL
 
. 
ReiDoAlmoco 
. 
Tests 
. 
Shared %
{ 
public 

class &
PretendenteRepositorioFake +
{ 
public 
IEnumerable 
< 
Domain !
.! "
Entities" *
.* +
Pretendente+ 6
>6 7
ListarPretendentes8 J
(J K
)K L
{		 	
var

 
lista

 
=

 
new

 
List

  
<

  !
Domain

! '
.

' (
Entities

( 0
.

0 1
Pretendente

1 <
>

< =
{ 
new 
Domain 
. 
Entities #
.# $
Pretendente$ /
(/ 0
$str0 D
,D E
$strF h
)h i
,i j
new 
Domain 
. 
Entities #
.# $
Pretendente$ /
(/ 0
$str0 D
,D E
$strF h
)h i
,i j
new 
Domain 
. 
Entities #
.# $
Pretendente$ /
(/ 0
$str0 D
,D E
$strF h
)h i
} 
; 
return 
lista 
. 
ToArray  
(  !
)! "
;" #
} 	
public 
IEnumerable 
< 
Domain !
.! "
Entities" *
.* +
Pretendente+ 6
>6 7"
ListarPretendentesNull8 N
(N O
)O P
{ 	
return 
null 
; 
} 	
public 
Domain 
. 
Entities 
. 
Pretendente *
ObterUmPretendente+ =
(= >
)> ?
{ 	
return 
ListarPretendentes %
(% &
)& '
.' (
FirstOrDefault( 6
(6 7
)7 8
;8 9
} 	
public 
Domain 
. 
Entities 
. 
Pretendente *"
ObterUmPretendenteNull+ A
(A B
)B C
{ 	
return 
null 
; 
} 	
} 
} 