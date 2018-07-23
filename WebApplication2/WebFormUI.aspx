<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormUI.aspx.cs" Inherits="WebApplication2.WebFormUI" %>

<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>  
<html xmlns="http://www.w3.org/1999/xhtml">
    <script type="text/javascript">  
        $(document).ready(function () {  
            $.ajax({  
                url: 'GetAllEmployee.asmx/GetAllEmployee2',
                dataType: "json",  
                method: 'post',  
                success: function (data) {  
                    var employeeTable = $('#tblEmployee tbody');  
                    employeeTable.empty();  
                    $(data).each(function (index, emp) {  
                        employeeTable.append('<tr><td>' + emp.ID + '</td><td>'  
                            + emp.Name + '</td><td>' + emp.Position + '</td><td>' + emp.Office  
                            + '</td><td>' + emp.Age + '</td><td>' + emp.Salary + '</td></tr>');  
                    });  
                },  
                error: function (err) {  
                    alert(err);  
                }  
            });  
        });  
    </script>  
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">  
        <div class="container">  
            <h3 class="text-uppercase text-center">How to retrive data using ajax in asp.net</h3>  
            <table id="tblEmployee" class="table table-bordered">  
                <thead class="bg-primary text-white">  
                    <tr>  
                        <th>ID</th>  
                        <th>Name</th>  
                        <th>Position</th>  
                        <th>Office</th>  
                        <th>Age</th>  
                        <th>Salary</th>  
                    </tr>  
                </thead>  
                <tbody></tbody>  
            </table>  
        </div>  
    </form>  
</body>
</html>
