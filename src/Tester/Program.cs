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
                "SELECT count(distinct emp_no) FROM dept_emp;",
                "SELECT count(*) FROM employees;",
                "select * from employees where emp_no in ( select emp_no from dept_manager where to_date = '9999-01-01');",
                "select * from employees where emp_no in (select emp_no from dept_manager where emp_no not in (select emp_no from dept_manager where to_date = '9999-01-01'));",
                "SELECT * FROM employees where hire_date >= '1990-01-01';",
                "SELECT * from employees where emp_no in (SELECT emp_no FROM titles where title = 'Staff' and to_date = '9999-01-01');",
                "SELECT salary FROM salaries where to_date = '9999-01-01' order by salary desc limit 10;",
                "CREATE TEMPORARY TABLE IF NOT EXISTS high AS (select * from titles natural join salaries order by salary desc limit 1); SELECT * from employees natural join high where employees.emp_no = high.emp_no; ",
                "SELECT * FROM employees WHERE emp_no = (SELECT distinct emp_no FROM dept_manager ORDER BY datediff(from_date, to_date) limit 1);",
                "SELECT * FROM employees ORDER BY hire_date LIMIT 10;",
                "SELECT count(gender) as males FROM employees WHERE gender = 'M';",
                "SELECT dept_no as Dept, count(emp_no) as Headcount FROM dept_emp WHERE to_date = '9999-01-01' group by dept_no ORDER BY Headcount DESC LIMIT 1;",
            };

            string[] neo4jQueries = new string[]
            {
                "MATCH (e:DeptEmployee) RETURN count(distinct e);",
                "MATCH (n:Employee) RETURN count(n);",
                "MATCH (currentManagers: DepartmentManager { EndDate: '9999-01-01'}) MATCH (employee:Employee { EmployeeNumber : currentManagers.EmployeeNumber}) RETURN employee, employee.FirstName as First, employee.LastName as Last;",
                "MATCH (e:Employee)-[:manages]->(d:DepartmentManager)-[:manages]->() WHERE d.EndDate <> '9999-01-01' RETURN e;",
                "MATCH(n:Employee) WHERE apoc.date.parse(n.HireDate,'s','yyyy-MM-dd') <= apoc.date.parse('1990-01-01','s','yyyy-MM-dd') RETURN n.LastName as Last, n.FirstName as First;",
                "MATCH (n:Employee)-[:hasTitle]->(t:Title{Title: 'Staff', EndDate: '9999-01-01'}) RETURN n.LastName as Last, n.FirstName as First;",
                "MATCH (s:Salary {EndDate: '9999-01-01'}) RETURN s.Salary ORDER BY s.Salary LIMIT 10;",
                "MATCH (t:Title)<-[:hasTitle]-(e:Employee)-[:hasSalary]->(s:Salary) RETURN e.FirstName as First, e.LastName as Last, t.Title as Title, s.Salary as Salary ORDER BY Salary LIMIT 1;",
                "MATCH (m:Employee)-[:manages]->(manager:DepartmentManager) RETURN m.FirstName as First, m.LastName as Last, apoc.date.parse(manager.EndDate,'s','yyyy-MM-dd') - apoc.date.parse(manager.StartDate,'s','yyyy-MM-dd') as Tenure ORDER BY Tenure DESC LIMIT 1;",
                "MATCH (senior:Employee) RETURN senior.FirstName as First, senior.LastName as Last, senior.HireDate as Start ORDER BY senior.HireDate LIMIT 10;",
                "MATCH (m:Employee {Sex: 'M'}) RETURN count(m) as Males;",
                "MATCH (large: Department)<-[:inDepartment]-(d:DeptEmployee {EndDate: '9999-01-01'}) RETURN large.DeptName as Department, count(d) as Size ORDER BY Size DESC LIMIT 1;",
            };





            Tester sqlTest = new Tester(new MySQLTestBed.MySQLTestBed(), sqlQueries);
            sqlTest.runTests(10); //runs n iterations
            sqlTest.print();
            Tester neo4jTest = new Tester(new neo4jclient(), neo4jQueries);
            neo4jTest.runTests(10); //runs n iterations
            neo4jTest.print();

            Tester.writeFile(sqlTest, neo4jTest, "queries.dat");
            /*
             * End product end be writing the results to file but that would be done in the Tester class.
             * */
        }
    }
}
