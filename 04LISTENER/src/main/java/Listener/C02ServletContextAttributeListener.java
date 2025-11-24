package Listener;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class C02ServletContextAttributeListener implements ServletContextAttributeListener{

	@Override
	public void attributeAdded(ServletContextAttributeEvent scae) {
		System.out.println("[LISTENER] C02ServletContextAttributeListener add()..");
	}

	@Override
	public void attributeRemoved(ServletContextAttributeEvent scae) {
		System.out.println("[LISTENER] C02ServletContextAttributeListener remove()..");
	}

	@Override
	public void attributeReplaced(ServletContextAttributeEvent scae) {
		System.out.println("[LISTENER] C02ServletContextAttributeListener replace()..");
	}
		

}