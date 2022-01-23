<?php
	include_once 'conexion.php';

	$sentencia_select=$con->prepare('SELECT *FROM SERVICIO ORDER BY ID_TIPOSERVICIO DESC');
	$sentencia_select->execute();
	$resultado=$sentencia_select->fetchAll();

	// metodo buscar
	if(isset($_POST['btn_buscar'])){
		$buscar_text=$_POST['buscar'];
		$select_buscar=$con->prepare('
			SELECT * FROM SERVICIO WHERE DESCRIPCION_SERVICIO LIKE :campo;'
		);

		$select_buscar->execute(array(
			':campo' =>"%".$buscar_text."%"
		));

		$resultado=$select_buscar->fetchAll();

	}

?>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>FUNERARIA/Ingreso de Servicios</title>
	<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
	<h1 >Funeraria "La Eternidad"</h1>
	<div class="contenedor">
		<h2> Ingreso de Servicio</h2>
		<div class="barra__buscador">
			<form action="" class="formulario" method="post">
				<input type="text" name="buscar" placeholder="Buscar por Nombre del Servicio" 
				value="<?php if(isset($buscar_text)) echo $buscar_text; ?>" class="input__text">
				<input type="submit" class="btn" name="btn_buscar" value="Buscar">
				<a href="insert.php" class="btn btn__nuevo">Nuevo</a>
			</form>
		</div>
		<table>
			<tr class="head">
				<td>CÓDIGO</td>
				<td>NOMBRE</td>
				<td>COSTO DEL SERVICIO</td>
				<td>DISPONIBLE / AGOTADO</td>
				<td>IMAGEN</td>

				<td colspan="2">ACCIÓN</td>
			</tr>
			<?php foreach($resultado as $fila):?>
				<tr >
					<td><?php echo $fila['ID_TIPOSERVICIO']; ?></td>
					<td><?php echo $fila['DESCRIPCION_SERVICIO']; ?></td>
					<td><?php echo $fila['COSTO_SERVICIO']; ?></td>
					<td><?php echo $fila['HABILITADO_SERVICIO']; ?></td>
					<td><?php echo $fila['IMAGEN_SERVICIO']; ?></td>
					

                    <!-- ID_TIPOSERVICIO iba id despues del upadte -->
					<td><a href="update.php?ID_TIPOSERVICIO=<?php echo $fila['ID_TIPOSERVICIO']; ?>"  class="btn__update" >Editar</a></td>
					<td><a href="delete.php?ID_TIPOSERVICIO=<?php echo $fila['ID_TIPOSERVICIO']; ?>" class="btn__delete">Eliminar</a></td>
				</tr>
			<?php endforeach ?>

		</table>
	</div>
</body>
</html>