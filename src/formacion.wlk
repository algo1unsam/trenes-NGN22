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
	
	//[1, 3, 5].all { number => number.odd() } 
	method esEficiente()
	{
		return locomotoras.all{ locomotora => locomotora.calcularArrastreUtil()== locomotora.peso()*5	}
	}
	
	
	
}
