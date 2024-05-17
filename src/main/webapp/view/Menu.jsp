<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../http/https.jsp"%>
        <%@ include file="../File/Files.jsp"%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css"/>  
    </head>
    <script type="text/javascript">
        history.forward();
        MostrarHora();
        function MostrarHora() {
            var myDate = new Date();
            var hours = myDate.getHours();
            var minutes = myDate.getMinutes();
            var seconds = myDate.getSeconds();
            var ampm = hours >= 12 ? 'PM' : 'AM';
            date = new Date();
            //output = String(date.getDate()).padStart(2, '0') + '/' + String(date.getMonth() + 1).padStart(2, '0') + '/' + date.getFullYear();
            if (hours < 10)
                hours = 0 + hours;
            if (minutes < 10)
                minutes = "0" + minutes;
            if (seconds < 10)
                seconds = "0" + seconds;
            var cambioHorarioAMPM;
            if (hours > 12) {
                cambioHorarioAMPM = 12;
            } else {
                cambioHorarioAMPM = 0;
            }
            $("#HoraActual").text((hours - cambioHorarioAMPM) + ":" + minutes + ":" + seconds + " " + ampm);
            setTimeout("MostrarHora()", 1000);
        }
    </script>
    <body>
        <form name="frmMenu" id="frmMenu">
            <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-info" style="border-bottom: solid 2px silver; border-top: solid 1px silver;">
                <div class="container-fluid">
                    <a class="navbar-brand text-white text-center mt-0 mb-0 ml-0 mr-0" href="#">INKAS SRL</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <!-- ADMINISTRACION -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white M1" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="fondocolor"><i class="bi bi-pc-display-horizontal"></i>&nbsp;ADMINISTRACION</span>
                                </a>
                            </li>
                            <!-- COMERCIAL -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="fondocolor"><i class="bi bi-table"></i>&nbsp;COMERCIAL</span>
                                </a>
                            </li>
                            <!-- REGISTROS -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="fondocolor"><i class="bi bi-people-fill"></i>&nbsp;REGISTROS</span>
                                </a>
                            </li>
                            <!-- PERSONAL -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="fondocolor"><i class="bi bi-house-door-fill"></i>&nbsp;PERSONAL</span>
                                </a>
                            </li>
                            <!-- CONFIGURACION -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="fondocolor"><i class="bi bi-cup-straw"></i>&nbsp;CONFIGURACION</span> 
                                </a>
                            </li>
                            <!-- GESTOR DE DATA -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="fondocolor"><i class="bi bi-bookmark-check-fill"></i>&nbsp;GESTOR DE DATA</span>
                                </a>
                            </li>
                            <!-- REPORTES -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="fondocolor"><i class="bi bi-filetype-pdf"></i>&nbsp;REPORTES</span>
                                </a>
                            </li>
                            <!-- COMERCIAL -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="fondocolor"><i class="bi bi-check2-all"></i>&nbsp;PROCESO COMERCIAL</span>
                                </a>
                            </li>
                        </ul>
                        <div>
                            <p class="text-white mb-0 fs-5" id="HoraActual"></p>
                        </div>
                        <div class="dropdown">
                            <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="fondocolor"><i class="bi bi-person-circle"></i>&nbsp;</span>
                            </a>
                            <ul class="dropdown-menu bg-info dropdown-menu-end" aria-labelledby="dropdownMenuLink">
                                <li><h6 class="dropdown-header"><i class="bi bi-chevron-down"></i>&nbsp;USUARIO ACTUAL</h6></li>
                                <li><a class="dropdown-item text-white" href="#"><span class="fondocolorsub"><i class="bi bi-person-bounding-box"></i>&nbsp;USUARIO:&nbsp;</span></a></li>
                                <li><a class="dropdown-item text-white" href="#"><span class="fondocolorsub"><i class="bi bi-check2-square"></i>&nbsp;EMPRESA:&nbsp;</span></a></li>
                                <li><a class="dropdown-item text-white" href="#"><span class="fondocolorsub"><i class="bi bi-box-arrow-down-left"></i>&nbsp;ACCESO:&nbsp;</span></a></li>
                                    <%/*Java*/
                                        Date FechaActual = new Date();
                                        SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");
                                        SimpleDateFormat sfdt = new SimpleDateFormat("hh:mm:ss a");
                                        String FechaSalida = sfd.format(FechaActual);
                                        String HoraSalida = sfdt.format(FechaActual);
                                    %>
                                <li style="color: rgba(172,184,180,0.2);"><hr class="dropdown-divider"></li>
                                <li><h6 class="dropdown-header"><i class="bi bi-chevron-down"></i>&nbsp;CONTROL DE ACCESO</h6></li>
                                <li><a class="dropdown-item text-white" href="#"><span class="fondocolorsub"><i class="bi bi-alarm"></i>&nbsp;HORA:&nbsp;<%=HoraSalida%></span></a></li>
                                <li><a class="dropdown-item text-white" href="#"><span class="fondocolorsub"><i class="bi bi-calendar-date"></i>&nbsp;FECHA:&nbsp;<%=FechaSalida%></span></a></li>
                                <li style="color: rgba(172,184,180,0.2);"><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-white" href="${pageContext.request.contextPath}/logout"><span class="fondocolorsub"><i class="bi bi-box-arrow-right"></i>&nbsp;LOG OUT</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
            <nav class="fixed-bottom bg-info" style="border-top: solid 4px silver;">
                <div class="text-center text-white">
                    <span class="text-white fs-5 p-1">INKAS CORPORATION TRAVELS AND EVENTS SRL</span><br/>
                    <span class="text-white fs-6">EL MIRADOR B-14 CAYMA AREQUIPA PERU</span>
                </div>
            </nav>
            <div style="margin-left: 1px; margin-right: 1px; margin-top: 1px; margin-bottom: 1px; height: 900px;">
                <iframe name="marco" style=" height: 100%; width: 100%; border: none;"></iframe>
            </div>    
        </form> 
    </body>
</html>
