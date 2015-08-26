package templates.impl

import model.AndroidApplication
import model.Component

class GCMIntentServiceBaseImplTemplate implements templates.ComponentTemplate {
	private static var GCMIntentServiceBaseImplTemplate INSTANCE = null;
	
	def GCMIntentServiceBaseTemplate() {}
	
	def static public GCMIntentServiceBaseImplTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMIntentServiceBaseImplTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component s) '''
/*
	Generated with DroidModeler
 */
package «app.javaName».impl;

import com.google.android.gms.gcm.GcmReceiver;
import com.google.android.gms.gcm.GoogleCloudMessaging;

import android.app.IntentService;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;

import «app.javaName».«s.name»Base;

enum MessageStatus {
	SEND_ERROR, DELETED, RECEIVED
}

/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 * @model abstract="true"
 * @generated
 */
public abstract class «s.name»BaseImpl extends IntentService implements «s.name»Base{
    public static final String TAG = "«app.name»";

    public GcmServiceBaseImpl(String name) {
        super("«s.name»");
    }

    @Override
    protected void onHandleIntent(Intent intent) {
        Bundle extras = intent.getExtras();
        GoogleCloudMessaging gcm = GoogleCloudMessaging.getInstance(this);
        String messageType = gcm.getMessageType(intent);

		if (!extras.isEmpty()) {
        	 if (messageType == GoogleCloudMessaging.MESSAGE_TYPE_SEND_ERROR){
                handleMessage(MessageStatus.SEND_ERROR, extras);
            }
            if (messageType == GoogleCloudMessaging.MESSAGE_TYPE_DELETED){
                handleMessage(MessageStatus.SEND_ERROR, extras);
            }
            if (messageType == GoogleCloudMessaging.MESSAGE_TYPE_MESSAGE){
                handleMessage(MessageStatus.SEND_ERROR, extras);
                Log.i(TAG, "Received: " + extras.toString());
            } 
      		GcmReceiver.completeWakefulIntent(intent);
 	  	}
    }

    protected abstract void handleMessage(MessageStatus status, Bundle data);
        
}
'''
}
