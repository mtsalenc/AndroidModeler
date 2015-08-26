package templates.impl

import model.AndroidApplication
import model.Component

class ActivityImplTemplate implements templates.ComponentTemplate {
	private static var ActivityImplTemplate INSTANCE = null;
	
	def ActivityImplTemplate() {}
	
	def static public ActivityImplTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new ActivityImplTemplate
		return INSTANCE
	}
	
	override generate(AndroidApplication app, Component c) '''
/*
	Generated with DroidModeler
 */
package «app.javaName».impl;
 
import android.app.Activity;

/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 * @generated
 */
public class «c.name»Impl extends Activity implements «c.name» {
	// TODO
}
'''
}
