package biz;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Role;
import beans.Vote;
import db.DBConn;

public class VoteBiz {

	public void updataVcountById(String id) {
		DBConn dbconn = new DBConn();
		Connection conn = dbconn.getConn();
		String sqltemp = "update vote set vcount=vcount+1 where id=" + id;
		try {
			Statement st = conn.createStatement();
			st.executeUpdate(sqltemp);
		} catch (Exception e) {
		}
	}

	public List getVoteList() {
		DBConn dbconn = new DBConn();
		List list = new ArrayList();
		Connection conn = dbconn.getConn();
		String sqltemp = "select * from vote order by id DESC";
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sqltemp);
			while (rs.next()) {
				Vote vote = new Vote();
				vote.setId(rs.getInt("id"));
				vote.setLid(rs.getInt("lid"));
				vote.setVcount(rs.getInt("vcount"));
				vote.setVname(rs.getString("vname"));
				list.add(vote);
			}
		} catch (Exception e) {
		}
		return list;
	}

	public int totalVote() {
		int num = 0;
		String tempnum = null;
		DBConn dbconn = new DBConn();
		Connection conn = dbconn.getConn();
		String sqltemp = "select sum(vcount) as sm from vote";
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sqltemp);
			while (rs.next()) {
				tempnum = rs.getString(1);
			}
			if (tempnum != null) {
				num = Integer.parseInt(tempnum);
			}
		} catch (Exception e) {
		}
		return num;
	}

	public Vote getVoteById(int id) {
		DBConn dbconn = new DBConn();
		Vote vote = new Vote();
		Connection conn = dbconn.getConn();
		String sqltemp = "select * from vote where id=" + id;
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sqltemp);
			while (rs.next()) {
				vote.setId(rs.getInt("id"));
				vote.setLid(rs.getInt("lid"));
				vote.setVcount(rs.getInt("vcount"));
				vote.setVname(rs.getString("vname"));
			}
		} catch (Exception e) {
		}
		return vote;
	}

	public boolean updataVoteByVote(Vote vote) {
		boolean flag = false;
		DBConn dbconn = new DBConn();
		Connection conn = dbconn.getConn();
		String sqltemp = "update vote set vname='" + vote.getVname()
				+ "' , vcount = " + vote.getVcount() + "  where id="
				+ vote.getId();
		try {
			Statement st = conn.createStatement();
			st.executeUpdate(sqltemp);
			flag = true;
		} catch (Exception e) {
		}
		return flag;
	}

	public boolean insertVote(String item) {
		boolean flag = false;
		DBConn dbconn = new DBConn();
		Connection conn = dbconn.getConn();
		String sqltemp = "insert vote(vname,vcount) values('" + item+ "', " + 0 + " )";
		try {
			Statement st = conn.createStatement();
			st.executeUpdate(sqltemp);
			flag = true;
		} catch (Exception e) {
		}
		return flag;
	}
}
