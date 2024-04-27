package com.camp.going.repository;

import com.camp.going.entity.Camping;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
@RequiredArgsConstructor
public class CampingRepositoryImpl implements CampingRepository {



    class CampingMapper implements RowMapper<Camping> {
        @Override
        public Camping mapRow(ResultSet rs, int rowNum) throws SQLException {
            Camping camping = new Camping(
                    rs.getInt("camp_id"),
                    rs.getString("camp_name"),
                    rs.getString("camp_address"),
                    rs.getString("camp_number"),
                    rs.getString("camp_hompage"),
                    rs.getString("camp_electric"),
                    rs.getString("camp_hot_water"),
                    rs.getString("camp_wifi"),
                    rs.getString("camp_firewood"),
                    rs.getString("camp_mart"),
                    rs.getString("camp_bed"),
                    rs.getString("camp_ice_box"),
                    rs.getInt("camp_price"),
                    rs.getString("camp_image")
            );
            return camping;
        }
    }
    private final JdbcTemplate template;

    @Override
    public void updateCampingPrice(int campId, int Price) {
        String sql = "UPDATE camping SET camp_price=? WHERE camp_id=?";
        template.update(sql, Price, campId);
    }

}
