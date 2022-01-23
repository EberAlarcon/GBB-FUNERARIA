<?php
	include_once 'conexion.php';

	if(isset($_GET['ID_TIPOSERVICIO'])){
		$ID_TIPOSERVICIO=(int) $_GET['ID_TIPOSERVICIO'];

		$buscar_id=$con->prepare('SELECT * FROM SERVICIO WHERE ID_TIPOSERVICIO=:ID_TIPOSERVICIO ');
		$buscar_id->execute(array(
			':ID_TIPOSERVICIO'=>$ID_TIPOSERVICIO
		));
		$resultado=$buscar_id->fetch();
	}else{
		header('Location: index.php');
	}


	if(isset($_POST['guardar'])){

        $ID_TIPOSERVICIO= $_GET['ID_TIPOSERVICIO'];
		$DESCRIPCION_SERVICIO=$_POST['DESCRIPCION_SERVICIO'];
        $COSTO_SERVICIO=$_POST['COSTO_SERVICIO'];
        $HABILITADO_SERVICIO=$_POST['HABILITADO_SERVICIO'];
        $IMAGEN_SERVICIO=$_POST['IMAGEN_SERVICIO'];
       
		

		if(!empty($DESCRIPCION_SERVICIO) && !empty($COSTO_SERVICIO) && !empty($HABILITADO_SERVICIO) && !empty($IMAGEN_SERVICIO)  ){
			{
				$consulta_update=$con->prepare(' UPDATE SERVICIO SET  
					DESCRIPCION_SERVICIO=:DESCRIPCION_SERVICIO,
					COSTO_SERVICIO=:COSTO_SERVICIO,
					HABILITADO_SERVICIO=:HABILITADO_SERVICIO,
					IMAGEN_SERVICIO=:IMAGEN_SERVICIO					
					WHERE ID_TIPOSERVICIO=:ID_TIPOSERVICIO;'
				);
				$consulta_update->execute(array(
					':DESCRIPCION_SERVICIO' =>$DESCRIPCION_SERVICIO,
					':COSTO_SERVICIO' =>$COSTO_SERVICIO,
					':HABILITADO_SERVICIO' =>$HABILITADO_SERVICIO,
					':IMAGEN_SERVICIO' =>$IMAGEN_SERVICIO,					
					':ID_TIPOSERVICIO' =>$ID_TIPOSERVICIO
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
	<title>Editar Servicio</title>
	<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
	<div class="contenedor">
		<h2>Editar Servicio</h2>
		<form action="" method="post">
			<div class="form-group">
				<input type="text" name="DESCRIPCION_SERVICIO" value="<?php if($resultado) echo $resultado['DESCRIPCION_SERVICIO']; ?>" class="input__text">
				<input type="number" name="COSTO_SERVICIO" step="0.1" value="<?php if($resultado) echo $resultado['COSTO_SERVICIO']; ?>" class="input__text">
			</div>
			<div class="form-group">
				<input type="text" name="HABILITADO_SERVICIO" value="<?php if($resultado) echo $resultado['HABILITADO_SERVICIO']; ?>" class="input__text">
				<input type="file" name="IMAGEN_SERVICIO" value="<?php if($resultado) echo $resultado['IMAGEN_SERVICIO']; ?>" class="input__text">
			</div>
			
			<div class="btn__group">
				<a href="index.php" class="btn btn__danger">Cancelar</a>
				<input type="submit" name="guardar" value="Guardar" class="btn btn__primary">
			</div>
		</form>
	</div>
</body>
</html>
