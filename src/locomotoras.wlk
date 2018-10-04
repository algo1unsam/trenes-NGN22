class Locomotora {
	
	var property peso
	var property pesoMaximoArrastre // de arraste
	var property velocidadMaxima
	
	
	method calcularArrastreUtil()
	{
		return pesoMaximoArrastre - peso
	}
	
	
}
