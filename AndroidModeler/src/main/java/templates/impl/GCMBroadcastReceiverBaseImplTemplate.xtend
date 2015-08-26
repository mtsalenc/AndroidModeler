package templates.impl

import model.AndroidApplication
import model.GCMBroadcastReceiver
import model.Component

class GCMBroadcastReceiverBaseImplTemplate implements templates.ComponentTemplate {
	private static var GCMBroadcastReceiverBaseImplTemplate INSTANCE = null;

	def GCMBroadcastReceiverBaseTemplate() {}

	def static public GCMBroadcastReceiverBaseImplTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMBroadcastReceiverBaseImplTemplate
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
 * @model abstract="true"
 * @generated
 */
public abstract class «br.name»BaseImpl extends WakefulBroadcastReceiver implements «br.name» {

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */	
    @Override
    public void onReceive(Context context, Intent intent) {
    	«IF br.startIntentService != null»
    	ComponentName comp = new ComponentName(context.getPackageName(),
                «br.startIntentService.name».class.getName());
    	startWakefulService(context, (intent.setComponent(comp)));
    	«ELSE»
    		onReceiveHandle();   
        «ENDIF»
        setResultCode(Activity.RESULT_OK);
    }
    
    «IF br.startIntentService == null»
    	protected abstract void onReceiveHandle();
    «ENDIF»
    
}

'''
}
