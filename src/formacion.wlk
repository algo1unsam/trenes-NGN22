class Formacion {
	
	var vagones = []
	
	var locomotoras = []
	
	
	//post agrega vagones a la formacion
	method agregarVagones(vagon)
	{
		vagones.add(vagon)
	}	
	
	
	//post agrega locomotoras a la formacion 
	method agregarLocomotoras(locomotora)
	{
		locomotoras.add(locomotora)
	}
	
	
	//post: retorna la cantidad de pasajeros total
	method cantidadPasajerosDeUnaFormacion()
	{
		vagones.sum {vagon => vagon.calcularPasajerosMaximo()}
	}	
	
	
	//post: retorna el numero de vagones livianos en la formacion
	method cantidadDeVagonesLivianos()
	{
		vagones.count { vagon => vagon.esLiviano()}
	}
	
	//post retorna el vagon mas pesado
	method vagonMasPesado()
	{
		return vagones.count( { vagon => vagon.peso() } )
	}
	
	
	//pre se agrego al menos 1 lcomotora
	//post retorna minima velocidad en la coleccion
	method velocidadMaxima()
	{
		return locomotoras.min { locomotora => locomotora.velocidadMaxima()  }
	}
	
	
	//post true si todas las locomotoras arrastran 5 veces su peso => peso * 5 
	method esEficiente()
	{
		return locomotoras.all{ locomotora => locomotora.calcularArrastreUtil() == locomotora.peso() * 5	}
	}
	
	
	
	//pre se agrego al menos una locomotora a la formacion
	//post devuelve la suma del arrastre util de todas las locomotoras agregadas
	method arrastreUtilTotal()
	{
		return locomotoras.sum {locomotora => locomotora.calcularArrastreUtil() }
	}
	
	
	
	//pre se agrego al menos un vagon a la formacion
	//post retorna la sumatoria del peso de los vagones
	method pesoTotalVagones()
	{
		return vagones.sum {vagon => vagon.peso() }
	}
	
	
		
	//post verdadero si la formacion puede moverse
	method podesMoverte()
	{
		return self.arrastreUtilTotal() >= self.pesoTotalVagones()
	}
	
	
	
	//pre se agregaron vagon/es y locomotora/s a la formacion
	//post retorna 0 si se puede mover
	// o sum(peso vagones) - sum (arrastreUtil total de las locomotoras)
	method empujeFaltante()
	{
		return ( self.pesoTotalVagones() - self.arrastreUtilTotal() ).max(0) 
	}
	
	
		
	//pre agregar locomotora/s a la formacion
	//post retorna sum de las locomotoras
	method pesoTotalLocomotoras()
	{
		return locomotoras.sum {locomotora => locomotora.peso() }
	}
	
	
	//post retorna el peso locomotoras + vagones 
	method pesoTotalFormacion()
	{
		return self.pesoTotalVagones() + self.pesoTotalLocomotoras()
	}
	
	
	//post verdadero si el peso total vagones + locomotoras > 10000
	method complejidadPorPeso()
	{
		return self.pesoTotalFormacion () > 10000
	}
	
	
	
	//post retorna la cantidad de elementos en la formacion
	method cantidadElementos()
	{
		return locomotoras.size () + vagones.size ()
	}
	
	
	
	//pre verdadero si la cantidad de elemntos en la formacion > 20
	method complejidadPorTamanio()
	{
		return self . cantidadElementos () > 20
	}
	
	//post verdadero si la formaciones compleja
	method formacionCompleja()
	{
		return self . complejidadPorPeso() || self . complejidadPorTamanio ()
	
	}
	
		
}

class FormacionLargaDistancia inherits Formacion 
{
	
	//post verdadero si esta bien armada
	method estaBienArmada() {
		
	}
	 
	
	method baniosDisponibles() = vagones.sum {vagon => vagon.cantidadBanios() }
	
	
	
}

class FormacionCortaDistancia inherits Formacion
{
	method estaBienArmada() = self.formacionCompleja() 
}

