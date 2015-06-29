/**
 */
package model;

import org.eclipse.emf.ecore.EClass;

import templates.ComponentTemplate;
import templates.GCMActivityBaseTemplate;
import templates.GCMActivityTemplate;

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

	@Override
	public ComponentTemplate getTemplate() {		
		return GCMActivityTemplate.getInstance();		
	}

	@Override
	public ComponentTemplate getBaseTemplate() {		
		return GCMActivityBaseTemplate.getInstance();
	}
	
} // GCMActivity
