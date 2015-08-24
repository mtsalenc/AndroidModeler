package templates.impl

import model.AndroidApplication
import model.Component

class ServiceTemplate implements templates.ComponentTemplate {
	private static var ServiceTemplate INSTANCE = null;
	
	def ServiceTemplate() {}
	
	def static public ServiceTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new ServiceTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component c) '''
/*
	Generated with DroidModeler
 */
package «app.javaName»;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

/**
 * <!-- begin-user-doc -->
 * @generated
 */
public class «c.name» extends Service {	
	
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public IBinder onBind(Intent intent) {
		//TODO
		return null;
	}
}'''
}
