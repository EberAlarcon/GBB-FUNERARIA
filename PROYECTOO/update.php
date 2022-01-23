<?php
	include_once 'conexion.php';

	if(isset($_GET['ID_FAMLIAR'])){
		$ID_FAMLIAR=(int) $_GET['ID_FAMLIAR'];

		$buscar_id=$con->prepare('SELECT * FROM FAMILIAR WHERE ID_FAMLIAR=:ID_FAMLIAR ');
		$buscar_id->execute(array(
			':ID_FAMLIAR'=>$ID_FAMLIAR
		));
		$resultado=$buscar_id->fetch();
	}else{
		header('Location: index.php');
	}


	if(isset($_POST['guardar'])){
        $ID_FAMLIAR= $_GET['ID_FAMLIAR'];
		$NOMBRE_FAMILIAR=$_POST['NOMBRE_FAMILIAR'];
        $APELLIDO_FAMILIAR=$_POST['APELLIDO_FAMILIAR'];
        $CEDULA_FAMILIAR=$_POST['CEDULA_FAMILIAR'];
        $DIRECCION_FAMILIAR=$_POST['DIRECCION_FAMILIAR'];
        $TELEFONO_FAMILIAR=$_POST['TELEFONO_FAMILIAR'];
		

		if(!empty($NOMBRE_FAMILIAR) && !empty($APELLIDO_FAMILIAR) && !empty($CEDULA_FAMILIAR) && !empty($DIRECCION_FAMILIAR) && !empty($TELEFONO_FAMILIAR) ){
			{
				$consulta_update=$con->prepare(' UPDATE FAMILIAR SET  
					NOMBRE_FAMILIAR=:NOMBRE_FAMILIAR,
					APELLIDO_FAMILIAR=:APELLIDO_FAMILIAR,
					CEDULA_FAMILIAR=:CEDULA_FAMILIAR,
					DIRECCION_FAMILIAR=:DIRECCION_FAMILIAR,
					TELEFONO_FAMILIAR=:TELEFONO_FAMILIAR
					WHERE ID_FAMLIAR=:ID_FAMLIAR;'
				);
				$consulta_update->execute(array(
					':NOMBRE_FAMILIAR' =>$NOMBRE_FAMILIAR,
					':APELLIDO_FAMILIAR' =>$APELLIDO_FAMILIAR,
					':CEDULA_FAMILIAR' =>$CEDULA_FAMILIAR,
					':DIRECCION_FAMILIAR' =>$DIRECCION_FAMILIAR,
					':TELEFONO_FAMILIAR' =>$TELEFONO_FAMILIAR,
					':ID_FAMLIAR' =>$ID_FAMLIAR
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
	<title>Editar Cliente</title>
	<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
	<div class="contenedor">
		<h2>Editar Clientes/Familiares</h2>
		<form action="" method="post">
			<div class="form-group">
				<input type="text" name="NOMBRE_FAMILIAR" value="<?php if($resultado) echo $resultado['NOMBRE_FAMILIAR']; ?>" class="input__text">
				<input type="text" name="APELLIDO_FAMILIAR" value="<?php if($resultado) echo $resultado['APELLIDO_FAMILIAR']; ?>" class="input__text">
			</div>
			<div class="form-group">
				<input type="text" name="CEDULA_FAMILIAR" value="<?php if($resultado) echo $resultado['CEDULA_FAMILIAR']; ?>" class="input__text">
				<input type="text" name="DIRECCION_FAMILIAR" value="<?php if($resultado) echo $resultado['DIRECCION_FAMILIAR']; ?>" class="input__text">
			</div>
			<div class="form-group">
				<input type="text" name="TELEFONO_FAMILIAR" value="<?php if($resultado) echo $resultado['TELEFONO_FAMILIAR']; ?>" class="input__text">
			</div>
			<div class="btn__group">
				<a href="index.php" class="btn btn__danger">Cancelar</a>
				<input type="submit" name="guardar" value="Guardar" class="btn btn__primary">
			</div>
		</form>
	</div>
</body>
</html>
