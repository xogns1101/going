package com.camp.going.repository;

import com.camp.going.dto.request.NoticeModifyRequestDTO;
import com.camp.going.entity.Notice;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class NoticeRepositoryImpl implements NoticeRepository {

    class NoticeMapper implements RowMapper<Notice> {

        @Override
        public Notice mapRow(ResultSet rs, int rowNum) throws SQLException {
            Notice notice = new Notice(
                    rs.getInt("notice_no"),
                    rs.getString("notice_title"),
                    rs.getString("notice_content"),
                    rs.getTimestamp("notice_date").toLocalDateTime(),
                    rs.getInt("notice_count"),
                    rs.getString("notice_category")
            );
            return notice;
        }
    }


    private final JdbcTemplate template;

    @Override
    public void save(Notice notice) {
        String sql = "INSERT INTO notice (notice_title, notice_content, notice_category) " +
                "VALUES (?, ?, ?)";
        template.update(sql, notice.getNoticeTitle(), notice.getNoticeContent(), notice.getNoticeCategory());
    }

    @Override
    public List<Notice> findAll() {
        String sql = "SELECT * FROM notice ORDER BY notice_no DESC";
        return template.query(sql, new NoticeMapper());
    }

    @Override
    public Notice findOne(int noticeNo) {
        String sql = "SELECT * FROM notice WHERE notice_no=?";
        try {
            return template.queryForObject(sql, new NoticeMapper(), noticeNo);
        } catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public void delete(int noticeNo) {
        String sql = "DELETE FROM notice WHERE notice_no=?";
        template.update(sql, noticeNo);
    }

    @Override
    public void modify(Notice notice) {
        String sql = "UPDATE notice " +
                "SET notice_title=?, notice_content=?, notice_category=? " +
                "WHERE notice_no=?";
        template.update(sql, notice.getNoticeTitle(), notice.getNoticeContent(), notice.getNoticeCategory(), notice.getNoticeNo());
    }
}
