// create employees
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/neo4j/databases/employees.csv" AS row
CREATE (:Employee {BirthDate: row.birth_date, Sex: row.gender, 
					HireDate: row.hire_date, 
					EmployeeNumber: row.emp_no, 
					FirstName: row.first_name, 
					LastName: row.last_name} );
					
// create departments
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/neo4j/databases/departments.csv" AS row
CREATE (:Department {DeptName: row.dept_name, DeptNumber: row.dept_no} );

// create titles
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/neo4j/databases/titles.csv" AS row
CREATE (:Title {EmployeeNumber: row.emp_no, Title: row.title, 
				StartDate: row.from_date, EndDate: row.to_date} );

// create salaries
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/neo4j/databases/salaries.csv" AS row
CREATE (:Salary {EmployeeNumber: row.emp_no, Salary: row.salary, 
				StartDate: row.from_date, EndDate: row.to_date} );
				
// create dept managers
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/neo4j/databases/dept_manager.csv" AS row
CREATE (:DepartmentManager {EmployeeNumber: row.emp_no, DeptNumber: row.dept_no, 
				StartDate: row.from_date, EndDate: row.to_date} );

// create dept-employee
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/neo4j/databases/dept_emp.csv" AS row
CREATE (:DeptEmployee {EmployeeNumber: row.emp_no, DeptNumber: row.dept_no, 
				StartDate: row.from_date, EndDate: row.to_date} );

// CREATE INDEX ON :Employee(EmployeeNumber);
CREATE INDEX ON :DepartmentManager(EmployeeNumber);
CREATE INDEX ON :DepartmentManager(DeptNumber);
CREATE INDEX ON :Department(DeptNumber);
CREATE INDEX ON :DeptEmployee(EmployeeNumber);
CREATE INDEX ON :DeptEmployee(DeptNumber);
CREATE INDEX ON :Salary(EmployeeNumber);
CREATE INDEX ON :Title(EmployeeNumber);

CREATE CONSTRAINT ON (o:Employee) ASSERT o.EmployeeNumber IS UNIQUE;

schema await

// Create the relationships

//Employee dept managers
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/neo4j/databases/dept_emp.csv" AS row
MATCH (employee:Employee {EmployeeNumber : row.emp_no})
MATCH (deptEmp:DeptEmployee {EmployeeNumber: row.emp_no})
MERGE (employee)-[:inDepartment]->(deptEmp);

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/neo4j/databases/dept_emp.csv" AS row
MATCH (dept:DeptEmployee {EmployeeNumber : row.emp_no, DeptNumber : row.dept_no})
MATCH (dept2:Department {DeptNumber: row.dept_no})
MERGE (dept)-[:inDepartment]->(dept2);

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/neo4j/databases/dept_manager.csv" AS row
MATCH (employee:Employee {EmployeeNumber : row.emp_no})
MATCH (manage:DepartmentManager {EmployeeNumber: row.emp_no})
MERGE (employee)-[:manages]->(manage);

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/neo4j/databases/dept_manager.csv" AS row
MATCH (deptManager:DepartmentManager {DeptNumber : row.dept_no})
MATCH (dept:Department {DeptNumber: row.dept_no})
MERGE (deptManager)-[:manages]->(dept);

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/neo4j/databases/titles.csv" AS row
MATCH (employee:Employee {EmployeeNumber : row.emp_no})
MATCH (title:Title {EmployeeNumber: row.emp_no})
MERGE (employee)-[:hasTitle]->(title);

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/neo4j/databases/salaries.csv" AS row
MATCH (employee:Employee {EmployeeNumber : row.emp_no})
MATCH (salary:Salary {EmployeeNumber: row.emp_no})
MERGE (employee)-[:hasSalary]->(salary);