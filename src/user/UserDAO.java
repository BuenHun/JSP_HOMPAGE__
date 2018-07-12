package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    private Connection conn; // 데이터베이스에 접근하게 해주는 객체
    private PreparedStatement pstmt; // SQL문을 DMBS에 전달해주는 객체
    private ResultSet rs; // 정보를 담을 수 있는 객체


    public UserDAO()
    {
        try {
            String dbURL="jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
            String dbID="root";
            String dbPassword="dh2tmdgns";
            Class.forName("com.mysql.cj.jdbc.Driver");
//            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(dbURL,dbID,dbPassword);


        }catch (Exception e)
        {
            e.printStackTrace();
        }

    }
public int login(String userID, String userPassword){

        String SQL="SELECT userPassword FROM USER WHERE userID = ?";
        try {
            pstmt=conn.prepareStatement(SQL);
            pstmt.setString(1,userID);
            rs=pstmt.executeQuery(); //rs에 실행한 결과 저장
            if (rs.next())
            {
                if (rs.getString(1).equals(userPassword))
                {
                    return 1; // SUCESS to login
                }
                else
                    return 0; // doesn't exit password
            }
            return -1;// 아이디가 없음
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return -2; // DB ERROR
}
public int join(User user)
{
    String SQL="INSERT INTO USER VALUES(?,?,?,?,?)";
    try {
        pstmt=conn.prepareStatement(SQL);
        pstmt.setString(1,user.getUserID());
        pstmt.setString(2,user.getUserPassword());
        pstmt.setString(3,user.getUserName());
        pstmt.setString(4,user.getUserEmail());
        pstmt.setString(5,user.getUserEmail());
        return pstmt.executeUpdate();

    }catch (Exception e)
    {
        e.printStackTrace();
    }

    return -1; // 데이터베이스 오류
}

}
