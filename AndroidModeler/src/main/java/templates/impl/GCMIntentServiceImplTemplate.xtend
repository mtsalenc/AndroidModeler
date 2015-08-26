package templates.impl

import model.AndroidApplication
import model.Component

class GCMIntentServiceImplTemplate implements templates.ComponentTemplate {
	private static var GCMIntentServiceImplTemplate INSTANCE = null;
	
	def GCMIntentServiceTemplate() {}
	
	def static public GCMIntentServiceImplTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMIntentServiceImplTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component s) '''
/*
	Generated with DroidModeler
 */
package «app.javaName».impl;

import com.google.android.gms.gcm.GoogleCloudMessaging;

import android.app.IntentService;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;

import «app.javaName».«s.name»;


/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 *
 * @generated
 */
public class «s.name»Impl extends «s.name»BaseImpl implements «s.name»  {
    public static final String TAG = "«app.name»";

/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 *
 * @generated
 */
    public GcmIntentService() {
        super("«s.name»Base");
    }
    
    /**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */	
	@Override
    protected void handleMessage(MessageStatus status, Bundle data) {
        switch (status) {
        case SEND_ERROR:
        	// TODO
        	break;
        case DELETED:
        	// TODO
        	break;
        case RECEIVED:
        	// TODO
        	break;
        	}
    }
}
'''
}
