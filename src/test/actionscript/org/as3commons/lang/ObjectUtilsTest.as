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
	
	import org.as3commons.lang.testclasses.PublicClass;
	
	/**
	 * @author Christophe Herreman
	 */
	public class ObjectUtilsTest extends TestCase {
		
		public function ObjectUtilsTest(methodName:String = null) {
			super(methodName);
		}
		
		public function testIsExplicitInstanceOf():void {
			assertTrue(ObjectUtils.isExplicitInstanceOf(this, ObjectUtilsTest));
			assertFalse(ObjectUtils.isExplicitInstanceOf(this, TestCase));
		}
		
		public function testIsExplicitInstanceOf_withString():void {
			assertTrue(ObjectUtils.isExplicitInstanceOf("test", String));
		}
		
		public function testGetIterator():void {
			var iterator:IIterator = ObjectUtils.getIterator(new PublicClass());
			assertNotNull(iterator);
			assertNotNull(iterator.next());
		}
	}
}