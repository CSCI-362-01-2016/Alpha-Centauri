/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs;

import java.util.HashSet;
import java.util.Set;

public class TestCase00011 {
	
	public static void main(String args[]) {
		Allergies testAllergies = new Allergies();
		Allergy testAllergy = new Allergy();
		Allergen testAllergen = new Allergen();
		String allergenToAdd = args[0];
		testAllergen.setAllergenType(AllergenType.valueOf(allergenToAdd));
		testAllergy.setAllergen(testAllergen);
		testAllergies.add(testAllergy);
		System.out.println(testAllergies.contains(testAllergy));
		
	}
}
