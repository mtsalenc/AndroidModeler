package templates.impl

import model.AndroidApplication
import model.Component
import templates.ComponentTemplate

class GCMActivityBaseImplTemplate implements ComponentTemplate {
	private static var GCMActivityBaseImplTemplate INSTANCE = null;
	
	def GCMActivityBaseTemplate() {}
	
	def static public GCMActivityBaseImplTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMActivityBaseImplTemplate
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

import «app.javaName».«a.name»Base;
import «app.javaName».R;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;

enum MessageSentStatus {
	SUCCESS, FAIL
}

/**
  * <!-- begin-user-doc -->
  * <!-- end-user-doc -->  * 
  * @generated  
  */
public abstract class «a.name»BaseImpl extends Activity implements «a.name»Base {
	static final String TAG = "«app.name»";

  /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
    public static final String EXTRA_MESSAGE = "message";
    
      /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
    public static final String PROPERTY_REG_ID = "registration_id";
    
      /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
    private static final String PROPERTY_APP_VERSION = "appVersion";
    
      /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
    private static final int PLAY_SERVICES_RESOLUTION_REQUEST = 9000;

  /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
	String SENDER_ID = "FIXME";

  /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
    private GoogleCloudMessaging gcm;
    
  /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
    private Context context;
    
  /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
    private TextView mDisplay;

  /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
    private String regid;
    
  /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
    private AtomicInteger msgId = new AtomicInteger(0);
    
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */	 
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);
        mDisplay = (TextView) findViewById(R.id.title);
        context = getApplicationContext();

        if (checkPlayServices()) {
            gcm = GoogleCloudMessaging.getInstance(this);
            regid = getRegistrationId(context);

            if (regid.length() == 0) {
                registerInBackground();
            }
        } else {
            Log.i(TAG, "No valid Google Play Services APK found.");
        }
    }
    
    /**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
    @Override
    protected void onResume() {
        super.onResume();
        checkPlayServices();
    }

    /**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
    private boolean checkPlayServices() {
        int resultCode = GooglePlayServicesUtil.isGooglePlayServicesAvailable(this);
        if (resultCode != ConnectionResult.SUCCESS) {
            if (GooglePlayServicesUtil.isUserRecoverableError(resultCode)) {
                GooglePlayServicesUtil.getErrorDialog(resultCode, this,
                        PLAY_SERVICES_RESOLUTION_REQUEST).show();
            } else {
                Log.i(TAG, "This device is not supported.");
                finish();
            }
            return false;
        }
        return true;
    }

    /**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
    private void storeRegistrationId(Context context, String regId) {
        final SharedPreferences prefs = getGcmPreferences(context);
        int appVersion = getAppVersion(context);
        Log.i(TAG, "Saving regId on app version " + appVersion);
        SharedPreferences.Editor editor = prefs.edit();
        editor.putString(PROPERTY_REG_ID, regId);
        editor.putInt(PROPERTY_APP_VERSION, appVersion);
        editor.commit();
    }

    /**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
    private String getRegistrationId(Context context) {
        final SharedPreferences prefs = getGcmPreferences(context);
        String registrationId = prefs.getString(PROPERTY_REG_ID, "");
        if (registrationId.length() == 0) {
            Log.i(TAG, "Registration not found.");
            return "";
        }
        int registeredVersion = prefs.getInt(PROPERTY_APP_VERSION, Integer.MIN_VALUE);
        int currentVersion = getAppVersion(context);
        if (registeredVersion != currentVersion) {
            Log.i(TAG, "App version changed.");
            return "";
        }
        return registrationId;
    }
    
    /**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
    private void registerInBackground() {
        new AsyncTask<Void, Void, Void>() {
            @Override
            protected Void doInBackground(Void... params) {
                try {
                    if (gcm == null) {
                        gcm = GoogleCloudMessaging.getInstance(context);
                    }
                    regid = gcm.register(SENDER_ID);
                    sendRegistrationIdToBackend();
                    storeRegistrationId(context, regid);
                    onRegistration(MessageSentStatus.SUCCESS, null);
                } catch (IOException ex) {
                    onRegistration(MessageSentStatus.FAIL, ex);
                }
                return null;
            }
        }.execute(null, null, null);
    }

    /**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
    private void sendMessage(final Bundle data) {
            new AsyncTask<Void, Void, Void>() {
                @Override
                protected Void doInBackground(Void... params) {
                    try {
                        String id = Integer.toString(msgId.incrementAndGet());
                        gcm.send(getSenderId() + "@gcm.googleapis.com", id, data);
                        onMessageSent(MessageSentStatus.SUCCESS, null);
                    } catch (IOException ex) {
                        onMessageSent(MessageSentStatus.FAIL, ex);
                    }
                     return null;
                }
            }.execute(null, null, null);
    }

    /**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
    private static int getAppVersion(Context context) {
        try {
            PackageInfo packageInfo = context.getPackageManager()
                    .getPackageInfo(context.getPackageName(), 0);
            return packageInfo.versionCode;
        } catch (NameNotFoundException e) {
            throw new RuntimeException("Could not get package name: " + e);
        }
    }

    
    /**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
    protected void onMessageSent(MessageSentStatus status, Exception ex) {
     	switch(status) {
     	case SUCCESS:
     		onMessageSentSuccess();
     		break;
     	case FAIL:
     		onMessageSentFail();
     	}
     }     
    
  
     /**
     * <!-- begin-user-doc --> <!-- end-user-doc -->
     *
     * @generated
     */   
     protected SharedPreferences getGcmPreferences(Context context) {
        return getSharedPreferences(«a.name»Base.class.getSimpleName(),
         Context.MODE_PRIVATE);
         
        
    }
    
  /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
     protected abstract String getSenderId();
     
  /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
     protected abstract void onMessageSentSuccess();
     
  /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
     protected abstract void onMessageSentFail();
     
  /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
     protected abstract void sendRegistrationIdToBackend();
     
  /** 
    * <!-- begin-user-doc -->
    * <!-- end-user-doc --> 
    * @generated
    * @ordered
    */
     protected abstract void onRegistration(MessageSentStatus status,Exception e);
}
'''
}
