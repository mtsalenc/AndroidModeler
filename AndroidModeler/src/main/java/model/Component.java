/**
 */
package model;

import java.lang.reflect.InvocationTargetException;
import java.util.Collection;

import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;
import org.eclipse.emf.ecore.util.BasicInternalEList;

import templates.ComponentTemplate;

/**
 * <!-- begin-user-doc --> A representation of the model object '
 * <em><b>Component</b></em>'. <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 * <li>{@link model.Component#getName <em>Name</em>}</li>
 * <li>{@link model.Component#getIntentFilters <em>Intent Filters</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public abstract class Component extends MinimalEObjectImpl.Container implements
		EObject{
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
	 * The cached value of the '{@link #getIntentFilters()
	 * <em>Intent Filters</em>}' reference list. <!-- begin-user-doc --> <!--
	 * end-user-doc -->
	 * 
	 * @see #getIntentFilters()
	 * @generated
	 * @ordered
	 */
	protected EList<IntentFilter> intentFilters;

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	protected Component() {
		super();
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return AndroidAppPackage.eINSTANCE.getComponent();
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
	 * Sets the value of the '{@link model.Component#getName <em>Name</em>}'
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
	 * Returns the value of the '<em><b>Intent Filters</b></em>' reference list.
	 * The list contents are of type {@link model.IntentFilter}. <!--
	 * begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Intent Filters</em>' reference list isn't
	 * clear, there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * 
	 * @return the value of the '<em>Intent Filters</em>' reference list.
	 * @generated
	 */
	public EList<IntentFilter> getIntentFilters() {
		if (intentFilters == null) {
			intentFilters = new BasicInternalEList<IntentFilter>(
					IntentFilter.class);
		}
		return intentFilters;
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated NOT
	 */
	public void componentAddedTo(AndroidApplication app) {
		// Override to implement event handling in subclasses
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated NOT
	 */
	public abstract String getXMLTag();
	
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated NOT
	 */
	public abstract ComponentTemplate getTemplate();
	
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated NOT
	 */
	public abstract ComponentTemplate getImplTemplate();
	
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated NOT
	 */
	public abstract ComponentTemplate getBaseTemplate();
	
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated NOT
	 */
	public abstract ComponentTemplate getBaseImplTemplate();

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
		case AndroidAppPackage.COMPONENT__NAME:
			return getName();
		case AndroidAppPackage.COMPONENT__INTENT_FILTERS:
			return getIntentFilters();
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
		case AndroidAppPackage.COMPONENT__NAME:
			setName((String) newValue);
			return;
		case AndroidAppPackage.COMPONENT__INTENT_FILTERS:
			getIntentFilters().clear();
			getIntentFilters().addAll(
					(Collection<? extends IntentFilter>) newValue);
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
		case AndroidAppPackage.COMPONENT__NAME:
			setName(NAME_EDEFAULT);
			return;
		case AndroidAppPackage.COMPONENT__INTENT_FILTERS:
			getIntentFilters().clear();
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
		case AndroidAppPackage.COMPONENT__NAME:
			return NAME_EDEFAULT == null ? name != null : !NAME_EDEFAULT
					.equals(name);
		case AndroidAppPackage.COMPONENT__INTENT_FILTERS:
			return intentFilters != null && !intentFilters.isEmpty();
		}
		return super.eIsSet(featureID);
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public Object eInvoke(int operationID, EList<?> arguments)
			throws InvocationTargetException {
		switch (operationID) {
		case AndroidAppPackage.COMPONENT___COMPONENT_ADDED_TO__ANDROIDAPPLICATION:
			componentAddedTo((AndroidApplication) arguments.get(0));
			return null;
		case AndroidAppPackage.COMPONENT___GET_XML_TAG:
			return getXMLTag();
		case AndroidAppPackage.COMPONENT___GET_TEMPLATE:
			return getTemplate();
		}
		return super.eInvoke(operationID, arguments);
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
		result.append(')');
		return result.toString();
	}

} // Component
