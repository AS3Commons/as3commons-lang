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
	
	import flash.utils.Dictionary;
	
	import flexunit.framework.TestCase;
	
	/**
	 * @author Christophe Herreman
	 */
	public class DictionaryUtilsTest extends TestCase {
		
		public function DictionaryUtilsTest(methodName:String = null) {
			super(methodName);
		}
		
		public function testContainsKey():void {
			var d:Dictionary = new Dictionary();
			var key:Object = new Object();
			assertFalse(DictionaryUtils.containsKey(d, key));
			
			d[key] = "a value";
			assertTrue(DictionaryUtils.containsKey(d, key));
			
			delete d[key];
			assertFalse(DictionaryUtils.containsKey(d, key));
		}
		
		public function testContainsValue():void {
			var d:Dictionary = new Dictionary();
			var key:Object = new Object();
			var value:Object = new Object();
			assertFalse(DictionaryUtils.containsValue(d, value));
			
			d[key] = value;
			assertTrue(DictionaryUtils.containsValue(d, value));
			
			delete d[key];
			assertFalse(DictionaryUtils.containsValue(d, value));
		}
	
	}
}
