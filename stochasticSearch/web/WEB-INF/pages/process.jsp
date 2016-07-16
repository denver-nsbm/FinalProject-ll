<%-- 
    Document   : process
    Created on : Jul 4, 2016, 9:09:01 AM
    Author     : Chathura Dananjaya Rupasinghe (14208554)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- jstl tags used to iterate or print the content passed by request parameters-->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Denver-Final Project</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Loading Bootstrap -->
        <link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Loading Flat UI -->
        <link href="dist/css/flat-ui.css" rel="stylesheet">

        <link rel="shortcut icon" href="img/favicon.ico">
        <link rel="stylesheet" href="dist/css/font-awesome.min.css">
        <!-- CSS Reset -->
        
        <link rel="stylesheet" href="http://www.jsdelivr.com/#!hint.css or https://cdnjs.com/libraries/hint.css">
        <meta charset="UTF-8">
    </head>
    <body>


        <div class="container">
            <br/>
            <div class="row">
                <div class="col-md-2">
                    <div class="btn-group">
                        <button  class="btn btn-primary" data-toggle="modal" data-target="#myModal">Allocate Projects &nbsp;
                            <span class="fui-gear"></span>
                        </button>


                    </div>
                </div>
                <div class="col-md-4">
                    <div class="alert alert-success">
                        Pre Assign Projects are colored in green
                    </div>
                </div>
            </div>
            <table class="table table-hover" style="font-size: 9pt">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Student Name</th>
                        
                        <c:forEach begin="1" end="10" var="num" >
                            <th>Project ${num}</th>
                            </c:forEach>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${entryList}" var="entry" varStatus="s">
                        <tr>
                            <td>${s.count}</td>
                            <td>${entry.studentName}</td>

                            <c:forEach  items="${entry.preferred_projects}" var="project" varStatus="sv" >

                                <c:if test="${fn:length(entry.preferred_projects) eq 1}">
                                    <td class="success">${project}</td>
                                </c:if>
                                <c:if test="${fn:length(entry.preferred_projects) gt 1}">
                                    <td>${project}</td>
                                </c:if>


                            </c:forEach>
                        </tr>

                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Choose the properties</h4>
                    </div>
                    <div class="modal-header">
                        <div class="alert alert-warning" id="alert-div" style="display: none">

                        </div>
                    </div>
                    <form  action="processWithAlgo" onsubmit="return validate()">
                        <div class="modal-body ">

                            <div class="row">
                                <div class="col-md-6">

                                    <label for="checkbox1" class="checkbox">
                                        <input type="checkbox" id="SAch" name="SA" value="true">
                                        Simulated Annealing
                                    </label>
                                    <label for="checkbox1" class="checkbox">
                                        <input type="checkbox" id="GAch" name="GA" value="true">
                                        Genetic Algorithm
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="" id="sa" >
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <input type="number" maxlength="2" class="form-control" placeholder="10" id="noOfpreference" name="noOfpreference" aria-describedby="basic-addon2">
                                            <span class="input-group-addon" id="basic-addon2">no of preferences to fill</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="" id="sa" >
                                    <div class="col-md-6">
                                        &nbsp;&nbsp;<p>Simulated Annealing related</p>
                                        <div class="input-group">
                                            <input type="number" maxlength="2" class="form-control" placeholder="10" id="nu_of_times" name="nu_of_times" aria-describedby="basic-addon2">
                                            <span class="input-group-addon" id="basic-addon2">no of times</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <br/>
                            <hr>
                            <div class="row">
                                <div class="" id="ga">
                                    <div class="col-md-7">
                                        &nbsp;&nbsp;<p>Genetic Algorithm related</p>
                                        <div class="input-group">
                                            <input type="number" maxlength="2" class="form-control" placeholder="10" id="nu_of_ini_pop" name="nu_of_ini_pop" aria-describedby="basic-addon2">
                                            <span class="input-group-addon" id="basic-addon2">Number Of Initial Population</span>
                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <input type="number" maxlength="2" class="form-control" placeholder="10" id="nu_of_gen" name="nu_of_gen" aria-describedby="basic-addon2">
                                            <span class="input-group-addon" id="basic-addon2">Number Of Generations</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-info" >Process  <span class="fui-gear"></span></button>


                          

                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <script src="dist/js/vendor/jquery.min.js"></script>
        <script src="dist/js/flat-ui.min.js"></script>
        <script>
                function _(x) {
                            return document.getElementById(x);
                        }
                        function validate() {
                            //this method will validate algorithms are selected or not 
                            //if selected relevent details are added
                            if (_('noOfpreference').value === '') {
                                _('alert-div').style.display = 'block';
                                _('alert-div').innerHTML = 'Please enter number of preferences';
                                setTimeout(function () {
                                    $('#alert-div').hide();
                                }, 3000);
                                return false;
                            } else if (_('SAch').checked === false && _('GAch').checked === false) {
                                _('alert-div').style.display = 'block';
                                _('alert-div').innerHTML = 'Please select atleast one algorithm to precess';
                                setTimeout(function () {
                                    $('#alert-div').hide();
                                }, 3000);
                                return false;


                            } 
                            if (_('SAch').checked) {

                                if (_('nu_of_times').value === '' || isNaN(_('nu_of_times').value)) {
                                    _('alert-div').style.display = 'block';
                                    _('alert-div').innerHTML = 'Please check \'number of times\' in SA Algorithm';
                                    setTimeout(function () {
                                        $('#alert-div').hide();
                                    }, 3000);
                                    return false;
                                }

                            } 
                            if (_('GAch').checked) {
                                if (_('nu_of_ini_pop').value === '' || isNaN(_('nu_of_ini_pop').value)) {
                                    _('alert-div').style.display = 'block';
                                    _('alert-div').innerHTML = 'Please check number of initial population in Genatic Algorithm';
                                    setTimeout(function () {
                                        $('#alert-div').hide();
                                    }, 3000);
                                    return false;

                                } else if (_('nu_of_gen').value === '' || isNaN(_('nu_of_gen').value)) {
                                    _('alert-div').style.display = 'block';
                                    _('alert-div').innerHTML = 'Please check number of genarations in Genatic Algorithm';
                                    setTimeout(function () {
                                        $('#alert-div').hide();
                                    }, 3000);
                                    return false;
                                }

                            }
                            return true;




                        }

                    
        </script>
    </body>
</html>
