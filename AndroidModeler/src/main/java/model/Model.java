/**
 */
package model;

import java.util.Collection;

import org.eclipse.emf.common.notify.NotificationChain;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.InternalEObject;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;
import org.eclipse.emf.ecore.util.BasicInternalEList;
import org.eclipse.emf.ecore.util.InternalEList;

/**
 * <!-- begin-user-doc --> A representation of the model object '
 * <em><b>Model</b></em>'. <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 * <li>{@link model.Model#getAndroidApps <em>Android Apps</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class Model extends MinimalEObjectImpl.Container implements EObject {
	/**
	 * The cached value of the '{@link #getAndroidApps() <em>Android Apps</em>}'
	 * containment reference list. <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @see #getAndroidApps()
	 * @generated
	 * @ordered
	 */
	protected EList<AndroidApplication> androidApps;

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	protected Model() {
		super();
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return AndroidAppPackage.eINSTANCE.getModel();
	}

	/**
	 * Returns the value of the '<em><b>Android Apps</b></em>' containment
	 * reference list. The list contents are of type
	 * {@link model.AndroidApplication}. <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Android Apps</em>' containment reference list
	 * isn't clear, there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * 
	 * @return the value of the '<em>Android Apps</em>' containment reference
	 *         list.
	 * @generated
	 */
	public EList<AndroidApplication> getAndroidApps() {
		if (androidApps == null) {
			androidApps = new BasicInternalEList<AndroidApplication>(
					AndroidApplication.class);
		}
		return androidApps;
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public NotificationChain eInverseRemove(InternalEObject otherEnd,
			int featureID, NotificationChain msgs) {
		switch (featureID) {
		case AndroidAppPackage.MODEL__ANDROID_APPS:
			return ((InternalEList<?>) getAndroidApps()).basicRemove(otherEnd,
					msgs);
		}
		return super.eInverseRemove(otherEnd, featureID, msgs);
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
		case AndroidAppPackage.MODEL__ANDROID_APPS:
			return getAndroidApps();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
		case AndroidAppPackage.MODEL__ANDROID_APPS:
			getAndroidApps().clear();
			getAndroidApps().addAll(
					(Collection<? extends AndroidApplication>) newValue);
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
		case AndroidAppPackage.MODEL__ANDROID_APPS:
			getAndroidApps().clear();
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
		case AndroidAppPackage.MODEL__ANDROID_APPS:
			return androidApps != null && !androidApps.isEmpty();
		}
		return super.eIsSet(featureID);
	}

} // Model
