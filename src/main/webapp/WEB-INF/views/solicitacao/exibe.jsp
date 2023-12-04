<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Exibir solicitação</title>
<c:import url="../componentes/cabecalho.jsp" />

<main>
	<div class="container">
		<div class="card border-light mb-3">
			<div class="card-header">Exibir solicitação</div>
			<!-- Table -->
			<div class="card-body">
				<div class="table-responsive">
					<table
						class="table table-striped table-bordered dt-responsive nowrap">
						<tr>
							<th width="30%">ID</th>
							<td>${solicitacao.id}</td>
						</tr>
						<tr>
							<th>Solicitante</th>
							<td>${solicitacao.solicitante.nome}</td>
						</tr>
						
						<tr>
							<th>Devolucao</th>
							<td>${solicitacao.devolucao.nome}</td>
						</tr>
						<tr>
							<th>Data_solicitacao</th>
							<td>${solicitacao.data_solicitacao}</td>
						</tr>
						<tr>
							<th>Hora_solicitacao</th>
							<td>${solicitacao.hora_solicitacao}</td>
						</tr>
						<tr>
							<th>Hora_devolucao</th>
							<td>${solicitacao.hora_devolucao}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div align="center">
			<!-- Cadastrar -->
			<a href="<c:url value="/solicitacao/novo" />"
				class="btn btn-primary btn-lg"><i class="bi bi-plus-circle"></i>
				Cadastrar</a>
			<!-- Editar -->
			<a href="<c:url value="/solicitacao/edita?id=${solicitacao.id}" />"
				class="btn btn-warning btn-lg"><i class="bi bi-pencil-square"></i>
				Editar </a>
			<!-- Excluir -->
			<button type="button" class="btn btn-danger btn-lg"
				data-bs-toggle="modal" data-bs-target="#modal${solicitacao.id}">
				<i class="bi bi-trash"></i>
				Excluir
			</button>
			<c:if test="${solicitacao.devolucao == null}">
				<a href="<c:url value="/solicitacao/devolver?id=${solicitacao.id}" />" class="btn btn-success btn-lg">
				 	Devolver
				 </a>
			</c:if>
			
		</div>
		<!-- Modal -->
		<div class="modal fade" id="modal${solicitacao.id}" tabindex="-1">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Exclusão da solicitacao</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<p>
							Deseja realmente excluir a solicitação <br>ID (${solicitacao.id}) ->
							${solicitacao.data_solicitacao}, ${solicitacao.hora_solicitacao}, ${solicitacao.hora_devolucao}?
						</p>
					</div>
					<div class="modal-footer">
						<a href="<c:url value="/solicitacao/remove?id=${solicitacao.id}" />"
							class="btn btn-danger"> <i class="bi bi-trash"></i> Excluir
						</a>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">
							<i class="bi bi-x"></i>
							Fechar
						</button>
					</div>
				</div>
			</div>
		</div>
		<button class="btn btn-success" onclick="window.history.back()">
			<i class="bi bi-chevron-left"></i>
			Voltar
		</button>
	</div>
</main>
<c:import url="../componentes/rodape.jsp" />