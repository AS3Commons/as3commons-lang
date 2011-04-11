package org.as3commons.lang
{
import flexunit.framework.TestCase;

import org.as3commons.lang.testclasses.AbstractClass;
import org.as3commons.lang.testclasses.PublicClass;

public class AssertTest extends TestCase {
	
	public function AssertTest(methodName:String=null) {
		super(methodName);
	}
	
	public function testNotAbstract_Fail():void {
		try {
			Assert.notAbstract(new AbstractClass(), AbstractClass);
		} catch(e:Error) {
			assertTrue(e is IllegalArgumentError);
		}
	}
	
	public function testNotAbstract_Pass():void {
		try {
			Assert.notAbstract(new PublicClass(), AbstractClass);
		} catch(e:IllegalArgumentError) {
			fail(e.message);
		}
	}
}
}