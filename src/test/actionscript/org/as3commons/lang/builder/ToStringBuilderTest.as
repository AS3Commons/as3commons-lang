/*
 * Copyright 2007-2009-2010 the original author or authors.
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
package org.as3commons.lang.builder {
	
	import flexunit.framework.TestCase;
	
	/**
	 * @author Christophe Herreman
	 */
	public class ToStringBuilderTest extends TestCase {
		// please note that all test methods should start with 'test' and should be public
		
		private var baseStr:String = "Object";
		
		private var base:Object = {};
		
		public function ToStringBuilderTest(methodName:String = null) {
			super(methodName);
		}
		
		public function testBoolean():void {
			assertEquals(baseStr + "[true]", new ToStringBuilder(base).append(true).toString());
			assertEquals(baseStr + "[a=true]", new ToStringBuilder(base).append(true, "a").toString());
			assertEquals(baseStr + "[a=true,b=false]", new ToStringBuilder(base).append(true, "a").append(false, "b").toString());
		}
		
		public function testInt():void {
			assertEquals(baseStr + "[3]", new ToStringBuilder(base).append(3).toString());
			assertEquals(baseStr + "[a=3]", new ToStringBuilder(base).append(3, "a").toString());
			assertEquals(baseStr + "[a=3,b=4]", new ToStringBuilder(base).append(3, "a").append(4, "b").toString());
		}
		
		public function testNumber():void {
			assertEquals(baseStr + "[3.2]", new ToStringBuilder(base).append(3.2).toString());
			assertEquals(baseStr + "[a=3.2]", new ToStringBuilder(base).append(3.2, "a").toString());
			assertEquals(baseStr + "[a=3.2,b=4.2]", new ToStringBuilder(base).append(3.2, "a").append(4.2, "b").toString());
		}
	
	}
}