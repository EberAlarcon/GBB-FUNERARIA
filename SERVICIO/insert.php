<?php 
	include_once 'conexion.php';
	
	if(isset($_POST['guardar'])){
       
		$DESCRIPCION_SERVICIO=$_POST['DESCRIPCION_SERVICIO'];
		$COSTO_SERVICIO=$_POST['COSTO_SERVICIO'];
		$HABILITADO_SERVICIO=$_POST['HABILITADO_SERVICIO'];
		$IMAGEN_SERVICIO=$_POST['IMAGEN_SERVICIO'];
	

		if(!empty($DESCRIPCION_SERVICIO) && !empty($COSTO_SERVICIO) && !empty($HABILITADO_SERVICIO) && !empty($IMAGEN_SERVICIO)  ){
			{
				$consulta_insert=$con->prepare('INSERT INTO SERVICIO ( DESCRIPCION_SERVICIO, COSTO_SERVICIO,HABILITADO_SERVICIO,IMAGEN_SERVICIO) VALUES( :DESCRIPCION_SERVICIO,:COSTO_SERVICIO,:HABILITADO_SERVICIO,:IMAGEN_SERVICIO)');
				$consulta_insert->execute(array(
                    
					':DESCRIPCION_SERVICIO' =>$DESCRIPCION_SERVICIO,
					':COSTO_SERVICIO' =>$COSTO_SERVICIO,
					':HABILITADO_SERVICIO' =>$HABILITADO_SERVICIO,
					':IMAGEN_SERVICIO' =>$IMAGEN_SERVICIO,
					
				));
				header('Location: index.php');
			}
		}else{
			echo "<script> alert('Los campos estan vacios');</script>";
		}

	}


?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Nuevo Servicio</title>
	<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
	<div class="contenedor">
		<h2>Ingresar Servicio</h2>
		<form action="" method="post">
			
                
			<p>Nombre: <input type="text" name="DESCRIPCION_SERVICIO" size="300" class="input__text"></p>
							
			<p>Costo: <input type="number"  name="COSTO_SERVICIO" step="0.1" size="300" class="input__text"></p>	
			
							
			<p>Disponible/Agotado:
			<select name="HABILITADO_SERVICIO" class="input__mole">
			
			<option selected value="0"> Elige una opción </option>
   <option value="1">Agotado</option> 
   <option value="2">Disponible</option> 
   
</select></p>



           <p>Imagen: <input type="file" name="IMAGEN_SERVICIO" class="input__mol" download></p>	
						
					
						
			
			<div class="btn__group">
				<a href="index.php" class="btn btn__danger">Cancelar</a>
				<input type="submit" name="guardar" value="Guardar" class="btn btn__primary">
			</div>
		</form>
	</div>
</body>
</html>
