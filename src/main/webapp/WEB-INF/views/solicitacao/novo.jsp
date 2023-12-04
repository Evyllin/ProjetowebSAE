<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<script>
        function obterHoraSistema() {
            var agora = new Date();
            var horas = agora.getHours();
            var minutos = agora.getMinutes();

            if (horas < 10) {
                horas = '0' + horas;
            }
            if (minutos < 10) {
                minutos = '0' + minutos;
            }

            var horaFormatada = horas + ':' + minutos;
            document.getElementById('hora_solicitacao').value = horaFormatada;
        }
    </script>

<title>Cadastrar Solicitação</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Solicitação</h1>
		<h5>Preencha o formulário abaixo para
			realizar a solicitação no sistema.</h5>
	</div>
</div>

<main>
	<div class="container">
		<form action="adiciona" method="POST" class="row g-3">

			<security:csrfInput />

			<div class="row mb-6">
			<!-- data_solicitacao -->
			<div class="col-md-6">
				<label for="data_solicitacao" class="col-form-label obrigatorio">Data
					da solicitação</label> <input type="date" class="form-control"
					name="data_solicitacao" required>
			</div>

			<!-- hora_solicitacao -->
                <div class="col-md-6">
                    <label for="hora_solicitacao" class="col-form-label obrigatorio">Hora da solicitação</label>
                    <div class="input-group">
                        <input class="form-control" name="hora_solicitacao" id="hora_solicitacao" placeholder="--:--" required>
                        <button type="button" class="btn btn-secondary" onclick="obterHoraSistema()">Obter Hora</button>
                    </div>
                </div>
            </div>

			<!-- Item -->
			<div class="col-md-6">
				<label for="item" class="col-form-label obrigatorio">Selecione
					o Item</label> <select name="item.id" class="form-select">
					<option value="" disabled selected>Selecione o Item</option>
					<c:forEach var="ite" items="${lista_itens}">
						<option value="${ite.id}">${ite.tipo} - ${ite.nome}</option>
					</c:forEach>
				</select>
			</div>

			<!-- Solicitante -->
			<div class="col-md-6">
				<label for="solicitante" class="col-form-label obrigatorio">Solicitante</label>
				<select name="solicitante.id" class="form-select">
					<option value="" disabled selected>Selecione Solicitante</option>
					<c:forEach var="pessoa" items="${lista_pessoa}">
						<option value="${pessoa.id}">${pessoa.tipo} -
							${pessoa.nome}</option>
					</c:forEach>
				</select>
			</div>

			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-plus-circle"></i> Cadastrar
				</button>
				<button type="reset" class="btn btn-secondary btn-lg">
					<i class="bi bi-trash"></i> Limpar
				</button>
			</div>
		</div>
		</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />