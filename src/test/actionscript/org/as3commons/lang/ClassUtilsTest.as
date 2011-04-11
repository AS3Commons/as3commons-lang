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

	import flash.utils.getQualifiedClassName;

	import flexunit.framework.Reflective;
	import flexunit.framework.Test;
	import flexunit.framework.TestCase;

	import org.as3commons.lang.testclasses.ComplexClass;
	import org.as3commons.lang.testclasses.ISubInterface;
	import org.as3commons.lang.testclasses.IncompleteInterfaceImplementation;
	import org.as3commons.lang.testclasses.IncorrectInterfaceImplementation;
	import org.as3commons.lang.testclasses.InformalInterfaceImplementation;
	import org.as3commons.lang.testclasses.Interface;
	import org.as3commons.lang.testclasses.InterfaceImplementation;
	import org.as3commons.lang.testclasses.PublicClass;
	import org.as3commons.lang.testclasses.PublicSubClass;
	import org.as3commons.lang.testclasses.SubInterfaceImplementation;

	/**
	 * @author Christophe Herreman
	 */
	public class ClassUtilsTest extends TestCase {

		public function ClassUtilsTest(methodName:String = null) {
			super(methodName)
		}

		public function testForInstance():void {
			assertEquals(ClassUtilsTest, ClassUtils.forInstance(this));
			assertEquals(String, ClassUtils.forInstance(new String("a")));
			assertEquals(String, ClassUtils.forInstance("b"));
		}

		public function testForName_shouldReturnString():void {
			assertEquals(String, ClassUtils.forName("String"));
		}

		public function testForName_shouldReturnNumber():void {
			assertEquals(Number, ClassUtils.forName("Number"));
		}

		public function testForName_shouldReturnint():void {
			assertEquals(int, ClassUtils.forName("int"));
		}

		public function testForName_shouldReturnUint():void {
			assertEquals(uint, ClassUtils.forName("uint"));
		}

		public function testForName_shouldReturnBoolean():void {
			assertEquals(Boolean, ClassUtils.forName("Boolean"));
		}

		public function testForName_shouldReturnArray():void {
			assertEquals(Array, ClassUtils.forName("Array"));
		}

		public function testForName_shouldReturnDate():void {
			assertEquals(Date, ClassUtils.forName("Date"));
		}

		public function testForName_shouldReturnClass():void {
			assertEquals(Class, ClassUtils.forName("Class"));
		}

		public function testForName_shouldThrowClassNotFoundError():void {
			try {
				assertEquals(String, ClassUtils.forName("string"));
				fail("Calling forName() with unknown class should throw ClassNotFoundError");
			} catch (e:ClassNotFoundError) {
			}
		}

		public function testIsPrivateClass():void {
			assertTrue(ClassUtils.isPrivateClass(PrivateClass));
			assertTrue(ClassUtils.isPrivateClass(getQualifiedClassName(PrivateClass)));
			assertFalse(ClassUtils.isPrivateClass(ClassUtilsTest));
			assertFalse(ClassUtils.isPrivateClass(getQualifiedClassName(ClassUtilsTest)));
		}

		public function testIsSubclassOf():void {
			var result:Boolean = ClassUtils.isSubclassOf(ClassUtilsTest, TestCase);
			assertTrue(result);
		}

		public function testIsSubclassOf2():void {
			var result:Boolean = ClassUtils.isSubclassOf(ClassUtilsTest, String);
			assertFalse(result);
		}

		public function testGetSuperClass():void {
			var clazz:Class = ClassUtilsTest;
			var parentClass:Class = ClassUtils.getSuperClass(clazz);
			assertEquals(TestCase, parentClass);
		}

		public function testGetSuperClassWithString():void {
			assertEquals(Object, ClassUtils.getSuperClass(String));
		}

		public function testGetSuperClassWithObject():void {
			assertEquals(null, ClassUtils.getSuperClass(Object));
		}

		public function testGetName():void {
			var result:String = ClassUtils.getName(ClassUtilsTest);
			assertEquals("ClassUtilsTest", result);
		}

		public function testGetFullyQualifiedName():void {
			var result:String = ClassUtils.getFullyQualifiedName(ClassUtilsTest);
			assertEquals("org.as3commons.lang::ClassUtilsTest", result);
		}

		public function testGetFullyQualifiedNameWithReplaceColons():void {
			var result:String = ClassUtils.getFullyQualifiedName(ClassUtilsTest, true);
			assertEquals("org.as3commons.lang.ClassUtilsTest", result);
		}

		public function testGetSuperClassName():void {
			var result:String = ClassUtils.getSuperClassName(ClassUtilsTest);
			assertEquals("TestCase", result);
		}

		public function testGetFullyQualifiedSuperClassName():void {
			var result:String = ClassUtils.getFullyQualifiedSuperClassName(ClassUtilsTest);
			assertEquals("flexunit.framework::TestCase", result);
		}

		public function testGetFullyQualifiedSuperClassNameWithReplaceColons():void {
			var result:String = ClassUtils.getFullyQualifiedSuperClassName(ClassUtilsTest, true);
			assertEquals("flexunit.framework.TestCase", result);
		}

		public function testGetNameFromFullyQualifiedName():void {
			var result:String = ClassUtils.getNameFromFullyQualifiedName("flexunit.framework::Reflective");
			assertEquals("Reflective", result);
		}

		public function testGetNameFromFullyQualifiedName_forArray():void {
			var result:String = ClassUtils.getNameFromFullyQualifiedName("Array");
			assertEquals("Array", result);
		}

		public function testNewInstance():void {
			var result:PublicClass = ClassUtils.newInstance(PublicClass, []);
			assertNotNull(result);
		}

		// interface methods
		public function testGetImplementedInterfaceNames():void {
			var result:Array = ClassUtils.getImplementedInterfaceNames(TestCase);
			assertEquals(2, result.length);
			assertTrue(result.indexOf("Reflective") > -1);
			assertTrue(result.indexOf("Test") > -1);
		}

		public function testGetFullyQualifiedImplementedInterfaceNames():void {
			var result:Array = ClassUtils.getFullyQualifiedImplementedInterfaceNames(TestCase);
			assertEquals(2, result.length);
			assertTrue(result.indexOf("flexunit.framework::Reflective") > -1);
			assertTrue(result.indexOf("flexunit.framework::Test") > -1);
		}

		public function testGetFullyQualifiedImplementedInterfaceNames_replaceColons():void {
			var result:Array = ClassUtils.getFullyQualifiedImplementedInterfaceNames(TestCase, true);
			assertEquals(2, result.length);
			assertTrue(result.indexOf("flexunit.framework.Reflective") > -1);
			assertTrue(result.indexOf("flexunit.framework.Test") > -1);
		}

		public function testGetImplementedInterfaces():void {
			var result:Array = ClassUtils.getImplementedInterfaces(TestCase);
			assertEquals(2, result.length);
			assertTrue(result.indexOf(Reflective) > -1);
			assertTrue(result.indexOf(Test) > -1);
		}

		// convertFullyQualifiedName
		public function testConvertFullyQualifiedName():void {
			var result:String = ClassUtils.convertFullyQualifiedName("flexunit.framework::TestCase");
			assertEquals("flexunit.framework.TestCase", result);
		}

		// --------------------------------------------------------------------
		// isAssignableFrom
		// --------------------------------------------------------------------

		// helpers

		private function assertIsAssignableFrom(c1:Class, c2:Class):void {
			assertTrue(ClassUtils.isAssignableFrom(c1, c2));
		}

		private function assertIsNotAssignableFrom(c1:Class, c2:Class):void {
			assertFalse(ClassUtils.isAssignableFrom(c1, c2));
		}

		// assignable

		public function testIsAssignableFrom_shouldReturnTrueForObjectAndObject():void {
			assertIsAssignableFrom(Object, Object);
		}

		public function testIsAssignableFrom_shouldReturnTrueForObjectAndString():void {
			assertIsAssignableFrom(Object, String);
		}

		public function testIsAssignableFrom_shouldReturnTrueForObjectAndInt():void {
			assertIsAssignableFrom(Object, int);
		}

		public function testIsAssignableFrom_shouldReturnTrueForInterfaceAndInterfaceImplementation():void {
			assertIsAssignableFrom(Interface, InterfaceImplementation);
		}

		public function testIsAssignableFrom_shouldReturnTrueForInterfaceAndSubInterfaceImplementation():void {
			assertIsAssignableFrom(Interface, SubInterfaceImplementation);
		}

		public function testIsAssignableFrom_shouldReturnTrueForPublicClassAndPublicSubClass():void {
			assertIsAssignableFrom(PublicClass, PublicSubClass);
		}

		public function testIsAssignableFrom_shouldReturnTrueForObjectAndPublicSubClass():void {
			assertIsAssignableFrom(Object, PublicSubClass);
		}

		// NOT assignable

		public function testIsNotAssignableFrom_shouldReturnFalseForStringAndObject():void {
			assertIsNotAssignableFrom(String, Object);
		}

		// --------------------------------------------------------------------
		// isImplementationOf
		// --------------------------------------------------------------------

		public function testIsImplementationOf_shouldReturnTrueForInterfaceImplementation():void {
			assertTrue(ClassUtils.isImplementationOf(InterfaceImplementation, Interface));
		}

		public function testIsImplementationOf_shouldReturnTrueForSubInterface():void {
			assertTrue(ClassUtils.isImplementationOf(ISubInterface, Interface));
		}

		public function testIsImplementationOf_shouldReturnFalseForSameInterface():void {
			assertFalse(ClassUtils.isImplementationOf(Interface, Interface));
		}

		// --------------------------------------------------------------------
		// isInformalImplementationOf
		// --------------------------------------------------------------------

		public function testIsInformalImplementationOf_shouldReturnTrueForInterfaceImplementation():void {
			assertTrue(ClassUtils.isInformalImplementationOf(InterfaceImplementation, Interface));
		}

		public function testIsInformalImplementationOf_shouldReturnTrueForInformalInterfaceImplementation():void {
			assertTrue(ClassUtils.isInformalImplementationOf(InformalInterfaceImplementation, Interface));
		}

		public function testIsInformalImplementationOf_shouldReturnFalseForIncompleteInterfaceImplementation():void {
			assertFalse(ClassUtils.isInformalImplementationOf(IncompleteInterfaceImplementation, Interface));
		}

		public function testIsInformalImplementationOf_shouldReturnFalseForIncorrectInterfaceImplementation():void {
			assertFalse(ClassUtils.isInformalImplementationOf(IncorrectInterfaceImplementation, Interface));
		}

		// --------------------------------------------------------------------
		// isInterface
		// --------------------------------------------------------------------

		public function testIsInterface_withInterface():void {
			assertTrue(ClassUtils.isInterface(Interface));
		}

		public function testIsInterface_withSubInterface():void {
			assertTrue(ClassUtils.isInterface(ISubInterface));
		}

		public function testIsInterface_withObjectClass():void {
			assertFalse(ClassUtils.isInterface(Object));
		}

		public function testIsInterface_withComplexClass():void {
			assertFalse(ClassUtils.isInterface(ComplexClass));
		}

		public function testIsInterface_withPublicSubClass():void {
			assertFalse(ClassUtils.isInterface(PublicSubClass));
		}

		public function testIsInterface_withInterfaceImplementation():void {
			assertFalse(ClassUtils.isInterface(InterfaceImplementation));
		}

		public function testIsInterface_withSubInterfaceImplementation():void {
			assertFalse(ClassUtils.isInterface(SubInterfaceImplementation));
		}

		public function testGetClassParameterFromFullyQualifiedName():void {
			var cls:Class = ClassUtils.getClassParameterFromFullyQualifiedName('org.as3commons.lang.testclasses.ComplexClass');
			assertNull(cls);
			cls = ClassUtils.getClassParameterFromFullyQualifiedName('__AS3__.vec::Vector.<org.as3commons.lang.testclasses::ComplexClass>');
			assertNotNull(cls);
			assertStrictlyEquals(ComplexClass, cls);
		}

	}
}

class PrivateClass {

	public function PrivateClass() {
	}
}
