using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using neo4jtestbed;
using MySQLTestBed;
using System.Diagnostics;
using System.Threading;

namespace Tester
{
    public class Program
    {
        public static void Main(string[] args)
        {
            /*
             * Gives the program high priority
             * */
            Process.GetCurrentProcess().ProcessorAffinity = new IntPtr(2);
            Process.GetCurrentProcess().PriorityClass = ProcessPriorityClass.High;


            string[] sqlQueries = new string[] 
            {
                "SELECT * " +
                "FROM(SELECT emp_no " +
                "FROM(SELECT * FROM departments WHERE dept_name = \"Finance\") AS dept " +
                "INNER JOIN dept_manager " +
                "WHERE dept.dept_no = dept_manager.dept_no) AS emp " +
                "INNER JOIN employees " +
                "WHERE employees.emp_no = emp.emp_no AND employees.gender = \"M\"; ",

            };

            string[] neo4jQueries = new string[]
            {
                "MATCH (males:Employee {Sex : \"M\"})-[:manages]->(d:DepartmentManager)-[:manages]->(dept:Department{DeptName: \"Finance\"}) RETURN males",

            };





            Tester sqlTest = new Tester(new MySQLTestBed.MySQLTestBed(), sqlQueries);
            sqlTest.runTests(1000); //runs n iterations
            sqlTest.print();
            Tester neo4jTest = new Tester(new neo4jclient(), neo4jQueries);
            neo4jTest.runTests(1000); //runs n iterations
            neo4jTest.print();
            

            /*
             * End product end be writing the results to file but that would be done in the Tester class.
             * */
        }
    }
}
