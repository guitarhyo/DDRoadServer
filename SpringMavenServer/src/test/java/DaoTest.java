
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ddroad.dao.CommonDao;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { TestConfig.class })
public class DaoTest {


	@Autowired
	CommonDao commonDao;

	
	@Test
	public void maintest() {
//		List<Map>
//		commonDao.selectBoard();
	System.out.println("testeset");
	}
}
