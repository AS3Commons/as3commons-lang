/*
 * Copyright (c) 2007-2009-2010 the original author or authors
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
package org.as3commons.lang.testclasses {
	
	/**
	 * @author Christophe Herreman
	 */
	public class PublicClass {
		
		public static const STATIC_CONST_PUBLIC:String = "static_const_public";
		
		public static const STATIC_CONST_PUBLIC2:String = "static_const_public2";
		
		protected static const STATIC_CONST_PROTECTED:String = "static_const_protected";
		
		private static const STATIC_CONST_PRIVATE:String = "static_const_private";
		
		public static var staticVarPublic:String = "staticVarPublic";
		
		public static var staticVarPublic2:String = "staticVarPublic2";
		
		public static var staticVarPublic3:String = "staticVarPublic3";
		
		protected static var staticVarProtected:String = "staticVarProtected";
		
		private static var staticVarPrivate:String = "staticVarPrivate";
		
		public const CONST_PUBLIC:String = "const_public";
		
		protected const CONST_PROTECTED:String = "const_protected";
		
		private const CONST_PRIVATE:String = "const_private";
		
		public var varPublic:String = "varPublic";
		
		public var varPublic2:String = "varPublic2";
		
		public var varPublic3:String = "varPublic3";
		
		public var varPublic4:String = "varPublic4";
		
		protected var varProtected:String = "varProtected";
		
		private var varPrivate:String = "varPrivate";
		
		public function PublicClass() {
		}
		
		public function method1():void {
			trace("method1 was invoked");
		}
		
		public function method2(p1:String):void {
		}
		
		public function method3(p1:int):void {
		}
		
		public function method4(p1:*):void {
		}
		
		public function method5(... rest):* {
			trace("method5 was invoked with arguments: " + rest);
			return "test";
		}
		
		public function method6(p1:String, p2:int, p3:Boolean):uint {
			trace("method6 was invoked with arguments: " + arguments);
			trace("method6 p1: " + p1);
			trace("method6 p2: " + p2);
			trace("method6 p3: " + p3);
			return 25;
		}
		
		public function method7(p1:String = "empty", p2:int = 13, p3:Boolean = false):void {
		}
		
		public function get acc1():String {
			return "test";
		}
		
		public function set acc1(value:String):void {
		}
		
		public function get acc2():String {
			return "test";
		}
		
		public function set acc3(value:*):void {
		}
		
		public static function method1Static():void {
		}
		
		public static function method2Static(p1:String):void {
		}
		
		public static function method3Static(p1:int):void {
		}
		
		public static function method4Static(p1:*):void {
		}
		
		public static function method5Static(... rest):void {
		}
	}
}
