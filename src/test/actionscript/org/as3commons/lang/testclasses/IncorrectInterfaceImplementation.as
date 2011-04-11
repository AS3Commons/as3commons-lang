package org.as3commons.lang.testclasses
{
	public class IncorrectInterfaceImplementation
	{
		public function IncorrectInterfaceImplementation()
		{
		}
		
		public function method1():void {
		}
		
		// Intentionally has parameter types that differ from that of Interface.method2 
		public function method2(p1:Boolean, p2:Object):Boolean {
			return false;
		}
		
		public function method3(p1:Number, ... rest):Object {
			return null;
		}
		
		public function method4(p1:uint, p2:Class):* {
			return null;
		}
	}
}
