<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Solicitação</title>
<c:import url="../componentes/cabecalho.jsp" />
</head>
<body>
	<div class="container">
		<div class="card border-light mb-3">
			<div class="card-header">Listagem de Solicitações</div>
			<div class="card-body">
				<table class="table datatable" id="datatable">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Solicitante</th>
							<th scope="col">Tipo</th>
							<th scope="col">Item</th>
							<th scope="col">Data solicitação</th>
							<th scope="col">Hora solicitação</th>
							<th scope="col">Hora devolução</th>
							<th scope="col">Ações</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="solicitacao" items="${solicitacao}">
							<tr >
								<td scope="row">${solicitacao.id}</td>
								<td>${solicitacao.solicitante.nome }</td>
								<td>${solicitacao.solicitante.tipo }</td>
								<td>${solicitacao.item.nome }</td>
								<td><fmt:formatDate value="${solicitacao.data_solicitacao}" pattern="dd/MM/yyyy"/></td>
								<td><fmt:formatDate value="${solicitacao.hora_solicitacao}" pattern="HH:mm"/></td>
								<td><fmt:formatDate value="${solicitacao.hora_devolucao}" pattern="HH:mm"/></td>
								<td><a
									href='<c:url value="/solicitacao/exibe?id=${solicitacao.id}" />'
									class="btn btn-info btn-sm" data-toggle="tooltip"
									data-bs-placement="bottom" title="Exibir"><i
										class="bi bi-eye"></i></a> <a
									href='<c:url value="/solicitacao/edita?id=${solicitacao.id}" />'
									class="btn btn-warning btn-sm" data-toggle="tooltip"
									data-bs-placement="bottom" title="Editar"><i
										class="bi bi-pencil-square"></i></a>
									<button type="button" class="btn btn-danger btn-sm"
										data-toggle="tooltip" data-bs-placement="bottom"
										title="Excluir" data-bs-toggle="modal"
										data-bs-target="#modal${solicitacao.id}">
										<i class="bi bi-trash"></i>
									</button>
									<div class="modal fade" id="modal${solicitacao.id}" tabindex="-1">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Exclusão da solicitacao</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close">
														<span aria-hidden="true"></span>
													</button>
												</div>
												<div class="modal-body">
													<p>
														Deseja realmente excluir a solicitação <br>ID
														(${solicitacao.id}) -> ${solicitacao.data_solicitacao}, ${solicitacao.hora_solicitacao},
														${solicitacao.hora_devolucao}?
													</p>
												</div>
												<div class="modal-footer">
													<a href="<c:url value="/solicitacao/remove?id=${solicitacao.id}" />"
														class="btn btn-danger"> <i class="bi bi-trash"></i>
														Excluir
													</a>
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">
														<i class="bi bi-x"></i> Fechar
													</button>
												</div>
											</div>
										</div>
									</div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div align="center">
			<a href='<c:url value="/solicitacao/novo" />'
				class="btn btn-primary btn-lg"><i class="bi bi-plus-circle"></i>
				Cadastrar</a>
		</div>
	</div>
		
</body>
<c:import url="../componentes/rodape.jsp" />
</html>
