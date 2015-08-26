package templates.impl

import model.AndroidApplication
import model.Component

class ServiceImplTemplate implements templates.ComponentTemplate {
	private static var ServiceImplTemplate INSTANCE = null;
	
	def ServiceTemplate() {}
	
	def static public ServiceImplTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new ServiceImplTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component c) '''
/*
	Generated with DroidModeler
 */
package «app.javaName».impl;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import «app.javaName».«c.name»;

/**
 * <!-- begin-user-doc -->
 * @generated
 */
public class «c.name»Impl extends Service implements «c.name»{	
	
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
