package templates

import model.AndroidApplication
import model.Component

class BroadcastReceiverTemplate implements ComponentTemplate {
	private static var BroadcastReceiverTemplate INSTANCE = null;
	
	def BroadcastReceiverTemplate() {}
	
	def static public BroadcastReceiverTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new BroadcastReceiverTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component c) '''
/*
	Generated with DroidModeler
 */
package «app.javaName»;

/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 * @generated
 */
public interface «c.name» {

} 
'''
}
