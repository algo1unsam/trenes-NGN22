
//En cada depósito hay: formaciones ya armadas
//, y locomotoras sueltas que pueden ser agregadas a una formación.

class Deposito
{
	var formaciones = []
	var locomotoras = []
	
	
	//post agrega locomotoras al deposito 
	method agregarLocomotoras (locomotora)
	{
		locomotoras.add (locomotora)
	}
	
	 
	//post agrega formaciones  al deposito
	method agregarFormacion(formacion)
	{
		formaciones.add (formacion)
	}
		
	//post retorna la lista 
	method locomotoras()
	{
		return locomotoras
	}
	
	//pre agregar formaciones c vagon/nes al deposito
	//post retorna una coleccion con el/los vagones mas pesados
	method listaVagonesMasPesados ()
	{
		return formaciones.map  { formacion =>  formacion.vagonMasPesado()  } 
	}
	
	
	
	//post si hay una formacion compleja la 
	method depositoComplejo()
	{
		return formaciones.findOrDefault ( { formacion => formacion.formacionCompleja() } , 0 )
	}
	
	
	//post verdadero si no se necesita
	method conductorExperimentado()
	{
		return self.depositoComplejo()  != 0 
	}
	
	//pre me pasan una formacion existente en el deposito
	//post hay una locomotora
	method agregarLocomotoraALaFormacion(formacion)
	{
		if( !formacion.podesMoverte() )
		{
			self.hayLocomotorasConArrastreDisponible( formacion )
		}
	}
	
	
	//pre la formacion no se puede mover
	//post agrega si dentro del deposito hay una locomotora que pueda hacer mover a la formacion
	method hayLocomotorasConArrastreDisponible(formacion)
	{
		if ( self . locomotoraAgregar(formacion.empujeFaltante() ) )
			{
			formacion.agregarLocomotoras( self.locomotoraAgregar( formacion.empujeFaltante() ) )
			locomotoras.remove( self.locomotoraAgregar( formacion.empujeFaltante() ) )
			}
			
	}
	
	
	
	method locomotoraAgregar(empujeFaltante)
	{
		
		return locomotoras.find ( { locomotora => locomotora.calcularArrastreUtil() >= empujeFaltante } , false )
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
