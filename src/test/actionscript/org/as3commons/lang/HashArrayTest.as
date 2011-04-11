/*
 * Copyright 2007-2010 the original author or authors.
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

	public class HashArrayTest extends TestCase {

		public function HashArrayTest(methodName:String = null) {
			super(methodName);
		}

		public function testInstantiation():void {
			var h:HashArray = new HashArray('testProperty');
			assertEquals(0, h.length);
			h = new HashArray('testProperty', false, [{testProperty: 'test'}]);
			assertEquals(1, h.length);
		}

		public function testGet():void {
			var h:HashArray = new HashArray('testProperty', false, [{testProperty: 'test'}]);
			assertNotNull(h.get('test'));
			assertNull(h.get('test2'));
		}

		public function testPop():void {
			var origObj:Object = {testProperty: 'test'};
			var h:HashArray = new HashArray('testProperty', false, [origObj]);
			assertNotNull(h.get('test'));
			var o:Object = h.pop();
			assertStrictlyEquals(o, origObj);
			assertEquals(0, h.length);
			assertNull(h.get('test'));
		}

		public function testShift():void {
			var origObj:Object = {testProperty: 'test'};
			var h:HashArray = new HashArray('testProperty', false, [origObj]);
			assertNotNull(h.get('test'));
			var o:Object = h.shift();
			assertStrictlyEquals(o, origObj);
			assertEquals(0, h.length);
			assertNull(h.get('test'));
		}

		public function testPush():void {
			var origObj:Object = {testProperty: 'test'};
			var h:HashArray = new HashArray('testProperty');
			h.push(origObj);
			assertEquals(1, h.length);
			assertNotNull(h.get('test'));
		}

		public function testDisallowDuplicates():void {
			var origObj:Object = {testProperty: 'test'};
			var origObj2:Object = {testProperty: 'test'};
			var h:HashArray = new HashArray('testProperty');
			h.push(origObj);
			assertEquals(1, h.length);
			h.push(origObj2);
			assertEquals(1, h.length);
			assertStrictlyEquals(origObj2, h.get('test'));
		}

		public function testAllowDuplicates():void {
			var origObj:Object = {testProperty: 'test'};
			var origObj2:Object = {testProperty: 'test'};
			var h:HashArray = new HashArray('testProperty', true);
			h.push(origObj);
			assertEquals(1, h.length);
			h.push(origObj2);
			assertEquals(2, h.length);
			var arr:Array = h.get('test');
			assertStrictlyEquals(origObj, arr[0]);
			assertStrictlyEquals(origObj2, arr[1]);

			h.pop();
			assertEquals(1, h.length);
			arr = h.get('test');
			assertStrictlyEquals(origObj, arr[0]);

			h.pop();
			assertEquals(0, h.length);
			assertNull(h.get('test'));
		}

	}
}