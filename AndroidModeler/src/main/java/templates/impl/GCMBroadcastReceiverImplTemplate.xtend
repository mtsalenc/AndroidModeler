package templates.impl

import model.AndroidApplication
import model.GCMBroadcastReceiver
import model.Component

class GCMBroadcastReceiverImplTemplate implements templates.ComponentTemplate {
	private static var GCMBroadcastReceiverImplTemplate INSTANCE = null;
	
	def GCMBroadcastReceiverTemplate() {}
	
	def static public GCMBroadcastReceiverImplTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMBroadcastReceiverImplTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component b) '''
	«var br = b as GCMBroadcastReceiver»
/*
	Generated with DroidModeler
 */
package «app.javaName».impl;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.support.v4.content.WakefulBroadcastReceiver;

import «app.javaName».«br.name»;
import «app.javaName».«br.startIntentService.name»;

/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 *
 * @generated
 */
public class «br.name»Impl extends «br.name»BaseImpl implements «br.name» {

«IF br.startIntentService == null»
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public void onReceiveHandle() {    	
		// TODO: implement intent handling here       
	}

«ENDIF»
}
'''
}
