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
	
	import org.as3commons.lang.testclasses.EqualsImplementation;
	
	/**
	 * @author Christophe Herreman
	 */
	public class ArrayUtilsTest extends TestCase {
		
		public function ArrayUtilsTest(methodName:String = null) {
			super(methodName);
		}
		
		public function testIndexOfEquals():void {
			assertEquals(-1, ArrayUtils.indexOfEquals(null, null));
			assertEquals(-1, ArrayUtils.indexOfEquals(null, new EqualsImplementation()));
			assertEquals(-1, ArrayUtils.indexOfEquals([], null));
			assertEquals(-1, ArrayUtils.indexOfEquals([new EqualsImplementation("a")], new EqualsImplementation("b")));
			assertEquals(0, ArrayUtils.indexOfEquals([new EqualsImplementation("a")], new EqualsImplementation("a")));
			assertEquals(1, ArrayUtils.indexOfEquals([new EqualsImplementation("a"), new EqualsImplementation("b")], new EqualsImplementation("b")));
		}
	}
}