<?php 

	include_once 'conexion.php';
	if(isset($_GET['ID_TIPOSERVICIO'])){
		$ID_TIPOSERVICIO=(int) $_GET['ID_TIPOSERVICIO'];
		$delete=$con->prepare('DELETE FROM SERVICIO WHERE ID_TIPOSERVICIO=:ID_TIPOSERVICIO');
		$delete->execute(array(
			':ID_TIPOSERVICIO'=>$ID_TIPOSERVICIO
		));
		header('Location: index.php');
	}else{
		header('Location: index.php');
	}
 ?>