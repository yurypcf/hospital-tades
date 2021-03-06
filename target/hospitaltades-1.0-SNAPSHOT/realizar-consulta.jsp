<!DOCTYPE html>
<%-- 
    Document   : lista-pacientes
    Created on : 27/09/2018, 21:02:09
    Author     : Yury Cavalcante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ínicio</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link type="text/css" rel="stylesheet" href="client/css/paciente-cadastro.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Kodchasan:400,600" rel="stylesheet">

    </head>
    <body>
        <div id="main-wrapper">
            <div id="sidebar-container">
                <div id="user-container">
                    <div class="profile-pic-circle">
                        <img src="client/imgs/profile.svg" alt="Ícone de Perfil" class="icon-profile-pic">
                    </div>
                    <h3>${usuarioNome}</h3>
                    <h4>${usuarioCargo}</h4>

                </div>


                <c:url var="patientsLink" value="PacienteControllerServlet">
                    <c:param name="command" value="READ" />
                </c:url>

                <c:url var="medicsLink" value="MedicoControllerServlet">
                    <c:param name="command" value="READ" />
                </c:url>

                <c:url var="attendantsLink" value="AtendenteControllerServlet">
                    <c:param name="command" value="READ" />
                </c:url>

                <c:url var="remediesLink" value="RemedioControllerServlet">
                    <c:param name="command" value="READ" />
                </c:url>

                <c:url var="usersLink" value="UsuarioControllerServlet">
                    <c:param name="command" value="READ" />
                </c:url>

                <c:url var="createAppointment" value="ConsultaControllerServlet?command=CREATE+APPOINTMENT">
                </c:url>

                <c:url var="homeLink" value="home.jsp" />


                <div id="menu-container">
                    <hr style="margin: 8px;">
                    <c:if test="${usuarioCargo == 'Atendente'}">
                        <div class="menu-item"><i class="fas fa-stethoscope" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                            <a href="${createAppointment}" style="text-decoration: none; color: #4BB543; font-weight: bolder">Marcar Consulta</a>
                        </div>
                    </c:if>

                    <c:if test="${usuarioCargo == 'Medico'}">
                        <div class="menu-item"><i class="fas fa-stethoscope" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                            <a href="${createAppointment}" style="text-decoration: none; color: #4BB543; font-weight: bolder">Consultas</a>
                        </div>
                    </c:if>

                    <c:if test="${usuarioCargo == 'Atendente'}">
                        <div class="menu-item"><i class="fas fa-stethoscope" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                            <a href="${createAppointment}" style="text-decoration: none; color: #4BB543; font-weight: bolder">Marcar Consulta</a>
                        </div>
                    </c:if>

                    <div class="menu-item"><i class="fas fa-user-injured" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                        <a href="${patientsLink}" style="text-decoration: none; color: inherit;">Pacientes</a>
                    </div>

                    <c:if test="${usuarioCargo == 'Medico' || usuarioCargo == 'Admin'}">
                        <div class="menu-item"><i class="fas fa-stethoscope" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                            <a href="${medicsLink}" style="text-decoration: none; color: inherit;">Médicos</a>
                        </div>
                    </c:if>

                    <c:if test="${usuarioCargo == 'Atendente' || usuarioCargo == 'Admin'}">
                        <div class="menu-item"><i class="fas fa-user-tie" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                            <a href="${attendantsLink}" style="text-decoration: none; color: inherit;">Atendentes</a>
                        </div>
                    </c:if>


                    <div class="menu-item"><i class="fas fa-box-open" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                        <a href="${remediesLink}" style="text-decoration: none; color: inherit;">Estoque</a>
                    </div>

                    <c:if test="${usuarioCargo == 'Admin'}">
                        <div class="menu-item"><i class="fas fa-users" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                            <a href="${usersLink}" style="text-decoration: none; color: inherit;">Usuários</a>
                        </div>
                    </c:if>

                    <c:if test="${usuarioCargo == 'Admin'}">
                        <div class="menu-item"><i class="fas fa-file-alt" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                            Relatórios
                        </div>
                    </c:if>

                    <div class="menu-item">
                        <form name="logoutform" action="UsuarioControllerServlet" method="POST">
                            <input type="hidden" name="command" value="LOGOUT">
                            <button type="submit" name="logout" class="logout-buton"><i class="fas fa-sign-out-alt" style="padding-right: 12px; color: #fff;"></i>Sair</button>
                        </form>
                    </div>

                </div>
            </div>
            <div id="content-wrapper">
                <div id="topbar-container">
                    <div class="main-title"><a href="${homeLink}"><i class="fas fa-hospital-alt" style="padding-right: 20px; color: #FA4860;"></i>hospital tades</a></div>
                    <div id="row"></div>
                </div>
                <div id="content-container">
                    <div class="title-session">
                        <h3>Realizando Consulta</h3>
                    </div>
                    <div class="form-session">
                        <form action="ConsultaControllerServlet" method="POST">

                            <input type="hidden" name="command" value="UPDATE ATTENDED APPOINTMENT" />

                            <input type="hidden" name="consultaId" value="${CONSULTA.idConsulta}" />

                            <div style="display: flex; align-items: center;">
                                    <h3 style="font-weight: bolder; color:#545454">Paciente: </h3><span style="color:#545454">${CONSULTA.nomePaciente}</span>
                            </div>
                            <div style="display: flex; align-items: center;">
                                    <h3 style="font-weight: bolder; color:#545454">Motivo: </h3><span style="color:#545454">${CONSULTA.motivo}</span>
                            </div>
                            <div style="display: flex; align-items: center;">
                                    <h3 style="font-weight: bolder; color:#545454">Data: </h3><span style="color:#545454"><fmt:formatDate value="${CONSULTA.data}" type="both" pattern="dd/MM/yyyy" dateStyle="full"/></span>
                            </div>

<hr/>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="obsMedica">Observações médicas</label>
                                    <textarea class="form-control" name="obsMedica" placeholder="Insira informações sobre o ocorrido na consulta"></textarea>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="idRemedio">Remédio?</label>
                                    <select class="form-control-select" name="idRemedio">
                                        <c:forEach var="remedio" items="${REMEDIOS}">
                                            <option value="${remedio.idRemedio}">${remedio.nome}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="qtdRemedio">Quantidade</label>
                                    <input type="number" class="form-control" name="qtdRemedio" />
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <input type="submit" value="Finalizar Atendimento" class="btn-save" />
                                </div>
                            </div>

                        </form>
                    </div>
                    <div style="clear: both;"></div>

                    <p style="padding: 0px 410px;">
                        <a href="ConsultaControllerServlet">Voltar a lista de Consultas</a>
                    </p>


                </div>
            </div>
        </div>
    </body>
</html>
