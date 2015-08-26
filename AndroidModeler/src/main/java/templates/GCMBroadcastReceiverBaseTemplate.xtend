package templates

import model.AndroidApplication
import model.GCMBroadcastReceiver
import model.Component

class GCMBroadcastReceiverBaseTemplate implements ComponentTemplate {
	private static var GCMBroadcastReceiverBaseTemplate INSTANCE = null;

	def GCMBroadcastReceiverBaseTemplate() {}

	def static public GCMBroadcastReceiverBaseTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMBroadcastReceiverBaseTemplate
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
 * @model abstract="true"
 * @generated
 */
public interface «br.name»Base {
	
}

'''
}
