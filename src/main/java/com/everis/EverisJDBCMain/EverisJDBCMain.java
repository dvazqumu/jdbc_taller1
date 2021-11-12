package com.everis.EverisJDBCMain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 
 * @author dvazqumu
 *
 */

public class EverisJDBCMain {

	/**
	 * Método principal
	 * 
	 * @param args
	 */

	public static void main(String[] args) {

		// Conexión y ejecución de consulta a DB
		stablishODBConnection();
	}

	/**
	 * Método que establece la conexión a la DB y ejecución de consulta
	 */
	private static void stablishODBConnection() {

		try {

			// Se establece el driver de conexión a la DB
			Class.forName("com.mysql.cj.jdbc.Driver");

			// Se establece la conexión a la DB con la URL
			final Connection dbConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/nttdata_javajdbc",
					"root", "rootroot");

			// Se realiza una consulta
			final Statement sentence = dbConnection.createStatement();
			final String query = "SELECT tr.nameEmployee AS NombreEmpleado, dp.center AS Centro, tr.rol AS Rol, tr.id_departament AS Departamento FROM nttdata_mysql_employee AS tr JOIN nttdata_mysql_departament AS dp ON dp.id_departament = tr.id_departament";

			// Obtención de consulta
			final ResultSet queryResult = sentence.executeQuery(query);

			// Se inserta valores en la tabla de empleados
			final String query2 = "INSERT INTO nttdata_mysql_employee (nameEmployee, birth_date, rol, id_departament) \r\n"
					+ "			VALUES (\"Roberto Lara\", '1977-12-21', \"Analista\", (SELECT id_departament FROM nttdata_mysql_departament WHERE nameDepartament = \"Analista programador\"));";

			// Se prepara y ejecuta el insertado de valores en la DB
			PreparedStatement stmt = dbConnection.prepareStatement(query2);
			stmt.executeUpdate();

			// Eliminación de empleado por ID
			deleteEmployee(0);

			// Iteración de resultados de la primera consulta
			StringBuilder infoEmployee = new StringBuilder();
			while (queryResult.next()) {

				infoEmployee.append("Nombre: ");
				infoEmployee.append(queryResult.getString("NombreEmpleado"));

				infoEmployee.append(" | Centro: ");
				infoEmployee.append(queryResult.getString("Centro"));

				infoEmployee.append(" | Rol: ");
				infoEmployee.append(queryResult.getString("Rol"));

				infoEmployee.append(" | Departamento: ");
				infoEmployee.append(queryResult.getString("Departamento"));

				infoEmployee.append("\n");
			}

			System.out.println(infoEmployee.toString());

			// Cierre de conexión con BBDD.
			dbConnection.close();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

	/**
	 * Método que elimina empleados por ID.
	 * 
	 * @param idEmployee
	 */
	private static void deleteEmployee(int idEmployee) {

		try {
			// Se establece la conexión a la DB con la URL
			final Connection dbConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/nttdata_javajdbc",
					"root", "rootroot");

			// Se realiza la consulta para eliminar el empleado por ID
			final String query = "DELETE FROM nttdata_mysql_employee WHERE id_employee = " + idEmployee;
			PreparedStatement stmt = dbConnection.prepareStatement(query);
			stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
