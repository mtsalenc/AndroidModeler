package templates.impl

import model.AndroidApplication
import model.Component

class ActivityTemplate implements templates.ComponentTemplate {
	private static var ActivityTemplate INSTANCE = null;
	
	def ActivityTemplate() {}
	
	def static public ActivityTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new ActivityTemplate
		return INSTANCE
	}
	
	override generate(AndroidApplication app, Component c) '''
/*
	Generated with DroidModeler
 */
package «app.javaName»;
 
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
