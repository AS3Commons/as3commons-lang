package org.as3commons.lang.testclasses {
	
	public class InterfaceImplementation implements Interface {
		
		public function InterfaceImplementation() {
		}
		
		public function method1():void {
		}
		
		public function method2(p1:int, p2:String):Boolean {
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