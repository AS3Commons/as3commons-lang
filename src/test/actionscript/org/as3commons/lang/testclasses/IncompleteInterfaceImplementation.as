package org.as3commons.lang.testclasses
{
	public class IncompleteInterfaceImplementation
	{
		public function IncompleteInterfaceImplementation()
		{
		}

		public function method1():void {
		}
		
		public function method2(p1:int, p2:String):Boolean {
			return false;
		}
		
		public function method3(p1:Number, ... rest):Object {
			return null;
		}
		
		// Intentionally missing the fourth method necessary to informally implement Interface 
	}
}
