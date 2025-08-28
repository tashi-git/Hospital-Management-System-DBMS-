import java.sql.*;
import java.util.Scanner;

public class SimpleAppointmentQuery {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter start date (YYYY-MM-DD): ");
        String startDate = scanner.nextLine();
        System.out.print("Enter end date (YYYY-MM-DD): ");
        String endDate = scanner.nextLine();

        String url = "jdbc:postgresql://localhost:5432/HMS_Database";
        String user = "postgres";
        String password = "12";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(
                 "SELECT * FROM appointment WHERE appointment_date BETWEEN '" 
                 + startDate + "' AND '" + endDate + "'")) {

            while (rs.next()) {
                System.out.println("Appointment ID: " + rs.getInt("appointment_id")
                        + ", Patient ID: " + rs.getInt("patient_id")
                        + ", Doctor ID: " + rs.getInt("doctor_id")
                        + ", Date: " + rs.getDate("appointment_date")
                        + ", Time: " + rs.getTime("appointment_time")
                        + ", Status: " + rs.getString("status"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
