<?php 
	include_once 'conexion.php';
	
	if(isset($_POST['guardar'])){
       
		$NOMBRE_FAMILIAR=$_POST['NOMBRE_FAMILIAR'];
		$APELLIDO_FAMILIAR=$_POST['APELLIDO_FAMILIAR'];
		$CEDULA_FAMILIAR=$_POST['CEDULA_FAMILIAR'];
		$DIRECCION_FAMILIAR=$_POST['DIRECCION_FAMILIAR'];
		$TELEFONO_FAMILIAR=$_POST['TELEFONO_FAMILIAR'];

		if(!empty($NOMBRE_FAMILIAR) && !empty($APELLIDO_FAMILIAR) && !empty($CEDULA_FAMILIAR) && !empty($DIRECCION_FAMILIAR) && !empty($TELEFONO_FAMILIAR) ){
			{
				$consulta_insert=$con->prepare('INSERT INTO FAMILIAR ( NOMBRE_FAMILIAR, APELLIDO_FAMILIAR,CEDULA_FAMILIAR,DIRECCION_FAMILIAR,TELEFONO_FAMILIAR) VALUES( :NOMBRE_FAMILIAR,:APELLIDO_FAMILIAR,:CEDULA_FAMILIAR,:DIRECCION_FAMILIAR,:TELEFONO_FAMILIAR)');
				$consulta_insert->execute(array(
                    
					':NOMBRE_FAMILIAR' =>$NOMBRE_FAMILIAR,
					':APELLIDO_FAMILIAR' =>$APELLIDO_FAMILIAR,
					':CEDULA_FAMILIAR' =>$CEDULA_FAMILIAR,
					':DIRECCION_FAMILIAR' =>$DIRECCION_FAMILIAR,
					':TELEFONO_FAMILIAR' =>$TELEFONO_FAMILIAR
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
	<title>Nuevo Cliente</title>
	<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
	<div class="contenedor">
		<h2>Ingresar Clientes/Familiares</h2>
		<form action="" method="post">
			<div class="form-group">
                
				
				<input type="text" name="CEDULA_FAMILIAR" placeholder="Número de Identificación" class="input__text">
				
			</div>
			<div class="form-group">
			    <input type="text" name="NOMBRE_FAMILIAR" placeholder="Nombres" class="input__text">
				<input type="text" name="DIRECCION_FAMILIAR" placeholder="Dirección" class="input__text">
				
				
			</div>
			<div class="form-group">
			<input type="text" name="APELLIDO_FAMILIAR" placeholder="Apellidos" class="input__text">
			<input type="text" name="TELEFONO_FAMILIAR" placeholder="Número de Teléfono/Celular" class="input__text">
			
			</div>
			<div class="btn__group">
				<a href="index.php" class="btn btn__danger">Cancelar</a>
				<input type="submit" name="guardar" value="Guardar" class="btn btn__primary">
			</div>
		</form>
	</div>
</body>
</html>
