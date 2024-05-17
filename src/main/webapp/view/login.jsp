<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../http/https.jsp"%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css"/>      
        <script type="text/javascript">
            $(document).ready(function () {
                $("#ValidarEnvio").validate({
                    rules: {
                        usuario: {
                            required: {
                                depends: function () {
                                    $(this).val($.trim($(this).val()));
                                    return true;
                                }
                            }
                        },
                        clave: {
                            required: {
                                depends: function () {
                                    $(this).val($.trim($(this).val()));
                                    return true;
                                }
                            }
                        },
                        acceso: {required: true}
                    },
                    messages: {
                        usuario: {required: "CAMPO OBLIGATORIO"},
                        clave: {required: "CAMPO OBLIGATORIO"},
                        acceso: {required: "CAMPO OBLIGATORIO"}
                    },
                    errorElement: "span"
                });
            });
        </script>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/login" method="post" id="ValidarEnvio">
            <div class="container mt-5 col-md-3">
                <div class="card border-info">
                    <div class="card card-header text-center text-white bg-info">INKAS CORPORATION TRAVELS</div>
                    <div class="card card-body">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#acceso"><i class="bi bi-check-all"></i>&nbsp;CONTROL DE ACCESO</a>
                            </li>
                        </ul>
                        <div class="tab-content mt-1">
                            <div class="tab-pane container active" id="acceso">
                                <h3 class="text-center" >BIENVENIDO</h3>
                                <div class="row">
                                    <div class="col">
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                                            <input type="text" name="usuario" id="usuario" class="form-control text-uppercase" placeholder="USUARIO"/>
                                            <span class="error"></span>
                                        </div>
                                        <div class="form-text mt-0 mb-2">usuario registrado</div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-text"><i class="bi bi-list-check"></i></span>
                                            <select class="form-select" name="acceso" style="cursor: pointer;">
                                                <option value="">NIVEL DE ACCESO</option>
                                                <option value="SUPERVISOR">SUPERVISOR</option>
                                                <option value="ROOT">ROOT</option>
                                            </select>
                                            <span class="error"></span>
                                        </div>
                                        <div class="form-text mt-0 mb-2">seleccione nivel de acceso</div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-text"><i class="bi bi-box-arrow-in-right"></i></span>
                                            <input type="password" name="clave" id="clave" class="form-control text-uppercase" placeholder="CLAVE DE USUARIO" maxlength="8"/>
                                            <span class="error"></span>
                                        </div>
                                        <div class="form-text mt-0 mb-2">clave de acceso</div>
                                    </div>
                                </div>
                                <div>
                                    <div> 
                                        <center><p style="color: red;">${error}</p></center>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer bg-info text-end text-white">
                        <button type="submit" name="accion" id="BtnLogin" value="Acceso" class="btn btn-light btn-sm btnaccion"><i class="bi bi-box-arrow-in-right"></i>&nbsp;LOGIN</button>
                        <button type="reset" class="btn btn-light btn-sm btnaccion"><i class="bi bi-box-arrow-left"></i>&nbsp;LOGOUT</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
