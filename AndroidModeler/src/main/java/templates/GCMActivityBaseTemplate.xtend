package templates

import model.AndroidApplication
import model.Component

class GCMActivityBaseTemplate implements ComponentTemplate {
	private static var GCMActivityBaseTemplate INSTANCE = null;
	
	def GCMActivityBaseTemplate() {}
	
	def static public GCMActivityBaseTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMActivityBaseTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component a) '''
/*
	Generated with DroidModeler
 */
package «app.javaName»;

/**
  * <!-- begin-user-doc -->
  * <!-- end-user-doc -->  * 
  * @generated abstract="true"
  * @ordered
  */
public interface «a.name»Base {	


} //«a.name»Base
'''
}
