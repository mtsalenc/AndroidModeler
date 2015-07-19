/**
 */
package model;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import templates.ComponentTemplate;
import templates.GCMBroadcastReceiverBaseTemplate;
import templates.GCMBroadcastReceiverTemplate;

/**
 * <!-- begin-user-doc --> A representation of the model object '
 * <em><b>GCM Broadcast Receiver</b></em>'. <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 * <li>{@link model.GCMBroadcastReceiver#getStartIntentService <em>Start Intent
 * Service</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class GCMBroadcastReceiver extends BroadcastReceiver {


	/**
	 * The cached value of the '{@link #getStartIntentService()
	 * <em>Start Intent Service</em>}' reference. <!-- begin-user-doc --> <!--
	 * end-user-doc -->
	 * 
	 * @see #getStartIntentService()
	 * @generated
	 * @ordered
	 */
	protected GCMIntentService startIntentService;

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	protected GCMBroadcastReceiver() {
		super();
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return AndroidAppPackage.eINSTANCE.getGCMBroadcastReceiver();
	}

	/**
	 * Returns the value of the '<em><b>Start Intent Service</b></em>'
	 * reference. <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Start Intent Service</em>' reference isn't
	 * clear, there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * 
	 * @return the value of the '<em>Start Intent Service</em>' reference.
	 * @see #setStartIntentService(GCMIntentService)
	 * @generated
	 */
	public GCMIntentService getStartIntentService() {
		if (startIntentService != null && startIntentService.eIsProxy()) {
			InternalEObject oldStartIntentService = (InternalEObject) startIntentService;
			startIntentService = (GCMIntentService) eResolveProxy(oldStartIntentService);
			if (startIntentService != oldStartIntentService) {
			}
		}
		return startIntentService;
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	public GCMIntentService basicGetStartIntentService() {
		return startIntentService;
	}

	/**
	 * Sets the value of the '
	 * {@link model.GCMBroadcastReceiver#getStartIntentService
	 * <em>Start Intent Service</em>}' reference. <!-- begin-user-doc --> <!--
	 * end-user-doc -->
	 * 
	 * @param value
	 *            the new value of the '<em>Start Intent Service</em>'
	 *            reference.
	 * @see #getStartIntentService()
	 * @generated
	 */
	public void setStartIntentService(GCMIntentService newStartIntentService) {
		startIntentService = newStartIntentService;
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
		case AndroidAppPackage.GCM_BROADCAST_RECEIVER__START_INTENT_SERVICE:
			if (resolve)
				return getStartIntentService();
			return basicGetStartIntentService();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
		case AndroidAppPackage.GCM_BROADCAST_RECEIVER__START_INTENT_SERVICE:
			setStartIntentService((GCMIntentService) newValue);
			return;
		}
		super.eSet(featureID, newValue);
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public void eUnset(int featureID) {
		switch (featureID) {
		case AndroidAppPackage.GCM_BROADCAST_RECEIVER__START_INTENT_SERVICE:
			setStartIntentService((GCMIntentService) null);
			return;
		}
		super.eUnset(featureID);
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public boolean eIsSet(int featureID) {
		switch (featureID) {
		case AndroidAppPackage.GCM_BROADCAST_RECEIVER__START_INTENT_SERVICE:
			return startIntentService != null;
		}
		return super.eIsSet(featureID);
	}

	@Override
	public ComponentTemplate getTemplate() {
		return GCMBroadcastReceiverTemplate.getInstance();
	}
	

	@Override
	public ComponentTemplate getBaseTemplate() {	
		return GCMBroadcastReceiverBaseTemplate.getInstance();
	}

	@Override
	public void componentAddedTo(AndroidApplication app) {
		AndroidAppFactory factory = new AndroidAppFactory();
		Metadata metadata = factory.createMetadata();
		metadata.setName("com.google.android.gms.version");
		metadata.setValue("4030500");
		app.getMetadatas().add(metadata);

		Permission perm = factory.createPermission();
		perm.setName("android.permission.INTERNET");
		app.usesPermission(perm);

		perm = factory.createPermission();
		perm.setName("android.permission.GET_ACCOUNTS");
		app.usesPermission(perm);

		perm = factory.createPermission();
		perm.setName("android.permission.WAKE_LOCK");
		app.usesPermission(perm);

		perm = factory.createPermission();
		perm.setName("com.google.android.gcm.demo.app.permission.C2D_MESSAGE");
		perm.setProtectionLevel("signature");
		app.definesPermission(perm);
		app.usesPermission(perm);

		perm = factory.createPermission();
		perm.setName("com.google.android.c2dm.permission.RECEIVE");
		app.usesPermission(perm);

		IntentFilter filter = factory.createIntentFilter();

		IntentAction action = factory.createIntentAction();
		action.setName("com.google.android.c2dm.intent.RECEIVE");
		filter.getActions().add(action);

		IntentCategory category = factory.createIntentCategory();
		category.setName(app.getJavaName());
		filter.getCategories().add(category);

		getIntentFilters().add(filter);
	}

} // GCMBroadcastReceiver
