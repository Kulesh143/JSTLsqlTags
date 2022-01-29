JSTL SQL Tags
The JSTL sql tags provide SQL support. The url for the sql tags is http://java.sun.com/jsp/jstl/sql and prefix is sql.

The SQL tag library allows the tag to interact with RDBMSs (Relational Databases) such as Microsoft SQL Server, mySQL, or Oracle.
The syntax used for including JSTL SQL tags library in your JSP is:

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

#1.JSTL SQL <sql:setDataSource> Tag
    The <sql:setDataSource> tag is used for creating a simple data source suitable only for prototyping.
It is used to create the data source variable directly from JSP and it is stored inside a scoped variable.
It can be used as input for other database actions.

        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/tasty"
                           user="root"  password=""/>
#2.JSTL SQL <sql:query> Tag
The <sql:query> tag is used for executing the SQL query defined in its sql attribute or the body.
It is used to execute an SQL SELECT statement and saves the result in scoped variable.
                Example:

                <sql:query dataSource="${db}" var="rs">
                    SELECT * from Students;
                </sql:query>

                mysql> use tasty;
                mysql> create table Students
                (
                id int not null,
                First_Name varchar (255),
                Last_Name varchar (255),
                Age int not null
                );
                mysql>
DO THIS:
                mysql> INSERT INTO Students VALUES (150, 'Kulesh', 'Abhayasundara', 22);


                mysql>  INSERT INTO Students VALUES (151, 'Milinda', 'Perera', 20);


                mysql>  INSERT INTO Students VALUES (152, 'Rambo', 'Rajkumar', 24);


                mysql> INSERT INTO Students VALUES (153, 'Harry', 'Potter', 22);


                mysql>
Example:
                <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                                   url="jdbc:mysql://localhost/tasty"
                                   user="root"  password=""/>

                <sql:query dataSource="${db}" var="rs">
                    SELECT * from Students;
                </sql:query>

                <table border="2" width="100%">
                <tr>
                <th>Student ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
                </tr>
                <c:forEach var="table" items="${rs.rows}">
                    <tr>
                        <td><c:out value="${table.id}"/></td>
                        <td><c:out value="${table.First_Name}"/></td>
                        <td><c:out value="${table.Last_Name}"/></td>
                        <td><c:out value="${table.Age}"/></td>
                    </tr>
                </c:forEach>
                </table>
#3.JSTL SQL <sql:update> Tag
The <sql:update> tag is used for executing the SQL DML query defined in its sql attribute or
in the tag body. It may be SQL UPDATE, INSERT or DELETE statements.

                        Example:

                        <sql:update dataSource="${db}" var="count">
                            INSERT INTO Students VALUES (154,'Robin', 'Hood', 25);
                        </sql:update>
EXAMPLE:=
                        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                                           url="jdbc:mysql://localhost/tasty"
                                           user="root"  password=""/>
                        <sql:update dataSource="${db}" var="count">
                            INSERT INTO Students VALUES (154,'Robin', 'Hood', 25);
                        </sql:update>

                        <sql:query dataSource="${db}" var="rs">
                            SELECT * from Students;
                        </sql:query>

                        <table border="2" width="100%">
                        <tr>
                        <th>Student ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Age</th>
                        </tr>
                        <c:forEach var="table" items="${rs.rows}">
                            <tr>
                                <td><c:out value="${table.id}"/></td>
                                <td><c:out value="${table.First_Name}"/></td>
                                <td><c:out value="${table.Last_Name}"/></td>
                                <td><c:out value="${table.Age}"/></td>
                            </tr>
                        </c:forEach>
                        </table>
#4.JSTL SQL <sql:param> Tag
                            The <sql:param> tag sets the parameter value in SQL statement.
 It is used as nested tag for <sql:update> and <sql:query>
to provide the value in SQL query parameter. If null value is provided, the value is set at SQL NULL for value attribute.

 EXAMPLE:=

                                    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                                                       url="jdbc:mysql://localhost/tasty"
                                                       user="root"  password=""/>
                                    <c:set var="StudentId" value="152"/>
                                    <sql:update dataSource="${db}" var="count">
                                        DELETE FROM Students WHERE Id = ?
                                        <sql:param value="${StudentId}" />
                                    </sql:update>

                                    <sql:query dataSource="${db}" var="rs">
                                        SELECT * from Students;
                                    </sql:query>
                                    <table border="2" width="100%">
                                    <tr>
                                    <th>Student ID</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Age</th>
                                    </tr>
                                    <c:forEach var="table" items="${rs.rows}">
                                        <tr>
                                            <td><c:out value="${table.id}"/></td>
                                            <td><c:out value="${table.First_Name}"/></td>
                                            <td><c:out value="${table.Last_Name}"/></td>
                                            <td><c:out value="${table.Age}"/></td>
                                        </tr>
                                    </c:forEach>
                                    </table>
 #5.JSTL SQL <sql:dateParam> Tag
