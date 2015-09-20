/**
 */
package model;

import java.util.Collection;

import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;
import org.eclipse.emf.ecore.util.BasicInternalEList;

/**
 * <!-- begin-user-doc --> A representation of the model object '
 * <em><b>Intent Filter</b></em>'. <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 * <li>{@link model.IntentFilter#getCategories <em>Categories</em>}</li>
 * <li>{@link model.IntentFilter#getActions <em>Actions</em>}</li>
 * <li>{@link model.IntentFilter#getDatas <em>Datas</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class IntentFilter extends MinimalEObjectImpl.Container implements
		EObject {
	/**
	 * The cached value of the '{@link #getCategories() <em>Categories</em>}'
	 * reference list. <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @see #getCategories()
	 * @generated
	 * @ordered
	 */
	protected EList<IntentCategory> categories;

	/**
	 * The cached value of the '{@link #getActions() <em>Actions</em>}'
	 * reference list. <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @see #getActions()
	 * @generated
	 * @ordered
	 */
	protected EList<IntentAction> actions;

	/**
	 * The cached value of the '{@link #getDatas() <em>Datas</em>}' reference
	 * list. <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @see #getDatas()
	 * @generated
	 * @ordered
	 */
	protected EList<IntentData> datas;

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	protected IntentFilter() {
		super();
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return AndroidAppPackage.eINSTANCE.getIntentFilter();
	}

	/**
	 * Returns the value of the '<em><b>Categories</b></em>' reference list. The
	 * list contents are of type {@link model.IntentCategory}. <!--
	 * begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Categories</em>' reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * 
	 * @return the value of the '<em>Categories</em>' reference list.
	 * @generated
	 */
	public EList<IntentCategory> getCategories() {
		if (categories == null) {
			categories = new BasicInternalEList<IntentCategory>(
					IntentCategory.class);
		}
		return categories;
	}

	/**
	 * Returns the value of the '<em><b>Actions</b></em>' reference list. The
	 * list contents are of type {@link model.IntentAction}. <!-- begin-user-doc
	 * -->
	 * <p>
	 * If the meaning of the '<em>Actions</em>' reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * 
	 * @return the value of the '<em>Actions</em>' reference list.
	 * @generated
	 */
	public EList<IntentAction> getActions() {
		if (actions == null) {
			actions = new BasicInternalEList<IntentAction>(IntentAction.class);
		}
		return actions;
	}

	/**
	 * Returns the value of the '<em><b>Datas</b></em>' reference list. The list
	 * contents are of type {@link model.IntentData}. <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Datas</em>' reference list isn't clear, there
	 * really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * 
	 * @return the value of the '<em>Datas</em>' reference list.
	 * @generated
	 */
	public EList<IntentData> getDatas() {
		if (datas == null) {
			datas = new BasicInternalEList<IntentData>(IntentData.class);
		}
		return datas;
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
		case AndroidAppPackage.INTENT_FILTER__CATEGORIES:
			return getCategories();
		case AndroidAppPackage.INTENT_FILTER__ACTIONS:
			return getActions();
		case AndroidAppPackage.INTENT_FILTER__DATAS:
			return getDatas();
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
		case AndroidAppPackage.INTENT_FILTER__CATEGORIES:
			getCategories().clear();
			getCategories().addAll(
					(Collection<? extends IntentCategory>) newValue);
			return;
		case AndroidAppPackage.INTENT_FILTER__ACTIONS:
			getActions().clear();
			getActions().addAll((Collection<? extends IntentAction>) newValue);
			return;
		case AndroidAppPackage.INTENT_FILTER__DATAS:
			getDatas().clear();
			getDatas().addAll((Collection<? extends IntentData>) newValue);
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
		case AndroidAppPackage.INTENT_FILTER__CATEGORIES:
			getCategories().clear();
			return;
		case AndroidAppPackage.INTENT_FILTER__ACTIONS:
			getActions().clear();
			return;
		case AndroidAppPackage.INTENT_FILTER__DATAS:
			getDatas().clear();
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
		case AndroidAppPackage.INTENT_FILTER__CATEGORIES:
			return categories != null && !categories.isEmpty();
		case AndroidAppPackage.INTENT_FILTER__ACTIONS:
			return actions != null && !actions.isEmpty();
		case AndroidAppPackage.INTENT_FILTER__DATAS:
			return datas != null && !datas.isEmpty();
		}
		return super.eIsSet(featureID);
	}

} // IntentFilter
