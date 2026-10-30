HOSPITAL APPOINTMENT SYSTEM - Eclipse project (Tomcat 11, Java 17+)

1. Run sql/hospital_db.sql in MySQL Workbench.
2. Eclipse: Window > Preferences > Server > Runtime Environments > Add > Apache Tomcat v11.0
   (keep the default name "Apache Tomcat v11.0").
3. Eclipse: File > Import > General > Existing Projects into Workspace
   > Select archive file > choose HospitalAppointment.zip > Finish.
4. Copy mysql-connector-j-x.x.x.jar into src/main/webapp/WEB-INF/lib, then Refresh (F5).
5. Open src/main/java/util/DBConnection.java and set your MySQL password.
6. Right-click project > Run As > Run on Server > Tomcat v11.0 > Finish.
7. Test DB: http://localhost:8080/HospitalAppointment/testdb
   App:     http://localhost:8080/HospitalAppointment/
Admin login: admin@hospital.com / admin123
