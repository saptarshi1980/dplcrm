<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://192.168.0.10:3306/dplsite" user="remote" password="dgppro1961" />
 
<sql:query dataSource="${dataSource}" var="categories" scope="session">
        SELECT sr_no as Download_Link,title as Title,description,view_flag AS Description FROM tariff_upload_master where view_flag='Y' ORDER BY upload_date desc
</sql:query>
 
<c:import url="displayTariff.jsp?pageNumber=1"/>