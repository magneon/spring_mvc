<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adicionar Contas</title>
</head>
<body>

	<h3>Adicionar Contas</h3>
	<form action="adicionaConta" method="post">
	
		Descrição:<br/>
		<textarea name="descricao" rows="5" cols="100"></textarea><br/>
		<form:errors path="conta.descricao"/><br/>
		
		Valor:<input type="text" name="valor"/><br/>
		
		Tipo:<br/>
		<select name="tipo">
			<option value="ENTRADA">Entrada</option>
			<option value="SAIDA">Saida</option>
		</select><br/><br/>
		
		<input type="submit" value="Adicionar">		
	
	</form>

</body>
</html>