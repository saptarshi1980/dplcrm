package in.net.dpl.dao;

import in.net.dpl.model.ConsumptionPattern;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

public class ReportDAO {

private JdbcTemplate jdbcTemplate; 
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {  
	    this.jdbcTemplate = jdbcTemplate;  
	}
	
	public String conPattern(String conNo) 
	{

		StringBuilder str = new StringBuilder();
			
					
			String sql="SELECT DATE_FORMAT(STR_TO_DATE(bill_month,'%Y%m'),'%M-%y') AS bill_month,CAST(unit AS CHAR) AS unit  FROM android.v_last_3_bill  WHERE con_no='"+conNo+"' ORDER BY STR_TO_DATE(bill_month,'%Y%m') DESC LIMIT 5";
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
			List<String> lbill=new ArrayList<String>();
			for (Map row : rows) {
							
							lbill.add(String.valueOf(row.get("bill_prd")));
							if(str.length()>0)
								str.append("|"+String.valueOf(row.get("bill_month"))+"|"+String.valueOf(row.get("unit")));
								else
								str.append(String.valueOf(row.get("bill_month"))+"|"+String.valueOf(row.get("unit")));	
							
				}
			
			
			
			return str.toString();
			
	}
	
	
}
