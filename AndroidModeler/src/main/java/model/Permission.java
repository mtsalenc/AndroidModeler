/**
 */
package model;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

/**
 * <!-- begin-user-doc --> A representation of the model object '
 * <em><b>Permission</b></em>'. <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 * <li>{@link model.Permission#getName <em>Name</em>}</li>
 * <li>{@link model.Permission#getProtectionLevel <em>Protection Level</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class Permission extends MinimalEObjectImpl.Container implements EObject {
	/**
	 * The default value of the '{@link #getName() <em>Name</em>}' attribute.
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @see #getName()
	 * @generated
	 * @ordered
	 */
	protected static final String NAME_EDEFAULT = null;
	/**
	 * The cached value of the '{@link #getName() <em>Name</em>}' attribute.
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @see #getName()
	 * @generated
	 * @ordered
	 */
	protected String name = NAME_EDEFAULT;
	/**
	 * The default value of the '{@link #getProtectionLevel()
	 * <em>Protection Level</em>}' attribute. <!-- begin-user-doc --> <!--
	 * end-user-doc -->
	 * 
	 * @see #getProtectionLevel()
	 * @generated
	 * @ordered
	 */
	protected static final String PROTECTION_LEVEL_EDEFAULT = null;
	/**
	 * The cached value of the '{@link #getProtectionLevel()
	 * <em>Protection Level</em>}' attribute. <!-- begin-user-doc --> <!--
	 * end-user-doc -->
	 * 
	 * @see #getProtectionLevel()
	 * @generated
	 * @ordered
	 */
	protected String protectionLevel = PROTECTION_LEVEL_EDEFAULT;

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	protected Permission() {
		super();
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return AndroidAppPackage.eINSTANCE.getPermission();
	}

	/**
	 * Returns the value of the '<em><b>Name</b></em>' attribute. <!--
	 * begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Name</em>' attribute isn't clear, there really
	 * should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * 
	 * @return the value of the '<em>Name</em>' attribute.
	 * @see #setName(String)
	 * @generated
	 */
	public String getName() {
		return name;
	}

	/**
	 * Sets the value of the '{@link model.Permission#getName <em>Name</em>}'
	 * attribute. <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @param value
	 *            the new value of the '<em>Name</em>' attribute.
	 * @see #getName()
	 * @generated
	 */
	public void setName(String newName) {
		name = newName;
	}

	/**
	 * Returns the value of the '<em><b>Protection Level</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Protection Level</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * 
	 * @return the value of the '<em>Protection Level</em>' attribute.
	 * @see #setProtectionLevel(String)
	 * @generated
	 */
	public String getProtectionLevel() {
		return protectionLevel;
	}

	/**
	 * Sets the value of the '{@link model.Permission#getProtectionLevel
	 * <em>Protection Level</em>}' attribute. <!-- begin-user-doc --> <!--
	 * end-user-doc -->
	 * 
	 * @param value
	 *            the new value of the '<em>Protection Level</em>' attribute.
	 * @see #getProtectionLevel()
	 * @generated
	 */
	public void setProtectionLevel(String newProtectionLevel) {
		protectionLevel = newProtectionLevel;
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
		case AndroidAppPackage.PERMISSION__NAME:
			return getName();
		case AndroidAppPackage.PERMISSION__PROTECTION_LEVEL:
			return getProtectionLevel();
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
		case AndroidAppPackage.PERMISSION__NAME:
			setName((String) newValue);
			return;
		case AndroidAppPackage.PERMISSION__PROTECTION_LEVEL:
			setProtectionLevel((String) newValue);
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
		case AndroidAppPackage.PERMISSION__NAME:
			setName(NAME_EDEFAULT);
			return;
		case AndroidAppPackage.PERMISSION__PROTECTION_LEVEL:
			setProtectionLevel(PROTECTION_LEVEL_EDEFAULT);
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
		case AndroidAppPackage.PERMISSION__NAME:
			return NAME_EDEFAULT == null ? name != null : !NAME_EDEFAULT
					.equals(name);
		case AndroidAppPackage.PERMISSION__PROTECTION_LEVEL:
			return PROTECTION_LEVEL_EDEFAULT == null ? protectionLevel != null
					: !PROTECTION_LEVEL_EDEFAULT.equals(protectionLevel);
		}
		return super.eIsSet(featureID);
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public String toString() {
		if (eIsProxy())
			return super.toString();

		StringBuffer result = new StringBuffer(super.toString());
		result.append(" (name: ");
		result.append(name);
		result.append(", protectionLevel: ");
		result.append(protectionLevel);
		result.append(')');
		return result.toString();
	}

} // Permission
