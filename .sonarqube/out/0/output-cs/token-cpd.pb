?
KC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlModel\equipo.cs
	namespace 	
ApiMsqlModel
 
{ 
public

 

class

 
equipo

 
{ 
public 
int 
idEquipo 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
? 
nombreEquipo #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
? 
pais 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
estado 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ?
LC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlModel\estadio.cs
	namespace 	
ApiMsqlModel
 
{ 
public		 

class		 
estadio		 
{

 
public 
int 
	idEstadio 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
pais 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
estado 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ?
IC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlModel\liga.cs
	namespace 	
ApiMsqlModel
 
{ 
public		 

class		 
liga		 
{

 
public 
int 
idLiga 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 

nombreLiga  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
fechaCreacion #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
fechaCierre !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 

tipodeLiga 
{ 
get  #
;# $
set% (
;( )
}* +
public 
float !
precioDeParticipacion *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
sede 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
estado 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ?
PC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlModel\ligaUsuario.cs
	namespace 	
ApiMsqlModel
 
{ 
public		 

class		 
ligaUsuario		 
{

 
public 
int 

idRegistro 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
? 
idLiga 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
? 
	idUsuario 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
punteo 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
estado 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ?
IC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlModel\pago.cs
	namespace 	
ApiMsqlModel
 
{ 
public		 

class		 
pago		 
{

 
public 
int 
idPago 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
	idUsuario 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
	idTarjeta 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
idLiga 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
fechaDePago !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ?

LC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlModel\tarjeta.cs
	namespace 	
ApiMsqlModel
 
{ 
public		 

class		 
tarjeta		 
{

 
public 
int 
	idTarjeta 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
nombreEncargado %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
numerodeTarjeta %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
cvc 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
fechaDeCaducidad &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
tipo 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
estado 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ?
LC:\Users\Gonza\OneDrive\Documents\Github\ACSProyecto\ApiMsqlModel\usuario.cs
	namespace 	
ApiMsqlModel
 
{ 
public		 

class		 
usuario		 
{

 
public 
int 
	idUsuario 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 

nomUsuario  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
pass 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
email 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
estado 
{ 
get 
;  
set! $
;$ %
}& '
} 
} 