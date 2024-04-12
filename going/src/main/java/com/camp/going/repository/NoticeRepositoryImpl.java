package com.camp.going.repository;

import com.camp.going.entity.Notice;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
@RequiredArgsConstructor
public class NoticeRepositoryImpl implements NoticeRepository{

    class NoticeMapper implements RowMapper<Notice> {

        @Override
        public Notice mapRow(ResultSet rs, int rowNum) throws SQLException {
            Notice notice = new Notice(
                    rs.getInt("notice_no"),
                    rs.getString("notice_title"),
                    rs.getString("notice_content"),
                    rs.getTimestamp("notice_date").toLocalDateTime(),
                    rs.getInt("notice_count")
            );
            return notice;
        }
    }


    private final JdbcTemplate template;

    @Override
    public void save(Notice notice) {
        String sql = "INSERT INTO notice (notice_title, notice_content) " +
                "VALUES (?, ?)";
        template.update(sql, notice.getNoticeTitle(), notice.getNoticeContent());
    }
}
