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

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 * @generated
 */
public class «c.name» extends BroadcastReceiver {

/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 * @generated
 */
  @Override
  public void onReceive(Context context, Intent intent) {
    // TODO
  }
} 
'''
}
