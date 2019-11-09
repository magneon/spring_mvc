<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contas</title>

<script src="resources/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">

	function contaPaga(resposta) {
		alert("Conta paga com sucesso!");
	}

	function pagaAgora(id) {
		$.get("pagaConta?id=" + id, contaPaga);
	}

</script>

</head>
<body>

	<table>
		<tr>
			<th>Código</th>
			<th>Descrição</th>
			<th>Valor</th>
			<th>Tipo</th>
			<th>Paga?</th>
			<th>Data do Pagamento</th>
			<th>Ações</th>
		</tr>
		<c:forEach items="${contas}" var="conta">
			<tr>
				<td>${conta.id}</td>
				<td>${conta.descricao}</td>
				<td>${conta.valor}</td>
				<td>${conta.tipo}</td>
				<td>
					<c:choose>
						<c:when test="${conta.paga}">
							Paga
						</c:when>
						<c:otherwise>
							Não paga
						</c:otherwise>
					</c:choose>					
				</td>
				<td>
					<fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy" />
				</td>
				<td>
					<a href="mostraConta?id=${conta.id}">Alterar</a>
					| <a href="removeConta?id=${conta.id}">Remover</a>
					<c:choose>
						<c:when test="${conta.paga eq false}">
							| <a href="#" onclick="pagaAgora(${conta.id});">Pagar</a>
						</c:when>
					</c:choose> 
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<br/>
	
	<a href="logout">Sair</a>
	
</body>
</html>