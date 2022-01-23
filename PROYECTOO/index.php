<?php
	include_once 'conexion.php';

	$sentencia_select=$con->prepare('SELECT *FROM FAMILIAR ORDER BY ID_FAMLIAR DESC');
	$sentencia_select->execute();
	$resultado=$sentencia_select->fetchAll();

	// metodo buscar
	if(isset($_POST['btn_buscar'])){
		$buscar_text=$_POST['buscar'];
		$select_buscar=$con->prepare('
			SELECT * FROM FAMILIAR WHERE APELLIDO_FAMILIAR LIKE :campo OR CEDULA_FAMILIAR LIKE :campo;'
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
	<title>FUNERARIA/Ingreso de Familiares</title>
	<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
	<h1 >Funeraria "La Eternidad"</h1>
	<div class="contenedor">
		<h2> Ingreso de Clientes/Familiares</h2>
		<div class="barra__buscador">
			<form action="" class="formulario" method="post">
				<input type="text" name="buscar" placeholder="Buscar por Apellidos o DNI" 
				value="<?php if(isset($buscar_text)) echo $buscar_text; ?>" class="input__text">
				<input type="submit" class="btn" name="btn_buscar" value="Buscar">
				<a href="insert.php" class="btn btn__nuevo">Nuevo</a>
			</form>
		</div>
		<table>
			<tr class="head">
				<td>CÓDIGO</td>
				<td>NOMBRES</td>
				<td>APELLIDOS</td>
				<td>DNI</td>
				<td>DIRECCIÓN</td>
				<td>TELÉFONO</td>
				<td colspan="2">ACCIÓN</td>
			</tr>
			<?php foreach($resultado as $fila):?>
				<tr >
					<td><?php echo $fila['ID_FAMLIAR']; ?></td>
					<td><?php echo $fila['NOMBRE_FAMILIAR']; ?></td>
					<td><?php echo $fila['APELLIDO_FAMILIAR']; ?></td>
					<td><?php echo $fila['CEDULA_FAMILIAR']; ?></td>
					<td><?php echo $fila['DIRECCION_FAMILIAR']; ?></td>
					<td><?php echo $fila['TELEFONO_FAMILIAR']; ?></td>

                    <!-- ID_FAMLIAR iba id despues del upadte -->
					<td><a href="update.php?ID_FAMLIAR=<?php echo $fila['ID_FAMLIAR']; ?>"  class="btn__update" >Editar</a></td>
					<td><a href="delete.php?ID_FAMLIAR=<?php echo $fila['ID_FAMLIAR']; ?>" class="btn__delete">Eliminar</a></td>
				</tr>
			<?php endforeach ?>

		</table>
	</div>
</body>
</html>