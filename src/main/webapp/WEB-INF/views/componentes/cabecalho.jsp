<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- https://www.w3schools.com/tags/tag_meta.asp -->
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<link rel="shortcut icon"
	href="https://i.pinimg.com/originals/a7/35/bd/a735bd89df1a0fb4c80ffa583585943e.jpg"
	type="image/x-icon">

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap-icons/bootstrap-icons.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/data-table/css/datatables.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/sistema.css" />">

<body>
	<div></div>
	<header>
		<nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
			<div class="container-fluid">
				<a class="navbar-brand text-white" href="<c:url value="/" />">Gereciamento</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarColor02"
					aria-controls="navbarColor02" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarColor02">
					<ul class="navbar-nav me-auto">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-white"
							data-bs-toggle="dropdown" href="#" role="button"
							aria-haspopup="true" aria-expanded="false">Cadastro</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<c:url value="/pessoa/novo" />">Pessoa</a>
								<a class="dropdown-item" href="<c:url value="/item/novo" />">Item</a>
							</div>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-white"
							data-bs-toggle="dropdown" href="#"
							role"button" aria-haspopup="true" aria-expanded="false" class="dropdown-item" href="<c:url value="/solicitacao/novo" />">Solicitação</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<c:url value="/solicitacao/novo" />">Solicitação</a> 
							</div>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-white"
							data-bs-toggle="dropdown" href="#"
							role"button" aria-haspopup="true" aria-expanded="false">Relatórios</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<c:url value="/pessoa/lista" />">Pessoa</a>
								<a class="dropdown-item" href="<c:url value="/item/lista" />">Item</a>
								<a class="dropdown-item"
									href="<c:url value="/solicitacao/lista" />">Solicitação</a> 
							</div>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>