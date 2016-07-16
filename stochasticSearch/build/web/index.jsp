<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Denver-Final Project</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Loading Bootstrap -->
        <link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Loading Flat UI -->
        <link href="dist/css/flat-ui.css" rel="stylesheet">

        <link rel="shortcut icon" href="img/favicon.ico">
        <link rel="stylesheet" href="dist/css/font-awesome.min.css">
        <!-- CSS Reset -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.3/normalize.css">

    </head>
    <body>
        <style>
            .nav-pad{
                padding-left: 20pt;
                padding-right: 20pt;
                padding-top: 10pt;
            }

            .col-centered{
                float: none;
                margin: 0 auto;
            }
        </style>

        <div class="container-fluid">
            <br>
            <br>
            <br>
            <div class="row">
                <div class="text-center">
                    <h3>Welcome to Project Allocation</h3>
                    <h4>Group Name Denver <a  data-toggle="modal" data-target="#myModal"><i class="fa fa-info-circle"></i></a></h4>
                    <h5>Please upload your file or just switch to use default file.</h5>
                </div>
            </div>
            <br>
            <br>
            <br>

            <div class="row text-center" align="center">

                <div class="col-md-3 col-centered   text-center">
                    <div id="div1">

                        <form enctype="multipart/form-data" method="post" name="form1">
                            <input type="file" class="btn btn-block btn-hg btn-primary" id="file" name="inputStream"/>
                            <div class="row">
                                <div class="col-md-10">
                                    <label>Use default resource file</label>
                                    <input type="checkbox"  data-toggle="switch" name="useDefault" id="switch-01" />
                                </div>
                            </div>
                            <br>

                            <button type="button" class="btn btn-block btn-sm btn-primary" id="btn1" onclick="validate()" >
                                Upload &nbsp;
                                <i class="fa fa-upload"></i>
                            </button>
                        </form>
                        <br/>
                    </div>

                    <div id="continueDiv" style="display: none">
                        <h3 id="status"></h3>
                        <p id="loaded_n_total"></p>
                        <label> click here to continue &nbsp; &nbsp;</label><a href="viewContent"><button class="btn btn-inverse" id="continue">
                                Continue &nbsp;
                                <i class="fa fa-arrow-circle-o-right" ></i>
                            </button></a>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>

        <nav class="navbar navbar-default navbar-fixed-bottom " role="navigation">
            <div class="progress">
                <div id="progressBar" class="progress-bar progress-bar-success" style="width: 0%;"></div>
            </div>

        </nav>
        <div class="modal fade " id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog ">
                <div class="modal-content ">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Group Details</h4>
                    </div>
                    <div class="modal-body  ">

                        <div class="row">
                            <div class="col-md-6 ">

                                <i class="fa fa-graduation-cap"></i>&nbsp;<label >R A C D Rupasinghe <i class="fa fa-hashtag"></i>14208554</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 ">
                                <i class="fa fa-graduation-cap"></i>&nbsp;<label >MT Warapitiya&nbsp; <i class="fa fa-hashtag"></i>14209054</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 ">
                                <i class="fa fa-graduation-cap"></i>&nbsp;<label >NBI Madushanka&nbsp;<i class="fa fa-hashtag"></i>14208984</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7 ">
                                <i class="fa fa-graduation-cap"></i>&nbsp;<label >KWWMPAWMD Madagoda&nbsp; <i class="fa fa-hashtag"></i>14208981</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 ">
                                <i class="fa fa-graduation-cap"></i>&nbsp;<label >NHMWCU Ekanayake&nbsp; <i class="fa fa-hashtag"></i>14209238</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 ">
                                <i class="fa fa-graduation-cap"></i>&nbsp;<label >EJMCK Jayasundara&nbsp; <i class="fa fa-hashtag"></i>14207534</label>
                            </div>
                        </div>


                    </div>

                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <!-- jQuery (necessary for Flat UI's JavaScript plugins) -->
        <script src="dist/js/vendor/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->

        <script src="dist/js/flat-ui.min.js"></script>
        <!--<script src="dist/js/jquery.form.min.js"></script>-->
        <script src="dist/js/ajxfileupload.js"></script>
        <script>
                                $('#switch-01').bootstrapSwitch('onText', 'Yes');
                                $('#switch-01').bootstrapSwitch('offText', 'No');
                                function _(x) {
                                    return document.getElementById(x);
                                }

                                function validate() {
                                    //this method will first validate if there is a file selected
                                    //to upload or usedefault switch is turned on.
                                    //and then this method will upload the file via ajax request
                                    //and map the file content to the StudentEntry class

                                    if (_('file').value === "" && _('switch-01').checked === false) {

                                        alert('Please select a file or swich to use default file');
                                        return false;
                                    }
                                    var formdata = new FormData();
                                    if (!_('switch-01').checked) {
                                        var file = _("file").files[0];
                                        // alert(file.name+" | "+file.size+" | "+file.type);

                                        formdata.append("inputStream", file);
                                    } else {
                                        formdata.append('useDefault', true);

                                    }
                                    var ajax = new XMLHttpRequest();
                                    ajax.upload.addEventListener("progress", progressHandler, false);
                                    ajax.addEventListener("load", completeHandler, false);
                                    ajax.addEventListener("error", errorHandler, false);
                                    ajax.addEventListener("abort", abortHandler, false);
                                    ajax.open("POST", "processFile");
                                    ajax.send(formdata);

                                }


                                function completeHandler(event) {

                                    _("status").innerHTML = "upload completed Successfully !";
                                    _('div1').style.display = 'none';
                                    _('continueDiv').style.display = 'block';
                                }
                                function errorHandler(event) {
                                    _("status").innerHTML = "Upload Failed";
                                }
                                function abortHandler(event) {
                                    _("status").innerHTML = "Upload Aborted";
                                }

                                function progressHandler(event) {
                                    _("loaded_n_total").innerHTML = "Uploaded " + event.loaded + " bytes of " + event.total;
                                    var percent = (event.loaded / event.total) * 100;
                                    _("progressBar").style.width = Math.round(percent) + "%";
                                    _("status").innerHTML = Math.round(percent) + "% uploaded... please wait";
                                }

        </script>
    </body>
</html>
