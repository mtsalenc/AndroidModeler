package templates.impl

import model.AndroidApplication
import model.Component
import templates.ComponentTemplate

class BroadcastReceiverBaseImplTemplate implements ComponentTemplate {
	private static var BroadcastReceiverBaseImplTemplate INSTANCE = null;
	
	def BroadcastReceiverImplBaseTemplate() {}
	
	def static public BroadcastReceiverBaseImplTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new BroadcastReceiverBaseImplTemplate
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
