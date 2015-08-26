package templates

import model.AndroidApplication
import model.Component

class GCMIntentServiceTemplate implements ComponentTemplate {
	private static var GCMIntentServiceTemplate INSTANCE = null;
	
	def GCMIntentServiceTemplate() {}
	
	def static public GCMIntentServiceTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMIntentServiceTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component s) '''
/*
	Generated with DroidModeler
 */
package «app.javaName»;

/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 *
 * @generated
 */
public interface «s.name»  {
   
}
'''
}
