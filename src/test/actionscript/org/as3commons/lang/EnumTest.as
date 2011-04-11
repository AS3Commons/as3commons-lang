/*
 * Copyright 2009-2010 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.as3commons.lang {
	
	import flexunit.framework.TestCase;
	
	import org.as3commons.lang.testclasses.Day;
	
	/**
	 * @author Christophe Herreman
	 */
	public class EnumTest extends TestCase {
		
		public function EnumTest(methodName:String = null) {
			super(methodName);
		}
		
		public function testNew():void {
			var enum:Enum = new Enum("myEnum");
			assertEquals("myEnum", enum.name);
			
			var enum2:Enum = new Enum("");
			assertEquals("", enum2.name);
			
			var enum3:Enum = new Enum(null);
			assertEquals(null, enum3.name);
			
			var enum4:Enum = new Enum("   ");
			assertEquals("", enum4.name);
		}
		
		public function testGetEnum():void {
			assertEquals("MONDAY", Enum.getEnum(Day, "MONDAY").name);
			assertTrue(Enum.getEnum(Day, "MONDAY").equals(Day.MONDAY));
		}
		
		public function testGetEnum_shouldFailForNullClass():void {
			try {
				Enum.getEnum(null, "test");
				fail("Enum.getEnum(null, 'test') should fail");
			} catch (e:IllegalArgumentError) {
			}
		}
		
		public function testGetEnum_shouldFailForNullString():void {
			try {
				Enum.getEnum(TestCase, null);
				fail("Enum.getEnum(TestCase, null) should fail");
			} catch (e:IllegalArgumentError) {
			}
		}
		
		public function testGetEnum_shouldFailForEmptyString():void {
			try {
				Enum.getEnum(TestCase, "");
				fail("Enum.getEnum(TestCase, '') should fail");
			} catch (e:IllegalArgumentError) {
			}
		}
		
		public function testGetEnum_shouldFailForBlankString():void {
			try {
				Enum.getEnum(TestCase, "   ");
				fail("Enum.getEnum(TestCase, '   ') should fail");
			} catch (e:IllegalArgumentError) {
			}
		}
		
		public function testGetEnum_shouldFailForNonEnum():void {
			try {
				Enum.getEnum(TestCase, "test");
				fail("Enum.getEnum(TestCase, 'test') should fail");
			} catch (e:IllegalArgumentError) {
			}
		}
		
		public function testGetEnum_shouldFailForNonEnumValue():void {
			try {
				Enum.getEnum(Day, "test");
				fail("Enum.getEnum(Day, 'test') should fail");
			} catch (e:IllegalArgumentError) {
			}
		}
		
		public function testGetValues():void {
			var values:Array = Enum.getValues(Day);
			assertNotNull(values);
			assertEquals(7, values.length);
			
			var values2:Array = Enum.getValues(Day);
			assertNotNull(values2);
			assertEquals(7, values2.length);
		}
		
		public function testGetValues_shouldNotContainDuplicateValues():void {
			new Day("MONDAY");
			
			var numValues:uint = Enum.getValues(Day).length;
			
			new Day("MONDAY");
			
			assertEquals(numValues, Enum.getValues(Day).length);
		}
		
		public function testGetValues_shouldFailForNonEnumClass():void {
			try {
				Enum.getValues(TestCase);
				fail("Enum.getValues(TestCase) should fail");
			} catch(e:IllegalArgumentError) {
			}
		}
	}
}