package org.as3commons.lang.testclasses {
	
	import org.as3commons.lang.IEquals;
	
	public class EqualsImplementation implements IEquals {
		
		public var a:String;
		
		public function EqualsImplementation(a:String = "") {
			this.a = a;
		}
		
		public function equals(other:Object):Boolean {
			if (this == other) {
				return true;
			}
			
			if (!(other is EqualsImplementation)) {
				return false;
			}
			
			var that:EqualsImplementation = EqualsImplementation(other);
			return (a === that.a);
		}
	}
}