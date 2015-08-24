package templates

import model.AndroidApplication

/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 * @model interface="true" abstract = "true"
 * @generated
 */
interface ApplicationTemplate {
	
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @model
	 * @generated
	 */
	def String generate(AndroidApplication app);
}
