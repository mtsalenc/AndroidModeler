package templates

import model.AndroidApplication
import model.Component

class GCMIntentServiceTemplate implements ComponentTemplate {
	private static var GCMIntentServiceTemplate INSTANCE = null;
	
	def GCMIntentServiceTemplate() {}
	
	def static public GCMIntentServiceTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMIntentServiceTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component s) '''
/*
	Generated with DroidModeler
 */
package «app.javaName»;

import com.google.android.gms.gcm.GoogleCloudMessaging;

import android.app.IntentService;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;

enum MessageStatus {
	SEND_ERROR, DELETED, RECEIVED;
}

public class GcmIntentService extends «s.name»Base  {
    public static final String TAG = "«app.name»";

    public GcmIntentService() {
        super("«s.name»Base");
    }
    
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
'''
}
