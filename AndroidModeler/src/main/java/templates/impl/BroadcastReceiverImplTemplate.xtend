package templates.impl

import model.AndroidApplication
import model.Component
import templates.ComponentTemplate

class BroadcastReceiverImplTemplate implements ComponentTemplate {
	private static var BroadcastReceiverImplTemplate INSTANCE = null;
	
	def BroadcastReceiverImplTemplate() {}
	
	def static public BroadcastReceiverImplTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new BroadcastReceiverImplTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component c) '''
/*
	Generated with DroidModeler
 */
package «app.javaName».impl;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

import «app.javaName».«c.name»;

/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 * @generated
 */
public class «c.name»Impl extends «c.name»BaseImpl implements «c.name» {

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
