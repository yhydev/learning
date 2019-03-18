package priv.yanyang.example.mybatis.typehandler;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.log4j.Logger;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedJdbcTypes(JdbcType.VARCHAR)
public class ExampleTypeHandler extends BaseTypeHandler<String> {

    Logger logger = Logger.getLogger(ExampleTypeHandler.class);

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, String parameter, JdbcType jdbcType) throws SQLException {
        logger.debug("setNonNullParameter");
        ps.setString(i, parameter);
    }

    @Override
    public String getNullableResult(ResultSet rs, String columnName) throws SQLException {
        logger.debug("getNullableResult columnName");
        return rs.getString(columnName).toUpperCase();
    }

    @Override
    public String getNullableResult(ResultSet rs, int columnIndex) throws SQLException {

        logger.debug("getNullableResult columnIndex");
        return rs.getString(columnIndex);
    }

    @Override
    public String getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {

        logger.debug("getNullableResult cs columnIndex");
        return cs.getString(columnIndex);
    }
}