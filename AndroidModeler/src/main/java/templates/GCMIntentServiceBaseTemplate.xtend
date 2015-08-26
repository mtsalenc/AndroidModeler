package templates

import model.AndroidApplication
import model.Component

class GCMIntentServiceBaseTemplate implements ComponentTemplate {
	private static var GCMIntentServiceBaseTemplate INSTANCE = null;
	
	def GCMIntentServiceBaseTemplate() {}
	
	def static public GCMIntentServiceBaseTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMIntentServiceBaseTemplate
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
 * @model abstract="true"
 * @generated
 */
public interface «s.name»Base {   
        
}
'''
}
