package templates.impl

import model.AndroidApplication
import model.Component
import templates.ComponentTemplate

class GCMActivityImplTemplate implements ComponentTemplate {
	private static var GCMActivityImplTemplate INSTANCE = null;
	
	def GCMActivityTemplate() {}
	
	def static public GCMActivityImplTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMActivityImplTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component a) '''
/*
	Generated with DroidModeler
 */
package «app.javaName».impl;

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

import «app.javaName».«a.name»;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;


/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 *
 * @generated
 */
public class «a.name»Impl extends «a.name»BaseImpl implements «a.name» {
	static final String TAG = "«app.name»";


    private static final String PROPERTY_APP_VERSION = "appVersion";
    private static final int PLAY_SERVICES_RESOLUTION_REQUEST = 9000;

    /**
     * TODO: substitute with your sender ID
     */
    String SENDER_ID = "FIXME";


    private String regid;
    
    /**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	protected String getSenderId() {
		return SENDER_ID;
	}

    /**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
    @Override
    protected void onMessageSentSuccess() {
     	
     	}    

    /**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
     protected void onRegistration(MessageSentStatus status, Exception ex) {
     	switch(status) {
     	case SUCCESS:
     		/* TODO */
     		break;
     	case FAIL:
     		/* TODO */
     	}
     }

    /**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
    protected void sendRegistrationIdToBackend() {
    	/* TODO: implement your custom communication here */
    }
    
    /**
     * <!-- begin-user-doc --> <!-- end-user-doc -->
     *
     * @generated
     */
    @Override
    protected void onMessageSentFail() {

    }
    
    
}
'''
}
