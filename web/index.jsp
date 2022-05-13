<%-- 
    Document   : index
    Created on : 13/05/2022, 08:38:02
    Author     : sala305b
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <title>Cadastro com Ajax</title>
        <style type="text/css">
            body{
                background-color: black;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Cadastre seu Endereço</h1>
            <br/>
            <br/>
            <div class="row">
                <div class="col-2">
                    <label for="textcep">
                        CEP:
                    </label>
                    <input id="txtcep"
                           name="cep"
                           placeholder="Informe o seu CEP aqui.."
                           type="text"
                           class="form-control">
                </div>
            </div>
            <br/>
            <div class="row">
                <div class="col-10">
                    <label for="textlogradouro">
                        Logradouro:
                    </label>
                    <input id="txtlogradouro"
                           name="logradouro"
                           placeholder="Informe o seu logradouro aqui.."
                           type="text"
                           class="form-control">
                </div>
                <div class="col-2">
                    <label for="textnumero">
                        Numero:
                    </label>
                    <input id="txtnumero"
                           name="numero"
                           placeholder="Informe o seu numero aqui.."
                           type="text"
                           class="form-control">
                </div>
            </div>
            <br/>
            <div class="row">
                <div class="col-6">
                    <label for="textbairro">
                        bairro:
                    </label>
                    <input id="txtbairro"
                           name="bairro"
                           placeholder="Informe o seu bairro aqui.."
                           type="text"
                           class="form-control">
                </div>
                <div class="col-6">
                    <label for="textcidade">
                        Cidade:
                    </label>
                    <input id="txtcidade"
                           name="cidade"
                           placeholder="Informe o sua cidade aqui.."
                           type="text"
                           class="form-control">
                </div>
            </div>
            <br/>
            <div class="row">
                <div class="col-10">
                    <label for="textcomplemento">
                        Complemento:
                    </label>
                    <input id="txtcomplemento"
                           name="complemento"
                           placeholder="Informe o seu complemento aqui.."
                           type="text"
                           class="form-control">
                </div>
                <div class="col-2">
                    <label for="textestado">
                        Estado:
                    </label>
                    <select name="estado"
                            id="sltestado"
                            class="form-control">
                        <option selected="" value="">Selecione o Estado (UF)</option>
                        <option value="">Selecione</option>
                        <option value="AC">Acre</option>
                        <option value="AL">Alagoas</option>
                        <option value="AP">Amapá</option>
                        <option value="AM">Amazonas</option>
                        <option value="BA">Bahia</option>
                        <option value="CE">Ceará</option>
                        <option value="DF">Distrito Federal</option>
                        <option value="ES">Espirito Santo</option>
                        <option value="GO">Goiás</option>
                        <option value="MA">Maranhão</option>
                        <option value="MS">Mato Grosso do Sul</option>
                        <option value="MT">Mato Grosso</option>
                        <option value="MG">Minas Gerais</option>
                        <option value="PA">Pará</option>
                        <option value="PB">Paraíba</option>
                        <option value="PR">Paraná</option>
                        <option value="PE">Pernambuco</option>
                        <option value="PI">Piauí</option>
                        <option value="RJ">Rio de Janeiro</option>
                        <option value="RN">Rio Grande do Norte</option>
                        <option value="RS">Rio Grande do Sul</option>
                        <option value="RO">Rondônia</option>
                        <option value="RR">Roraima</option>
                        <option value="SC">Santa Catarina</option>
                        <option value="SP">São Paulo</option>
                        <option value="SE">Sergipe</option>
                        <option value="TO">Tocantins</option>
                    </select>
                </div>
            </div>
            <br/>
            <div class="row">
                <div class="col-12">
                    <center>
                        <button type="button"
                                class="btn btn-danger">
                            Salvar
                        </button>
                    </center>
                </div>
            </div>
        </div>
        <script src="js/jquery.js" ></script>
        <script src="js/bootstrap.js" ></script>
        <script src="js/jquery.mask.js" ></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {

                $('#txtcep').on("blur", function (e) {
                    const cep = $("#txtcep").val();
                    const ceplimpo = String(cep)
                            .replace(".", "")
                            .replace("-", "");
                    const urlAJAX = "https://viacep.com.br/ws/" + ceplimpo + "/json/"
                    $.ajax({
                        url: urlAJAX,
                        method: "GET",
                        success: function (resp) {
                            const endereco = resp;

                            const bairro = endereco.bairro;
                            const logradouro = endereco.logradouro;
                            const cidade = endereco.localidade;
                            const estado = endereco.uf;
                            const complemento = endereco.complemento;

                            $("#txtlogradouro").val(logradouro);
                            $("#txtbairro").val(bairro);
                            $("#txtcidade").val(cidade);
                            $("#txtcomplemento").val(complemento);
                            $("#sltestado").val(estado);

                        },
                        error: function (err) {
                            alert("Erro ao buscar o CEP" + err.toString());
                        }
                    });
                });
            });

        </script>

    </body>
</html> 
