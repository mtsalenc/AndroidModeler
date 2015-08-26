package templates

import model.AndroidApplication
import model.GCMBroadcastReceiver
import model.Component

class GCMBroadcastReceiverTemplate implements ComponentTemplate {
	private static var GCMBroadcastReceiverTemplate INSTANCE = null;
	
	def GCMBroadcastReceiverTemplate() {}
	
	def static public GCMBroadcastReceiverTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMBroadcastReceiverTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component b) '''
	«var br = b as GCMBroadcastReceiver»
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
public interface «br.name» {
	
}
'''
}
