import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Main {

	public ArrayList<Book> getBooks(Connection con) throws SQLException {
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT id, author_last_name, author_first_name, year FROM books ORDER BY id");

		ArrayList<Book> result = new ArrayList<Book>();
        while (rs.next()) {
        	Book b = new Book();
        	b.id = rs.getInt(1);
        	b.author_last_name = rs.getString(2);
        	b.author_first_name = rs.getString(3);
        	b.year = rs.getInt(4);
        	
        	result.add(b);
        }
        
        return result;
	}
	
	public void addBook(Connection con, Book b) throws SQLException {
		PreparedStatement st = con.prepareStatement("INSERT INTO books (\"author_last_name\", \"author_first_name\", \"year\", \"title\") VALUES (?, ?, ?, ?)");
		st.setString(1, b.author_last_name);
		st.setString(2, b.author_first_name);
		st.setInt(3, b.year);
		st.setString(4, b.title);
		st.execute();
	}
	
	public void updateBook(Connection con, Book b) throws SQLException {
		PreparedStatement st = con.prepareStatement("UPDATE books SET author_last_name = ?, author_first_name = ?, year = ?, title = ? WHERE id = ?;");
		st.setString(1, b.author_last_name);
		st.setString(2, b.author_first_name);
		st.setInt(3, b.year);
		st.setString(4, b.title);
		st.setInt(5,  b.id);
		st.execute();
	}
	
	public void deleteBook(Connection con, int id) throws SQLException {
		PreparedStatement st = con.prepareStatement("DELETE FROM books WHERE id = ?");
		st.setInt(1, id);
		st.execute();
	}
	
	public static void main(String[] args) throws SQLException {
		// Connection string
		String url = "jdbc:postgresql://localhost:5432/aebi?user=aebi";
		Connection connection = DriverManager.getConnection(url);
		
		Main m = new Main();
//		ArrayList<Book> allBooks = m.getBooks(connection);
//		
//		for (int i=0; i<allBooks.size(); i++) {
//			Book b = allBooks.get(i);
//			
//			System.out.println(b.author_first_name);
//			System.out.println(b.author_last_name);
//		}
		
//		Book b = new Book();
//		b.author_first_name = "Andrea";
//		b.author_last_name = "Janes";
//		b.year = 2015;
//		b.title = "Thesis";
//		m.addBook(connection, b);
		
//		m.deleteBook(connection, 5);
		
		Book b = new Book();
		b.id = 1;
		b.author_first_name = "Micky";
		b.author_last_name = "Mouse";
		b.year = 2019;
		b.title = "One day in my life.";
		m.updateBook(connection, b);
	}

}
