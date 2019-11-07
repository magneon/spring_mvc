<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detalhe da Conta</title>
</head>
<body>

	<form action="alteraConta" method="post">
	
		<input type="hidden" name="id" value="${conta.id}">
	
		Descrição:<br/>
		<textarea name="descricao" rows="5" cols="100">${conta.descricao}</textarea><br/>
		
		Valor:<input type="text" name="valor" value="${conta.valor}"/><br/>
		
		Tipo:<br/>
		<select name="tipo">
			<option value="ENTRADA" ${conta.tipo=='ENTRADA' ? 'selected' : ''}>Entrada</option>
			<option value="SAIDA" ${conta.tipo=='SAIDA' ? 'selected' : ''}>Saida</option>
		</select><br/><br/>
		
		Pago? <input type="checkbox" name="paga" ${conta.paga?'checked':''}/><br/>
		
		Data de Pagamento: <input type="text" name="dataPagamento" value='<fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy" />' />
		
		<input type="submit" value="Alterar">	
	
	</form>

</body>
</html>