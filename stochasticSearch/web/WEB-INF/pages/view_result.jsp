<%-- 
    Document   : process
    Created on : Jul 4, 2016, 9:09:01 AM
    Author     : Chathura Dananjaya Rupasinghe (14208554)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!--jstl tag libraries used to iterate the table-->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Denver-Final Project</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Loading Bootstrap -->
        <!--<link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">

        <!-- Loading Flat UI -->
        <link href="dist/css/flat-ui.css" rel="stylesheet">

        <link rel="shortcut icon" href="img/favicon.ico">
        <link rel="stylesheet" href="dist/css/font-awesome.min.css">

        <meta charset="UTF-8">
    </head>
    <body>


        <div class="container">
            <br/>
            <div class="row">
                <div class="col-md-3">
                    <div class="btn-group">
                        <form action="export" method="post" onsubmit="setTable();">

                            <input type="hidden" name="table" id="tableH"/>
                            <button  class="btn btn-primary" type="submit" >To Excel &nbsp;
                                <span class="fui-export"></span>
                            </button>


                        </form>


                    </div>
                    <button  class="btn btn-primary" type="button" onclick="popitup('tablediv')">
                        <span class="fa fa-print"></span>
                    </button>
                </div>
                <div class="col-md-4">
                    <div class="alert alert-success">
                        <ul>
                            <li>Energy in Simulated Annealing ${energySA}</li>
                            <li>Energy in Genetic Algorithm ${energyGA}</li>
                            <li>Fitness in Genetic Algorithm ${fitnessGA}</li>
                            <li><a  data-toggle="modal" data-target="#myModal">Penalties <i class="fa fa-info-circle"></i></a></li>
                            
                        </ul>



                    </div>
                </div>
                <div class="col-md-4">
                    <div class="alert alert-success">
                        <p style="font-size: 9pt">Time Taken for Simulated Annealing ${timeSA}</p>
                        <br/>

                        <p style="font-size: 9pt">Time Taken for Genetic Algorithm ${timeGA}</p>
                    </div>
                </div>
            </div>
            <div class="row">
                
                <button  class="btn btn-primary" type="button" onclick="showSOl1()" >
                    <span class="fa fa-eye"></span>&nbsp; <span > Actual Solution</span>
                </button>


                <button  class="btn btn-primary" type="button" onclick="showSol2()" >
                    <span class="fa fa-eye"></span>&nbsp; <span> Initial Solution</span>
                </button>
                <button  class="btn btn-primary" type="button" onclick="showPref()" id="prefBtn">
                    <span class="fa fa-eye"></span>&nbsp; <span id="pref"> Random filled Preferences</span>
                </button>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <span class="fa fa-square" style="color: #c4e3f3"></span>&nbsp;<label> Students who have pre assign projects</label>
                    <span class="fa fa-square" style="color: #fcf8e3"></span>&nbsp;<label> Students who have unexpected projects</label>
                </div>

            </div>
            <div id="tablediv">

                <table class="table table-hover" style="font-size: 9pt" id="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Student Name</th>
                            <th>Project Assigned from GA</th>
                            <th>Disappointment </th>
                            <th>Project Assigned from SA</th>
                            <th>Disappointment </th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${entryList}" var="entry" varStatus="s">
                            <tr>
                                <td>${s.count}</td>
                                <td>${entry.student.studentName}</td>

                                <c:choose>
                                    <c:when test="${entry.student.hasPre_assigned}">
                                        <td class="alert alert-info">${entry.project1}    </td>
                                    </c:when>
                                    <c:when test="${!entry.student.hasPre_assigned  && entry.project1IsPreference}">
                                        <td>${entry.project1}        </td>
                                    </c:when>
                                    <c:when test="${!entry.student.hasPre_assigned  && !entry.project1IsPreference}">
                                        <td class="alert alert-warning">${entry.project1}        </td>
                                    </c:when>
                                </c:choose> 

                                <td align="center">
                                    <c:if test="${entry.project1!=null }" >
                                        ${entry.dissapointment}
                                    </c:if>
                                    <c:if test="${!entry.student.hasPre_assigned  && !entry.project1IsPreference}">
                                        <br/>Totally Disappointed
                                    </c:if>
                                </td>

                                <td>${entry.project2}</td>
                                <td align="center">
                                    <c:if test="${entry.project2!=null}" >
                                        ${entry.dissapointment2}
                                    </c:if>
                                </td>

                                <td></td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
            <div id="allocationTable" style="display: none">
                <table class="table table-hover" style="font-size: 9pt">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Student Name</th>

                            <c:forEach begin="1" end="${no_of_projects}" var="num" >
                                <th>Project ${num}</th>
                                </c:forEach>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${allocations}" var="entry" varStatus="s">
                            <tr>
                                <td>${s.count}</td>
                                <td>${entry.studentName}</td>

                                <c:forEach  items="${entry.preferred_projects}" var="project" varStatus="sv" >

                                    <c:choose>
                                        <c:when test="${entry.numberOfStatedPreferences>= sv.count && !entry.hasPre_assigned}">

                                            <td >${project}</td>
                                        </c:when>
                                        <c:when test="${sv.count >= entry.numberOfStatedPreferences && !entry.hasPre_assigned}">

                                            <td class="alert alert-warning">${project}</td>
                                        </c:when>
                                        <c:when test="${entry.hasPre_assigned}">
                                            <td class="alert alert-info">${project}</td>
                                        </c:when>
                                    </c:choose>


                                </c:forEach>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>


            <div id="initialSolution" style="display: none">


                <table class="table table-hover" style="font-size: 9pt">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Student Name</th>
                            <th>Initial Project with GA|Energy :${energyini}|Fitness:${fitnessini}</th>
                            <th>Disappointment</th>
                            <th>Initial Project with SA|Energy :${energyini2}</th>
                            <th>Disappointment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${initialSolution}" var="entry" varStatus="s">
                            <tr>
                                <td>${s.count}</td>
                                <td>${entry.student.studentName}</td>
                                <c:choose>
                                    <c:when test="${entry.student.hasPre_assigned}">
                                        <td class="alert alert-info">${entry.project1}    </td>
                                    </c:when>
                                    <c:when test="${!entry.student.hasPre_assigned  && entry.project1IsPreference}">
                                        <td>${entry.project1}        </td>
                                    </c:when>
                                    <c:when test="${!entry.student.hasPre_assigned  && !entry.project1IsPreference}">
                                        <td class="alert alert-warning">${entry.project1}        </td>
                                    </c:when>
                                </c:choose> 

                                <td align="center">
                                    <c:if test="${entry.project1!=null }" >
                                        ${entry.dissapointment}
                                    </c:if>
                                    <c:if test="${!entry.student.hasPre_assigned  && !entry.project1IsPreference}">
                                        <br/>Totally Disappointed
                                    </c:if>
                                </td>

                                <c:choose>
                                    <c:when test="${entry.student.hasPre_assigned}">
                                        <td class="alert alert-info">${entry.project2}    </td>
                                    </c:when>
                                    <c:when test="${!entry.student.hasPre_assigned  && entry.project2IsPreference}">
                                        <td>${entry.project2}        </td>
                                    </c:when>
                                    <c:when test="${!entry.student.hasPre_assigned  && !entry.project2IsPreference}">
                                        <td class="alert alert-warning">${entry.project2}        </td>
                                    </c:when>
                                </c:choose> 
                                <td align="center">
                                    <c:if test="${entry.project2!=null}" >
                                        ${entry.dissapointment2}
                                    </c:if>
                                    <c:if test="${!entry.student.hasPre_assigned  && !entry.project2IsPreference}">
                                        <br/>Totally Disappointed
                                    </c:if>
                                </td>

                                <td></td>

                            </tr>

                        </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
        <div class="modal fade " id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog ">
                <div class="modal-content ">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Group Details</h4>

                    </div>
                    <div class="modal-body  ">


                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#home">for GA</a></li>
                            <li><a data-toggle="tab" href="#menu1">for SA</a></li>

                        </ul>

                        <div class="tab-content">
                            <div id="home" class="tab-pane fade in active">
                                <h6>Penalties For GA</h6>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>project</th>
                                    </tr>
                                    <c:forEach items="${penaltiesGA}" var="item">
                                        <tr>    <td>${item}</td></tr>
                                    </c:forEach>

                                </table>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <h6>Penalties For SA</h6>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>project</th>
                                    </tr>
                                    <c:forEach items="${penaltiesSA}" var="item">
                                        <tr>    <td>${item}</td></tr>
                                    </c:forEach>

                                </table>
                            </div>

                        </div>
                    </div>


                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <script src="dist/js/vendor/jquery.min.js"></script>
        <script src="dist/js/flat-ui.min.js"></script>
        <script>
                    function _(x) {
                        return document.getElementById(x);
                    }


                    function setTable() {

                        _('tableH').value = _('tablediv').innerHTML;
                        

                    }


                    function popitup(elementId) {
                        var printContent = document.getElementById(elementId);
                        newwindow = window.open('', 'name', 'left=1,top=1,width=800,height=800');
                        var tmp = newwindow.document;
                        tmp.write(printContent.innerHTML + "<input value=PRINT type=button onclick=window.print();return false;>");
                        tmp.close();
                    }


                    function showSOl1() {

                        _('tablediv').style.display = 'block';
                        _('allocationTable').style.display = 'none';
                        _('initialSolution').style.display = 'none';

                    }
                    function showSol2() {
                        _('initialSolution').style.display = 'block';
                        _('tablediv').style.display = 'none';
                        _('allocationTable').style.display = 'none';


                    }
                    function showPref() {

                        _('tablediv').style.display = 'none';
                        _('allocationTable').style.display = 'block';
                        _('initialSolution').style.display = 'none';

                    }
        </script>

    </script>
</body>
</html>