The <sql:dateParam> is used to set the specified date for SQL query parameter.
It is used as nested tag for <sql:update> and <sql:query>
 to provide the date and time value for SQL query parameter. If null value is provided, the value is set at SQL NULL.

                                            mysql> use tasty;
                                            mysql> create table Student
                                            (
                                            id int not null,
                                            First_Name varchar (255),
                                            Last_Name varchar (255),
                                            dob date
                                            );

                                            mysql>

                                            mysql> INSERT INTO student VALUES (150, 'Kulesh', 'Abhayasundara', '1994/07/19' );


                                            mysql>  INSERT INTO Student VALUES (151, 'Rambo', 'Rajkumar', '1992/03/9');


                                            mysql>  INSERT INTO Student VALUES (152, 'Harry', 'Potter', '1992/01/23' );


                                            mysql> INSERT INTO Student VALUES (153, 'Mary', 'Jane', '1992/01/9');


                                            mysql>
 EXAMPLE:=

                                            <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                                                               url="jdbc:mysql://localhost/tasty"
                                                               user="root"  password=""/>

                                            <%
                                                Date DoB = new Date("2000/10/16");
                                                int studentId = 151;
                                            %>

                                            <sql:update dataSource="${db}" var="count">
                                                UPDATE Student SET dob = ? WHERE Id = ?
                                                <sql:dateParam value="<%=DoB%>" type="DATE" />
                                                <sql:param value="<%=studentId%>" />
                                            </sql:update>

                                            <sql:query dataSource="${db}" var="rs">
                                                SELECT * from Student;
                                            </sql:query>

                                            <table border="2" width="100%">
                                            <tr>
                                            <th>Emp ID</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>DoB</th>
                                            </tr>
                                            <c:forEach var="table" items="${rs.rows}">
                                                <tr>
                                                    <td><c:out value="${table.id}"/></td>
                                                    <td><c:out value="${table.First_Name}"/></td>
                                                    <td><c:out value="${table.Last_Name}"/></td>
                                                    <td><c:out value="${table.dob}"/></td>
                                                </tr>
                                            </c:forEach>
                                            </table>
#6.JSTL SQL <sql:transaction> Tag
The <sql:transaction> tag is used for transaction management.
It is used to group multiple <sql:update> into common transaction.
If you group multiple SQL queries in a single transaction, database is hit only once.
It is used for ensuring that the database modifications are performed
 by the nested actions which can be either rolled back or committed.

 EXAMPLE:=

                                                    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                                                                       url="jdbc:mysql://localhost/tasty"
                                                                       user="root"  password=""/>

                                                    <%
                                                        Date DoB = new Date("2000/10/16");
                                                        int studentId = 151;
                                                    %>

                                                    <sql:transaction dataSource="${db}">
                                                        <sql:update var="count">
                                                            UPDATE Student SET First_Name = 'KalEl' WHERE Id = 150
                                                        </sql:update>
                                                        <sql:update var="count">
                                                            UPDATE Student SET Last_Name= 'Sheroff' WHERE Id = 153
                                                        </sql:update>
                                                        <sql:update var="count">
                                                            INSERT INTO Student
                                                            VALUES (154,'Sam', 'Jones', '1995/10/6');
                                                        </sql:update>
                                                    </sql:transaction>

                                                    <sql:query dataSource="${db}" var="rs">
                                                        SELECT * from Student;
                                                    </sql:query>

                                                    <table border="2" width="100%">
                                                    <tr>
                                                    <th>Emp ID</th>
                                                    <th>First Name</th>
                                                    <th>Last Name</th>
                                                    <th>DoB</th>
                                                    </tr>
                                                    <c:forEach var="table" items="${rs.rows}">
                                                        <tr>
                                                            <td><c:out value="${table.id}"/></td>
                                                            <td><c:out value="${table.First_Name}"/></td>
                                                            <td><c:out value="${table.Last_Name}"/></td>
                                                            <td><c:out value="${table.dob}"/></td>
                                                        </tr>
                                                    </c:forEach>
                                                    </table>
