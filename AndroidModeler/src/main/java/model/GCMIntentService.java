/**
 */
package model;

import org.eclipse.emf.ecore.EClass;

import templates.ComponentTemplate;
import templates.GCMIntentServiceBaseTemplate;
import templates.GCMIntentServiceTemplate;

/**
 * <!-- begin-user-doc --> A representation of the model object '
 * <em><b>GCM Intent Service</b></em>'. <!-- end-user-doc -->
 *
 *
 * @generated
 */
public class GCMIntentService extends Service {
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	protected GCMIntentService() {
		super();
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return AndroidAppPackage.eINSTANCE.getGCMIntentService();
	}

	@Override
	public ComponentTemplate getTemplate() {
		return GCMIntentServiceTemplate.getInstance();
	}
	
	//TODO create template
	@Override
	public ComponentTemplate getBaseTemplate() {		
		return GCMIntentServiceBaseTemplate.getInstance();
	}

} // GCMIntentService
