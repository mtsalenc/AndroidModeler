package templates.impl

import model.AndroidApplication
import model.GCMBroadcastReceiver
import model.Component

class GCMBroadcastReceiverBaseTemplate implements templates.ComponentTemplate {
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

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.support.v4.content.WakefulBroadcastReceiver;

/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 * @model abstract="true"
 * @generated
 */
public abstract class «br.name»Base extends WakefulBroadcastReceiver {

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
