<?php 

	include_once 'conexion.php';
	if(isset($_GET['ID_FAMLIAR'])){
		$ID_FAMLIAR=(int) $_GET['ID_FAMLIAR'];
		$delete=$con->prepare('DELETE FROM FAMILIAR WHERE ID_FAMLIAR=:ID_FAMLIAR');
		$delete->execute(array(
			':ID_FAMLIAR'=>$ID_FAMLIAR
		));
		header('Location: index.php');
	}else{
		header('Location: index.php');
	}
 ?>