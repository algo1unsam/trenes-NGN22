class VagonPersonas {
	
	
	var property largoTotal = 0
	
	var property largoUtil = 0
	
	var cantidadDePasajeros = 0
	
		
	//pre se calculo la cantidad de pasajeros maxima pasajeros
	// carga se le asigno carga maxima
	// post retorna el peso del vagon 
	method peso()
	{	
		 return self.pesoConPasajeros() 		
	}
	
	
	//pre se calculo la cantidad de 
	//
	//post  retorna la cantidad pasajeros maxima * 80
	method pesoConPasajeros()
	{
		return self.calcularPasajerosMaximo() * 80
	}
	
	
	//post verf el largo util es > 2.5
	method esLargoUtil()
	{
		return largoUtil > 2.5
	}
	
	
	//post retorna la cantidad de pasajeros maxima segun largo util
	method calcularPasajerosMaximo()
	{
		if(self.esLargoUtil())
			{
				cantidadDePasajeros = largoTotal * 10
			}
		else cantidadDePasajeros = largoTotal * 8
		
		return cantidadDePasajeros
	}
	
	
	//post verd si el peso del vagon menos 2500
	method esLiviano()
	{
		return self.peso() < 2500
	}
	
			
}



class VagonCarga
{
	var property pesoDeCarga = null
	
		
	//pre se asigno peso de vagon carga
	//post al peso de carga maximo asignado le suma la constante
	method vagonCarga()
	{
		return pesoDeCarga + 160
	}
	
}










