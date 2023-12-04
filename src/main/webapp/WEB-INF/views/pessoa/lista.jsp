<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Pessoa</title>
<c:import url="../componentes/cabecalho.jsp" />
</head>
<body>
	<div class="container">
		<div class="card border-light mb-3">
			<div class="card-header">Listagem de Pessoas</div>
			<div class="card-body">
				<table class="table datatable" id="datatable">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Nome</th>
							<th scope="col">Tipo</th>
							<th scope="col">Email</th>
							<th scope="col">Telefone</th>
							<th scope="col">Ações</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="pessoa" items="${pessoas}">
							<tr>
								<td scope="row">${pessoa.id}</td>
								<td>${pessoa.nome}</td>
								<td>${pessoa.tipo}</td>
								<td>${pessoa.email}</td>
								<td>${pessoa.telefone}</td>
								<td><a
									href='<c:url value="/pessoa/exibe?id=${pessoa.id}" />'
									class="btn btn-info btn-sm" data-toggle="tooltip"
									data-bs-placement="bottom" title="Exibir"><i
										class="bi bi-eye"></i></a> <a
									href='<c:url value="/pessoa/edita?id=${pessoa.id}" />'
									class="btn btn-warning btn-sm" data-toggle="tooltip"
									data-bs-placement="bottom" title="Editar"><i
										class="bi bi-pencil-square"></i></a>
									<button type="button" class="btn btn-danger btn-sm"
										data-toggle="tooltip" data-bs-placement="bottom"
										title="Excluir" data-bs-toggle="modal"
										data-bs-target="#modal${pessoa.id}">
										<i class="bi bi-trash"></i>
									</button>
									<div class="modal fade" id="modal${pessoa.id}" tabindex="-1">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Exclusão do pessoa</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close">
														<span aria-hidden="true"></span>
													</button>
												</div>
												<div class="modal-body">
													<p>
														Deseja realmente excluir seus dados <br>ID
														(${pessoa.id}) -> ${pessoa.nome}, ${pessoa.tipo},
														${pessoa.email}, ${pessoa.telefone}?
													</p>
												</div>
												<div class="modal-footer">
													<a href="<c:url value="/pessoa/remove?id=${pessoa.id}" />"
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
			<a href='<c:url value="/pessoa/novo" />'
				class="btn btn-primary btn-lg"><i class="bi bi-plus-circle"></i>
				Cadastrar</a>
		</div>
	</div>
		
</body>
<c:import url="../componentes/rodape.jsp" />
</html>
