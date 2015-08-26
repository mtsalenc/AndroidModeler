/**
 */
package model;

import org.eclipse.emf.ecore.EClass;

import templates.ComponentTemplate;
import templates.GCMActivityBaseTemplate;
import templates.GCMActivityTemplate;
import templates.impl.GCMActivityBaseImplTemplate;
import templates.impl.GCMActivityImplTemplate;

/**
 * <!-- begin-user-doc --> A representation of the model object '
 * <em><b>GCM Activity</b></em>'. <!-- end-user-doc -->
 *
 *
 * @generated
 */
public class GCMActivity extends Activity {
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	protected GCMActivity() {
		super();
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return AndroidAppPackage.eINSTANCE.getGCMActivity();
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public ComponentTemplate getTemplate() {		
		return GCMActivityTemplate.getInstance();		
	}
	
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public ComponentTemplate getImplTemplate() {		
		return GCMActivityImplTemplate.getInstance();		
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public ComponentTemplate getBaseTemplate() {		
		return GCMActivityBaseTemplate.getInstance();
	}
	
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public ComponentTemplate getBaseImplTemplate() {		
		return GCMActivityBaseImplTemplate.getInstance();
	}
	
} // GCMActivity
