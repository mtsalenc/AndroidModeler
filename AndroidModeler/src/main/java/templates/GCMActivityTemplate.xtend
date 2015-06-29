package templates

import model.AndroidApplication
import model.Component

class GCMActivityTemplate implements ComponentTemplate {
	private static var GCMActivityTemplate INSTANCE = null;
	
	def GCMActivityTemplate() {}
	
	def static public GCMActivityTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMActivityTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component a) '''
/*
	Generated with DroidModeler
 */
package «app.javaName»;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.gcm.GoogleCloudMessaging;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;

enum MessageSentStatus {
	SUCCESS, FAIL;
}

public class «a.name» extends «a.name»Base {
	static final String TAG = "«app.name»";


    private static final String PROPERTY_APP_VERSION = "appVersion";
    private static final int PLAY_SERVICES_RESOLUTION_REQUEST = 9000;

    /**
     * TODO: substitute with your sender ID
     */
    String SENDER_ID = "FIXME";


    private String regid;
    
	@Override
	protected String getSenderId() {
		return SENDER_ID;
	}

    @Override
    protected void onMessageSentSuccess() {
     	
     	}
     	
    @Override
    protected void onMessageSentSuccess() {
     	
     	}
	
     private void onRegistration(MessageSentStatus status, Exception ex) {
     	switch(status) {
     	case SUCCESS:
     		/* TODO */
     		break;
     	case FAIL:
     		/* TODO */
     	}
     }

    private void sendRegistrationIdToBackend() {
    	/* TODO: implement your custom communication here */
    }
}
'''
}
