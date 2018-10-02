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
	
	//Si una formación puede moverse. Una formación
	// puede moverse si el arrastre útil total de sus locomotoras es mayor o igual al peso máximo total de los vagones.
	//post verdadero si la formacion puede moverse
	method podesMoverte()
	{
		//locomotoras.
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
