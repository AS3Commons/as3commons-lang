package org.as3commons.lang.testclasses {
	
	import org.as3commons.lang.Enum;
	
	public class Day extends Enum {
		
		public static const MONDAY:Day = new Day("MONDAY");
		
		public static const TUESDAY:Day = new Day("TUESDAY");
		
		public static const WEDNESDAY:Day = new Day("WEDNESDAY");
		
		public static const THURSDAY:Day = new Day("THURSDAY");
		
		public static const FRIDAY:Day = new Day("FRIDAY");
		
		public static const SATURDAY:Day = new Day("SATURDAY");
		
		public static const SUNDAY:Day = new Day("SUNDAY");
		
		public static function get values():Array {
			return Enum.getValues(Day);
		}
		
		public function Day(name:String) {
			super(name);
		}
	}
}