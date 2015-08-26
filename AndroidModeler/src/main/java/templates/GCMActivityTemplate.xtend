package templates

import model.AndroidApplication
import model.Component


class GCMActivityTemplate implements ComponentTemplate {
	private static var GCMActivityTemplate INSTANCE = null;
	
	def GCMActivityTemplate() {}
	
	def static public GCMActivityTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMActivityTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component a) '''
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
public interface «a.name» {
	
}
'''
}
