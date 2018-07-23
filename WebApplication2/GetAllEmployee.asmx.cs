using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;

namespace WebApplication2
{
    /// <summary>
    /// Summary description for GetAllEmployee
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class GetAllEmployee : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public void GetAllEmployee2()
        {
            List<EmployeesRecord> employeelist = new List<EmployeesRecord>();

            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetAllEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    EmployeesRecord employee = new EmployeesRecord();
                    employee.ID = Convert.ToInt32(rdr["ID"]);
                    employee.Name = rdr["Name"].ToString();
                    employee.Position = rdr["Position"].ToString();
                    employee.Office = rdr["Office"].ToString();
                    employee.Age = Convert.ToInt32(rdr["Age"]);
                    employee.Salary = Convert.ToInt32(rdr["Salary"]);

                    employeelist.Add(employee);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(employeelist));
        }
    }
}
