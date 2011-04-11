/*
 * Copyright (c) 2009-2010 the original author or authors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package org.as3commons.lang.builder {
	
	import flexunit.framework.TestCase;
	
	/**
	 * @author Christophe Herreman
	 */
	public class EqualsBuilderTest extends TestCase {
		
		public function EqualsBuilderTest(methodName:String = null) {
			super(methodName);
		}
		
		public function testEquals_shouldBeTrueForNewEqualsBuilder():void {
			assertTrue(new EqualsBuilder().equals);
		}
		
		public function testEquals_null():void {
			assertTrue(new EqualsBuilder().append(null, null).equals);
		}
		
		public function testEquals_nan():void {
			assertTrue(new EqualsBuilder().append(NaN, NaN).equals);
		}
		
		public function testEquals_boolean():void {
			var o1:Boolean = true;
			var o2:Boolean = false;
			assertTrue(new EqualsBuilder().append(o1, o1).equals);
			assertFalse(new EqualsBuilder().append(o1, o2).equals);
			assertFalse(new EqualsBuilder().append(o2, o1).equals);
			assertTrue(new EqualsBuilder().append(o1, true).equals);
			assertTrue(new EqualsBuilder().append(true, o1).equals);
			assertTrue(new EqualsBuilder().append(o2, false).equals);
			assertTrue(new EqualsBuilder().append(false, o2).equals);
			assertFalse(new EqualsBuilder().append(true, "true").equals);
			assertFalse(new EqualsBuilder().append(false, "false").equals);
			assertFalse(new EqualsBuilder().append(false, 0).equals);
			assertFalse(new EqualsBuilder().append(false, 1).equals);
			assertFalse(new EqualsBuilder().append(true, 1).equals);
			assertFalse(new EqualsBuilder().append(true, 1).equals);
		}
		
		public function testEquals_string():void {
			assertTrue(new EqualsBuilder().append("myString", "myString").equals);
			assertFalse(new EqualsBuilder().append("myString", "myString ").equals);
			assertFalse(new EqualsBuilder().append("myString", " myString").equals);
			assertFalse(new EqualsBuilder().append("myString ", "myString").equals);
			assertFalse(new EqualsBuilder().append(" myString", "myString").equals);
			assertTrue(new EqualsBuilder().append(" myString ", " myString ").equals);
			assertFalse(new EqualsBuilder().append("a", "b").equals);
			assertFalse(new EqualsBuilder().append("a", "A").equals);
		}
		
		public function testEquals_number():void {
			assertTrue(new EqualsBuilder().append(0, 0).equals);
			assertTrue(new EqualsBuilder().append(1, 1).equals);
			assertTrue(new EqualsBuilder().append(-1, -1).equals);
			assertTrue(new EqualsBuilder().append(1.23456789, 1.23456789).equals);
			assertFalse(new EqualsBuilder().append(1, 2).equals);
		}
		
		public function testEquals_date():void {
			assertTrue(new EqualsBuilder().append(new Date(), new Date()).equals);
			var date:Date = new Date();
			assertTrue(new EqualsBuilder().append(date, date).equals);
			assertTrue(new EqualsBuilder().append(new Date(2009, 6, 12, 7, 8, 9, 1234), new Date(2009, 6, 12, 7, 8, 9, 1234)).equals);
		}
		
		public function testEquals_array():void {
			assertTrue(new EqualsBuilder().append(["a"], ["a"]).equals);
			assertTrue(new EqualsBuilder().append(["a", "b", "c"], ["a", "b", "c"]).equals);
			assertTrue(new EqualsBuilder().append([1, 2, 3], [1, 2, 3]).equals);
			assertTrue(new EqualsBuilder().append([1, true, "text", new Date()], [1, true, "text", new Date()]).equals);
		}
		
		public function testEquals_object():void {
			assertTrue(new EqualsBuilder().append({}, {}).equals);
			assertTrue(new EqualsBuilder().append({"a": 1}, {"a": 1}).equals);
			assertTrue(new EqualsBuilder().append({"a": 1, "b": 2}, {"a": 1, "b": 2}).equals);
			assertTrue(new EqualsBuilder().append({"a": 1, "b": 2, 1: [1, "a", true]}, {"a": 1, "b": 2, 1: [1, "a", true]}).equals);
		}
		
		public function testEquals_xml():void {
			assertTrue(new EqualsBuilder().append(<a><b/></a>,                     <a><b/></a>).equals);
			assertTrue(new EqualsBuilder().append(<a><b/></a>,                     <a><b></b></a>).equals);
		}
		
		public function testEquals_xmlList():void {
			var listA:XMLList = new XMLList(<a><b/><c><d/></c></a>);
			var listB:XMLList = new XMLList(<a><b/><c><d/></c></a>);
			
			assertTrue(new EqualsBuilder().append(listA, listB).equals);
			
			listA = new XMLList(<a><b/><b/><b/></a>);
			listB = new XMLList(<a><b/><b/><b/></a>);
			
			assertTrue(new EqualsBuilder().append(listA.descendants(), listB.descendants()).equals);
		}
		
		public function testEquals_person():void {
			var personA:Person = new Person("John", "Doe", 33);
			var personB:Person = new Person("John", "Doe", 33);
			
			assertTrue(new EqualsBuilder().append(personA, personB).equals);
			
			personA = new Person("John", "Doe", 33, [new Person("Baby1", "Doe", 1), new Person("Baby2", "Doe", 1)]);
			personB = new Person("John", "Doe", 33, [new Person("Baby1", "Doe", 1), new Person("Baby2", "Doe", 1)]);
			
			assertTrue(new EqualsBuilder().append(personA, personB).equals);
		}
		
		public function testEquals_personEquals():void {
			var personA:PersonEquals = new PersonEquals("John", "Doe", 33);
			var personB:PersonEquals = new PersonEquals("John", "Doe", 33);
			
			assertTrue(new EqualsBuilder().append(personA, personB).equals);
			
			personA = new PersonEquals("John", "Doe", 33);
			personB = new PersonEquals("John", "Doe", 34);
			
			assertFalse(new EqualsBuilder().append(personA, personB).equals);
			
			personA = new PersonEquals("John", "Doe", 33, [new PersonEquals("Baby1", "Doe", 1), new PersonEquals("Baby2", "Doe", 1)]);
			personB = new PersonEquals("John", "Doe", 33, [new PersonEquals("Baby1", "Doe", 1), new PersonEquals("Baby2", "Doe", 1)]);
			
			assertTrue(new EqualsBuilder().append(personA, personB).equals);
		}
	
	}
}

import org.as3commons.lang.IEquals;
import org.as3commons.lang.builder.EqualsBuilder;

class Person {
	public var firstName:String = "";
	
	public var lastName:String = "";
	
	public var age:uint;
	
	public var children:Array = [];
	
	public function Person(firstName:String = "", lastName:String = "", age:uint = 0, children:Array = null) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.age = age;
		this.children = (children == null ? [] : children);
	}
}

class PersonEquals extends Person implements IEquals {
	
	public function PersonEquals(firstName:String = "", lastName:String = "", age:uint = 0, children:Array = null) {
		super(firstName, lastName, age, children);
	}
	
	public function equals(other:Object):Boolean {
		if (!other) {
			return false;
		}
		
		if (this == other) {
			return true;
		}
		
		if (!(other is PersonEquals)) {
			return false;
		}
		
		var that:PersonEquals = PersonEquals(other);
		
		return new EqualsBuilder().append(firstName, that.firstName).append(lastName, that.lastName).append(age, that.age).append(children, that.children).equals;
	}
}