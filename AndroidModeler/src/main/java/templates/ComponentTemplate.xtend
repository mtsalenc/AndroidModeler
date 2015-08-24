package templates

import model.AndroidApplication
import model.Component

/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 * @model interface="true" abstract="true"
 * @generated
 */
interface ComponentTemplate {
	
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @model
	 * @generated
	 */
	def String generate(AndroidApplication app, Component c);
}
