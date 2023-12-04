<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Item</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Cadastrar Item</h1>
		<h5>Preencha o formulário abaixo para
			realizar o cadastro do item no sistema.</h5>
	</div>
</div>

<main>
	<div class="container">
		<form action="adiciona" method="POST" class="row g-3">

			<security:csrfInput />
			<div class="row mb-6">
			<!-- NOME -->
			<div class="col-md-6">
				<label for="nome" class="col-form-label obrigatorio">Nome</label> <input
					type="text" class="form-control" name="nome" autofocus
					MAXLENGTH="255" required>
			</div>
			
			<!-- TIPO -->
			<div class="col-md-6">
				<label for="tipo" class="col-form-label obrigatorio">Tipo</label>
					<select name="tipo" class="form-select" aria-label="Default select example">
					<option value="" disabled selected>Selecione um tipo</option>
						<option value="Chave">Chave</option>
						<option value="Equipamento">Equipamento</option>
						<option value="Entretenimento">Entretenimento</option>											
					</select>
			</div>
			</div>

			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-plus-circle"></i>
					Cadastrar
				</button>
				<button type="reset" class="btn btn-secondary btn-lg">
					<i class="bi bi-trash"></i>
					Limpar
				</button>
			</div>

		</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />