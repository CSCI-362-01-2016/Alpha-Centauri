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

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class TestCase00002 {
	
	public static void main(String args[]) {
		Person TestPerson = new Person();
		DateFormat df = new SimpleDateFormat("mm-dd-yyyy");
		Date birthDate = new Date();
		try {
			
			birthDate = df.parse(args[0]);
		}
		catch (Exception e) {

		}
		TestPerson.setBirthdate(birthDate);
		System.out.println(df.format(TestPerson.getBirthdate()));
	}
}
