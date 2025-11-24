package Test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import Servlet.DbUtils;

class DataSourceTests {

	@Test
	void t1() throws Exception {
		DbUtils.conn();
	}
//	@Test
//	void t2() {
//		
//	}
//	@Test
//	void t3() {
//		
//	}

}
