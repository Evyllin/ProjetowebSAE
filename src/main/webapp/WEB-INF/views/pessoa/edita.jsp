<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar seus dados</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Editar seus dados</h1>
		<h5>Preencha o formulário abaixo para
			realizar a alteração dos seus dados no sistema.</h5>
	</div>
</div>

<main>
	<div class="container">
		<form action="altera" method="POST" class="row g-3">

			<security:csrfInput />

			<div class="row mb-6">
			<!-- ID -->
			<input type="hidden" name="id" value="${pessoa.id}" required>

			<!-- NOME -->
			<div class="col-md-6">
				<label for="nome" class="col-form-label obrigatorio">Nome</label> <input
					type="text" class="form-control" name="nome" autofocus
					MAXLENGTH="255" required value="${pessoa.nome}">
			</div>

			<!-- TIPO -->
			<div class="col-md-6">
				<label for="tipo" class="col-form-label obrigatorio">Tipo</label> <select
					name="tipo" class="form-select" aria-label="Default select example">
					<option value="Aluno">Aluno</option>
					<option value="Servidor">Servidor</option>
					<option value="Terceirizado">Terceirizado</option>
				</select>
			</div>

			<!-- TELEFONE -->
			<div class="col-md-6">
				<label for="telefone" class="col-form-label">Telefone</label> <input
					type="tel" class="form-control" name="telefone" autofocus
					maxlength="14" pattern="\([0-9]{2}\) [0-9]{4,5}-[0-9]{4}"
					title="Informe um número de telefone válido (ex: (00) 12345-6789)"
					placeholder="(00) 12345-6789" value="${pessoa.telefone}">
			</div>

			<!-- EMAIL -->
			<div class="col-md-6">
				<label for="nome" class="col-form-label obrigatorio">Email</label> <input
					type="text" class="form-control" name="email" autofocus
					MAXLENGTH="255" required value="${pessoa.email}">
			</div>
			</div>


			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-arrow-clockwise"></i> Atualizar
				</button>
				<a href="<c:url value="/solicitacao/lista" />"
					class="btn btn-secondary btn-lg"> <i class="bi bi-x"></i>
					Cancelar
				</a>
			</div>

		</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js">
</script>
<script>
	$(document).ready(function() {
		$('input[name="telefone"]').mask('(00) 00000-0000');
	});
</script>