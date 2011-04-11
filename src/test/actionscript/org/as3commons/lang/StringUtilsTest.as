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
	
	import flexunit.framework.TestCase;
	
	/**
	 * @author Steffen Leistner
	 * @author Christophe Herreman
	 */
	public class StringUtilsTest extends TestCase {
		
		public function testChomp():void {
			assertNull(StringUtils.chomp(null));
			assertEquals('', StringUtils.chomp(''));
			assertEquals('abc', StringUtils.chomp('abc\r'));
			assertEquals('abc', StringUtils.chomp('abc\n'));
			assertEquals('abc', StringUtils.chomp('abc\r\n'));
			assertEquals('abc\r\n', StringUtils.chomp('abc\r\n\r\n'));
			assertEquals('abc\n\rabc', StringUtils.chomp('abc\n\rabc'));
			assertEquals('', StringUtils.chomp('\r'));
			assertEquals('', StringUtils.chomp('\n'));
			assertEquals('', StringUtils.chomp('\r\n'));
		}
		
		public function testChompString():void {
			assertNull(StringUtils.chompString(null, '*'));
			assertEquals('', StringUtils.chompString('', '*'));
			assertEquals("chompString('foobar', 'bar')", 'foo', StringUtils.chompString('foobar', 'bar'));
			assertEquals('foobar', StringUtils.chompString('foobar', 'baz'));
			assertEquals('', StringUtils.chompString('foo', 'foo'));
			assertEquals('foo ', StringUtils.chompString('foo ', 'foo'));
			assertEquals(' ', StringUtils.chompString(' foo', 'foo'));
			assertEquals('foo', StringUtils.chompString('foo', 'foooo'));
			assertEquals('foo', StringUtils.chompString('foo', ''));
			assertEquals('foo', StringUtils.chompString('foo', null));
		}
		
		public function testTrim():void {
			assertNull(StringUtils.trim(null));
			assertEquals(StringUtils.trim(''), '');
			assertEquals(StringUtils.trim('     '), '');
			assertEquals(StringUtils.trim('abc'), 'abc');
			assertEquals(StringUtils.trim('    abc    '), 'abc');
		}
		
		public function testTrimToNull():void {
			assertEquals(StringUtils.trimToNull(null), null);
			assertEquals(StringUtils.trimToNull(""), null);
			assertEquals(StringUtils.trimToNull("     "), null);
			assertEquals(StringUtils.trimToNull("abc"), "abc");
			assertEquals(StringUtils.trimToNull("    abc    "), "abc");
		}
		
		public function testTrimToEmpty():void {
			assertEquals(StringUtils.trimToEmpty(null), "");
			assertEquals(StringUtils.trimToEmpty(""), "");
			assertEquals(StringUtils.trimToEmpty("     "), "");
			assertEquals(StringUtils.trimToEmpty("abc"), "abc");
			assertEquals(StringUtils.trimToEmpty("    abc    "), "abc");
		}
		
		public function testLeft():void {
			assertNull(StringUtils.left(null, 1));
			assertEquals(StringUtils.left('', -1), '');
			assertEquals(StringUtils.left('', 1), '');
			assertEquals(StringUtils.left('abc', 0), '');
			assertEquals(StringUtils.left('abc', 2), 'ab');
			assertEquals(StringUtils.left('abc', 4), 'abc');
		}
		
		public function testCenter():void {
			assertNull(StringUtils.center(null, 0, ''));
			assertEquals(StringUtils.center('', 4, ' '), '    ');
			assertEquals(StringUtils.center('ab', -1, ' '), 'ab');
			assertEquals(StringUtils.center('ab', 4, ' '), ' ab ');
			assertEquals(StringUtils.center('abcd', 2, ' '), 'abcd');
			assertEquals(StringUtils.center('a', 4, ' '), ' a  ');
			assertEquals(StringUtils.center('a', 4, 'yz'), 'yayz');
			assertEquals(StringUtils.center('abc', 7, null), '  abc  ');
			assertEquals(StringUtils.center('abc', 7, ''), '  abc  ');
		}
		
		public function testLeftPad():void {
			assertNull(StringUtils.leftPad(null, 0, ''));
			assertEquals(StringUtils.leftPad('', 3, 'z'), 'zzz');
			assertEquals(StringUtils.leftPad('bat', 3, 'yz'), 'bat');
			assertEquals(StringUtils.leftPad('bat', 5, 'yz'), 'yzbat');
			assertEquals(StringUtils.leftPad('bat', 8, 'yz'), 'yzyzybat');
			assertEquals(StringUtils.leftPad('bat', 1, 'yz'), 'bat');
			assertEquals(StringUtils.leftPad('bat', -1, 'yz'), 'bat');
			assertEquals(StringUtils.leftPad('bat', 5, null), '  bat');
			assertEquals(StringUtils.leftPad('bat', 5, ''), '  bat');
		}
		
		public function testLeftPadChar():void {
			assertNull(StringUtils.leftPadChar(null, 0, ''));
			assertEquals(StringUtils.leftPadChar('', 3, 'z'), 'zzz');
			assertEquals(StringUtils.leftPadChar('bat', 3, 'z'), 'bat');
			assertEquals(StringUtils.leftPadChar('bat', 5, 'z'), 'zzbat');
			assertEquals(StringUtils.leftPadChar('bat', 1, 'z'), 'bat');
			assertEquals(StringUtils.leftPadChar('bat', -1, 'z'), 'bat');
		}
		
		public function testRightPad():void {
			assertNull(StringUtils.rightPad(null, 0, ''));
			assertEquals(StringUtils.rightPad('', 3, 'z'), 'zzz');
			assertEquals(StringUtils.rightPad('bat', 3, 'yz'), 'bat');
			assertEquals(StringUtils.rightPad('bat', 5, 'yz'), 'batyz');
			assertEquals(StringUtils.rightPad('bat', 8, 'yz'), 'batyzyzy');
			assertEquals(StringUtils.rightPad('bat', 1, 'yz'), 'bat');
			assertEquals(StringUtils.rightPad('bat', -1, 'yz'), 'bat');
			assertEquals(StringUtils.rightPad('bat', 5, null), 'bat  ');
			assertEquals(StringUtils.rightPad('bat', 5, ''), 'bat  ');
		}
		
		public function testRightPadChar():void {
			assertNull(StringUtils.rightPadChar(null, 0, ''));
			assertEquals(StringUtils.rightPadChar('', 3, 'z'), 'zzz');
			assertEquals(StringUtils.rightPadChar('bat', 3, 'z'), 'bat');
			assertEquals(StringUtils.rightPadChar('bat', 5, 'z'), 'batzz');
			assertEquals(StringUtils.rightPadChar('bat', 1, 'z'), 'bat');
			assertEquals(StringUtils.rightPadChar('bat', -1, 'z'), 'bat');
		}
		
		public function testReplace():void {
			assertNull(StringUtils.replace(null, '', ''));
			assertEquals(StringUtils.replace('', '', ''), '');
			assertEquals(StringUtils.replace('any', null, ''), 'any');
			assertEquals(StringUtils.replace('any', '', null), 'any');
			assertEquals(StringUtils.replace('any', '', ''), 'any');
			assertEquals(StringUtils.replace('aba', 'a', null), 'aba');
			assertEquals(StringUtils.replace('aba', 'a', ''), 'b');
			assertEquals(StringUtils.replace('aba', 'a', 'z'), 'zbz');
		}
		
		public function testReplaceTo():void {
			assertNull(StringUtils.replaceTo(null, '', '', 0));
			assertEquals(StringUtils.replaceTo('', '', '', 0), '');
			assertEquals(StringUtils.replaceTo('any', null, '', 0), 'any');
			assertEquals(StringUtils.replaceTo('any', '', null, 0), 'any');
			assertEquals(StringUtils.replaceTo('any', '', '', 1), 'any');
			assertEquals(StringUtils.replaceTo('any', '', '', 0), 'any');
			assertEquals(StringUtils.replaceTo('abaa', 'a', null, -1), 'abaa');
			assertEquals(StringUtils.replaceTo('abaa', 'a', '', -1), 'b');
			assertEquals(StringUtils.replaceTo('abaa', 'a', 'z', 0), 'abaa');
			assertEquals(StringUtils.replaceTo('abaa', 'a', 'z', 1), 'zbaa');
			assertEquals(StringUtils.replaceTo('abaa', 'a', 'z', 2), 'zbza');
			assertEquals(StringUtils.replaceTo('abaa', 'a', 'z', -1), 'zbzz');
		}
		
		public function testReplaceOnce():void {
			assertNull(StringUtils.replaceOnce(null, '', ''));
			assertEquals(StringUtils.replaceOnce('', '', ''), '');
			assertEquals(StringUtils.replaceOnce('any', null, ''), 'any');
			assertEquals(StringUtils.replaceOnce('any', '', null), 'any');
			assertEquals(StringUtils.replaceOnce('any', '', ''), 'any');
			assertEquals(StringUtils.replaceOnce('aba', 'a', null), 'aba');
			assertEquals(StringUtils.replaceOnce('aba', 'a', ''), 'ba');
			assertEquals(StringUtils.replaceOnce('aba', 'a', 'z'), 'zba');
		}
		
		public function testIsEmpty():void {
			assertTrue(StringUtils.isEmpty(null));
			assertTrue(StringUtils.isEmpty(''));
			assertFalse(StringUtils.isEmpty(' '));
			assertFalse(StringUtils.isEmpty('bob'));
			assertFalse(StringUtils.isEmpty('  bob  '));
		}
		
		public function testIsNotEmpty():void {
			assertFalse(StringUtils.isNotEmpty(null));
			assertFalse(StringUtils.isNotEmpty(''));
			assertTrue(StringUtils.isNotEmpty(' '));
			assertTrue(StringUtils.isNotEmpty('bob'));
			assertTrue(StringUtils.isNotEmpty('  bob  '));
		}
		
		public function testIsBlank():void {
			assertTrue(StringUtils.isBlank(null));
			assertTrue(StringUtils.isBlank(''));
			assertTrue(StringUtils.isBlank(' '));
			assertFalse(StringUtils.isBlank('bob'));
			assertFalse(StringUtils.isBlank('  bob  '));
		}
		
		public function testIsNotBlank():void {
			assertFalse(StringUtils.isNotBlank(null));
			assertFalse(StringUtils.isNotBlank(''));
			assertFalse(StringUtils.isNotBlank(' '));
			assertTrue(StringUtils.isNotBlank('bob'));
			assertTrue(StringUtils.isNotBlank('  bob  '));
		}
		
		public function testCapitalize():void {
			assertNull(StringUtils.capitalize(null));
			assertEquals(StringUtils.capitalize(''), '');
			assertEquals(StringUtils.capitalize('cat'), 'Cat');
			assertEquals(StringUtils.capitalize('cAt'), 'CAt');
		}
		
		public function testUncapitalize():void {
			assertNull(StringUtils.uncapitalize(null));
			assertEquals(StringUtils.uncapitalize(''), '');
			assertEquals(StringUtils.uncapitalize('Cat'), 'cat');
			assertEquals(StringUtils.uncapitalize('CAT'), 'cAT');
		}
		
		public function testTitleize():void {
			assertNull(StringUtils.titleize(null));
			assertEquals('', StringUtils.titleize(""));
			assertEquals("Man From The Boondocks", StringUtils.titleize("man from the boondocks"));
			assertEquals("Man From The Boondocks", StringUtils.titleize("man from THE bOOndocks"));
		}
		
		public function testSubstringAfter():void {
			assertNull(StringUtils.substringAfter(null, ''));
			assertEquals(StringUtils.substringAfter('', ''), '');
			assertEquals(StringUtils.substringAfter('a', null), '');
			assertEquals(StringUtils.substringAfter('abc', 'a'), 'bc');
			assertEquals(StringUtils.substringAfter('abcba', 'b'), 'cba');
			assertEquals(StringUtils.substringAfter('abc', 'c'), '');
			assertEquals(StringUtils.substringAfter('abc', 'd'), '');
			assertEquals(StringUtils.substringAfter('abc', ''), 'abc');
		}
		
		public function testSubstringAfterLast():void {
			assertNull(StringUtils.substringAfterLast(null, ''));
			assertEquals(StringUtils.substringAfterLast('', 'a'), '');
			assertEquals(StringUtils.substringAfterLast('a', ''), '');
			assertEquals(StringUtils.substringAfterLast('a', null), '');
			assertEquals(StringUtils.substringAfterLast('abc', 'a'), 'bc');
			assertEquals(StringUtils.substringAfterLast('abcba', 'b'), 'a');
			assertEquals(StringUtils.substringAfterLast('abc', 'c'), '');
			assertEquals(StringUtils.substringAfterLast('a', 'a'), '');
			assertEquals(StringUtils.substringAfterLast('a', 'z'), '');
		}
		
		public function testSubstringBefore():void {
			assertNull(StringUtils.substringBefore(null, ''));
			assertEquals(StringUtils.substringBefore('', 'a'), '');
			assertEquals(StringUtils.substringBefore('abc', 'a'), '');
			assertEquals(StringUtils.substringBefore('abcba', 'b'), 'a');
			assertEquals(StringUtils.substringBefore('abc', 'c'), 'ab');
			assertEquals(StringUtils.substringBefore('abc', 'd'), 'abc');
			assertEquals(StringUtils.substringBefore('abc', ''), '');
			assertEquals(StringUtils.substringBefore('abc', null), 'abc');
		}
		
		public function testSubstringBeforeLast():void {
			assertNull(StringUtils.substringBeforeLast(null, 'a'));
			assertEquals(StringUtils.substringBeforeLast('', 'a'), '');
			assertEquals(StringUtils.substringBeforeLast('abcba', 'b'), 'abc');
			assertEquals(StringUtils.substringBeforeLast('abc', 'c'), 'ab');
			assertEquals(StringUtils.substringBeforeLast('a', 'a'), '');
			assertEquals(StringUtils.substringBeforeLast('a', 'z'), 'a');
			assertEquals(StringUtils.substringBeforeLast('a', null), 'a');
			assertEquals(StringUtils.substringBeforeLast('a', ''), 'a');
		}
		
		public function testSubstringBetween():void {
			assertNull(StringUtils.substringBetween(null, '', ''));
			assertEquals(StringUtils.substringBetween('', '', ''), '');
			assertNull(StringUtils.substringBetween('', '', 'tag'));
			assertNull(StringUtils.substringBetween('', 'tag', 'tag'));
			assertNull(StringUtils.substringBetween('yabcz', null, null));
			assertEquals(StringUtils.substringBetween('yabcz', '', ''), '');
			assertEquals(StringUtils.substringBetween('yabcz', 'y', 'z'), 'abc');
			assertEquals(StringUtils.substringBetween('yabczyabcz', 'y', 'z'), 'abc');
		}
		
		public function testStrip():void {
			assertNull(StringUtils.strip(null, ''));
			assertEquals("('', 'a')", '', StringUtils.strip('', 'a'));
			assertEquals("('abc', null)", 'abc', StringUtils.strip('abc', null));
			assertEquals("('  abc', null)", 'abc', StringUtils.strip('  abc', null));
			assertEquals("('abc  ', null)", 'abc', StringUtils.strip('abc  ', null));
			assertEquals("(' abc ', null)", 'abc', StringUtils.strip(' abc ', null));
			assertEquals("('  abcyx', 'yxz')", '  abc', StringUtils.strip('  abcyx', 'yxz'));
		}
		
		public function testStripStart():void {
			assertNull(StringUtils.stripStart(null, 'a'));
			assertEquals(StringUtils.stripStart('', 'a'), '');
			assertEquals(StringUtils.stripStart('abc', ''), 'abc');
			assertEquals(StringUtils.stripStart('abc', null), 'abc');
			assertEquals(StringUtils.stripStart('  abc', null), 'abc');
			assertEquals(StringUtils.stripStart('abc  ', null), 'abc  ');
			assertEquals(StringUtils.stripStart(' abc ', null), 'abc ');
			assertEquals(StringUtils.stripStart('yxabc  ', 'xyz'), 'abc  ');
		}
		
		public function testStripEnd():void {
			assertNull(StringUtils.stripEnd(null, 'a'));
			assertEquals(StringUtils.stripEnd('', 'a'), '');
			assertEquals(StringUtils.stripEnd('abc', ''), 'abc');
			assertEquals(StringUtils.stripEnd('abc', null), 'abc');
			assertEquals(StringUtils.stripEnd('  abc', null), '  abc');
			assertEquals(StringUtils.stripEnd('abc  ', null), 'abc');
			assertEquals(StringUtils.stripEnd(' abc ', null), ' abc');
			assertEquals(StringUtils.stripEnd('  abcyx', 'xyz'), '  abc');
		}
		
		public function testAbbreviate():void {
			assertNull(StringUtils.abbreviate(null, 1, 1));
			assertEquals(StringUtils.abbreviate('', 0, 4), '');
			assertEquals(StringUtils.abbreviate('abcdefghijklmno', -1, 10), 'abcdefg...');
			assertEquals(StringUtils.abbreviate('abcdefghijklmno', 0, 10), 'abcdefg...');
			assertEquals(StringUtils.abbreviate('abcdefghijklmno', 1, 10), 'abcdefg...');
			assertEquals(StringUtils.abbreviate('abcdefghijklmno', 4, 10), 'abcdefg...');
			assertEquals(StringUtils.abbreviate('abcdefghijklmno', 5, 10), '...fghi...');
			assertEquals(StringUtils.abbreviate('abcdefghijklmno', 6, 10), '...ghij...');
			assertEquals(StringUtils.abbreviate('abcdefghijklmno', 8, 10), '...ijklmno');
			assertEquals(StringUtils.abbreviate('abcdefghijklmno', 10, 10), '...ijklmno');
			assertEquals(StringUtils.abbreviate('abcdefghijklmno', 12, 10), '...ijklmno');
			
			try {
				StringUtils.abbreviate('abcdefghij', 0, 3);
				fail('must throw IllegalArgumentError');
			} catch (e:IllegalArgumentError) {
			}
			
			try {
				StringUtils.abbreviate('abcdefghij', 0, 3);
				fail('must throw IllegalArgumentError');
			} catch (e:IllegalArgumentError) {
			}
		}
		
		public function testOrdinalIndexOf():void {
			assertEquals(StringUtils.ordinalIndexOf(null, 'm', 1), -1);
			assertEquals(StringUtils.ordinalIndexOf('m', null, 1), -1);
			assertEquals(StringUtils.ordinalIndexOf('', '', 1), 0);
			assertEquals(StringUtils.ordinalIndexOf('aabaabaa', 'a', 1), 0);
			assertEquals(StringUtils.ordinalIndexOf('aabaabaa', 'a', 2), 1);
			assertEquals(StringUtils.ordinalIndexOf('aabaabaa', 'b', 1), 2);
			assertEquals(StringUtils.ordinalIndexOf('aabaabaa', 'b', 2), 5);
			assertEquals(StringUtils.ordinalIndexOf('aabaabaa', 'ab', 1), 1);
			assertEquals(StringUtils.ordinalIndexOf('aabaabaa', 'ab', 2), 4);
			assertEquals(StringUtils.ordinalIndexOf('aabaabaa', '', 1), 0);
			assertEquals(StringUtils.ordinalIndexOf('aabaabaa', '', 2), 0);
		}
		
		public function testCountMatches():void {
			assertEquals(0, StringUtils.countMatches(null, 'm'));
			assertEquals(0, StringUtils.countMatches('', 'm'));
			assertEquals(0, StringUtils.countMatches('abba', null));
			assertEquals(0, StringUtils.countMatches('abba', ''));
			assertEquals(2, StringUtils.countMatches('abba', 'a'));
			assertEquals(1, StringUtils.countMatches('abba', 'ab'));
			assertEquals(0, StringUtils.countMatches('abba', 'xxx'));
		}
		
		public function testContains():void {
			assertFalse(StringUtils.contains(null, 'm'));
			assertFalse(StringUtils.contains('m', null));
			assertTrue(StringUtils.contains('', ''));
			assertTrue(StringUtils.contains('abc', ''));
			assertTrue(StringUtils.contains('abc', 'a'));
			assertFalse(StringUtils.contains('abc', 'z'));
		}
		
		public function testContainsIgnoreCase():void {
			assertFalse(StringUtils.containsIgnoreCase(null, 'm'));
			assertFalse(StringUtils.containsIgnoreCase('m', null));
			assertTrue(StringUtils.containsIgnoreCase('', ''));
			assertTrue(StringUtils.containsIgnoreCase('abc', ''));
			assertTrue(StringUtils.containsIgnoreCase('abc', 'A'));
			assertFalse(StringUtils.containsIgnoreCase('abc', 'Z'));
		}		
		
		public function testContainsNone():void {
			assertTrue('containsNone(null, "m")', StringUtils.containsNone(null, 'm'));
			assertTrue('containsNone("m", null)', StringUtils.containsNone('m', null));
			assertTrue('containsNone("", "m")', StringUtils.containsNone('', 'm'));
			assertTrue('containsNone("ab", "")', StringUtils.containsNone('ab', ''));
			assertTrue('containsNone("abab", "xyz")', StringUtils.containsNone('abab', 'xyz'));
			assertTrue('containsNone("ab1", "xyz")', StringUtils.containsNone('ab1', 'xyz'));
			assertFalse('containsNone("abz", "xyz")', StringUtils.containsNone('abz', 'xyz'));
		}
		
		public function testContainsOnly():void {
			assertFalse(StringUtils.containsOnly(null, 'm'));
			assertFalse(StringUtils.containsOnly('m', null));
			assertTrue(StringUtils.containsOnly('', 'm'));
			assertFalse(StringUtils.containsOnly('ab', ''));
			assertTrue(StringUtils.containsOnly('abab', 'abc'));
			assertFalse(StringUtils.containsOnly('ab1', 'abc'));
			assertFalse(StringUtils.containsOnly('abz', 'abc'));
		}
		
		public function testIndexOfAny():void {
			assertEquals(StringUtils.indexOfAny(null, 'm'), -1);
			assertEquals(StringUtils.indexOfAny('', 'm'), -1);
			assertEquals(StringUtils.indexOfAny('m', null), -1);
			assertEquals(StringUtils.indexOfAny('m', ''), -1);
			assertEquals(StringUtils.indexOfAny('zzabyycdxx', 'za'), 0);
			assertEquals(StringUtils.indexOfAny('zzabyycdxx', 'by'), 3);
			assertEquals(StringUtils.indexOfAny('aba', 'z'), -1);
		}
		
		public function testIndexOfAnyBut():void {
			assertEquals("(null, 'm')", -1, StringUtils.indexOfAnyBut(null, 'm'));
			assertEquals("('', 'm')", -1, StringUtils.indexOfAnyBut('', 'm'));
			assertEquals("('abc', null)", -1, StringUtils.indexOfAnyBut('abc', null));
			assertEquals("('abc', '')", -1, StringUtils.indexOfAnyBut('abc', ''));
			assertEquals("('zzabyycdxx', 'za')", 3, StringUtils.indexOfAnyBut('zzabyycdxx', 'za'));
			assertEquals("('aba', 'ab')", -1, StringUtils.indexOfAnyBut('aba', 'ab'))
		}
		
		public function testDifference():void {
			assertNull(StringUtils.difference(null, null));
			assertEquals(StringUtils.difference('', ''), '');
			assertEquals(StringUtils.difference('', 'abc'), 'abc');
			assertEquals(StringUtils.difference('abc', ''), '');
			assertEquals(StringUtils.difference('abc', 'abc'), '');
			assertEquals(StringUtils.difference('ab', 'abxyz'), 'xyz');
			assertEquals(StringUtils.difference('abcde', 'abxyz'), 'xyz');
			assertEquals(StringUtils.difference('abcde', 'xyz'), 'xyz');
		}
		
		public function testIndexOfDifference():void {
			assertEquals(StringUtils.indexOfDifference(null, null), -1);
			assertEquals(StringUtils.indexOfDifference('', ''), -1);
			assertEquals(StringUtils.indexOfDifference('abc', ''), 0);
			assertEquals(StringUtils.indexOfDifference('', 'abc'), 0);
			assertEquals(StringUtils.indexOfDifference('abc', 'abc'), -1);
			assertEquals(StringUtils.indexOfDifference('ab', 'abxyz'), 2);
			assertEquals(StringUtils.indexOfDifference('abcde', 'abxyz'), 2);
			assertEquals(StringUtils.indexOfDifference('abcde', 'xyz'), 0);
		}
		
		public function testEquals():void {
			assertTrue(StringUtils.equals(null, null));
			assertFalse(StringUtils.equals(null, 'abc'));
			assertFalse(StringUtils.equals('abc', null));
			assertTrue(StringUtils.equals('abc', 'abc'));
			assertFalse(StringUtils.equals('abc', 'ABC'));
			assertFalse(StringUtils.equals('in', 'notin'));
		}
		
		public function testEqualsIgnoreCase():void {
			assertTrue(StringUtils.equalsIgnoreCase(null, null));
			assertFalse(StringUtils.equalsIgnoreCase(null, 'abc'));
			assertFalse(StringUtils.equalsIgnoreCase('abc', null));
			assertTrue(StringUtils.equalsIgnoreCase('abc', 'abc'));
			assertTrue(StringUtils.equalsIgnoreCase('abc', 'ABC'));
			assertFalse(StringUtils.equalsIgnoreCase('in', 'notin'));
			assertFalse(StringUtils.equalsIgnoreCase('in', 'NOTIN'));
		}
		
		public function testIsAlpha():void {
			assertFalse(StringUtils.isAlpha(null));
			assertTrue(StringUtils.isAlpha(''));
			assertFalse(StringUtils.isAlpha('  '));
			assertTrue(StringUtils.isAlpha('abc'));
			assertFalse(StringUtils.isAlpha('ab2c'));
			assertFalse(StringUtils.isAlpha('ab-c'));
		}
		
		public function testIsAlphaSpace():void {
			assertFalse(StringUtils.isAlphaSpace(null));
			assertTrue(StringUtils.isAlphaSpace('  '));
			assertTrue(StringUtils.isAlphaSpace(''));
			assertTrue(StringUtils.isAlphaSpace('abc'));
			assertTrue(StringUtils.isAlphaSpace('ab c'));
			assertFalse(StringUtils.isAlphaSpace('ab2c'));
			assertFalse(StringUtils.isAlphaSpace('ab-c'));
		}
		
		public function testIsAlphanumeric():void {
			assertFalse(StringUtils.isAlphanumeric(null));
			assertTrue(StringUtils.isAlphanumeric(''));
			assertFalse(StringUtils.isAlphanumeric('  '));
			assertTrue(StringUtils.isAlphanumeric('abc'));
			assertFalse(StringUtils.isAlphanumeric('ab c'));
			assertTrue(StringUtils.isAlphanumeric('ab2c'));
			assertFalse(StringUtils.isAlphanumeric('ab-c'));
		}
		
		public function testIsAlphanumericSpace():void {
			assertFalse(StringUtils.isAlphanumericSpace(null));
			assertTrue(StringUtils.isAlphanumericSpace('  '));
			assertTrue(StringUtils.isAlphanumericSpace(''));
			assertTrue(StringUtils.isAlphanumericSpace('abc'));
			assertTrue(StringUtils.isAlphanumericSpace('ab c'));
			assertTrue(StringUtils.isAlphanumericSpace('ab2c'));
			assertFalse(StringUtils.isAlphanumericSpace('ab-c'));
		}
		
		public function testIsNumeric():void {
			assertFalse(StringUtils.isNumeric(null));
			assertTrue(StringUtils.isNumeric(''));
			assertFalse(StringUtils.isNumeric('  '));
			assertTrue(StringUtils.isNumeric('123'));
			assertFalse(StringUtils.isNumeric('12 3'));
			assertFalse(StringUtils.isNumeric('ab2c'));
			assertFalse(StringUtils.isNumeric('12-3'));
			assertFalse(StringUtils.isNumeric('12.3'));
		}
		
		public function testIsNumericSpace():void {
			assertFalse(StringUtils.isNumericSpace(null));
			assertTrue(StringUtils.isNumericSpace(''));
			assertTrue(StringUtils.isNumericSpace('  '));
			assertTrue(StringUtils.isNumericSpace('123'));
			assertTrue(StringUtils.isNumericSpace('12 3'));
			assertFalse(StringUtils.isNumericSpace('ab2c'));
			assertFalse(StringUtils.isNumericSpace('12-3'));
			assertFalse(StringUtils.isNumericSpace('12.3'));
		}
		
		public function testIsWhitespace():void {
			assertFalse(StringUtils.isWhitespace(null));
			assertTrue(StringUtils.isWhitespace(''));
			assertTrue(StringUtils.isWhitespace('  '));
			assertFalse(StringUtils.isWhitespace('abc'));
			assertFalse(StringUtils.isWhitespace('ab2c'));
			assertFalse(StringUtils.isWhitespace('ab-c'));
		}
		
		public function testOverlay():void {
			assertNull(StringUtils.overlay(null, 'm', 0, 0));
			assertEquals(StringUtils.overlay('', 'abc', 0, 0), 'abc');
			assertEquals(StringUtils.overlay('abcdef', null, 2, 4), 'abef');
			assertEquals(StringUtils.overlay('abcdef', '', 2, 4), 'abef');
			assertEquals(StringUtils.overlay('abcdef', '', 4, 2), 'abef');
			assertEquals(StringUtils.overlay('abcdef', 'zzzz', 2, 4), 'abzzzzef');
			assertEquals(StringUtils.overlay('abcdef', 'zzzz', 4, 2), 'abzzzzef');
			assertEquals(StringUtils.overlay('abcdef', 'zzzz', -1, 4), 'zzzzef');
			assertEquals(StringUtils.overlay('abcdef', 'zzzz', 2, 8), 'abzzzz');
			assertEquals(StringUtils.overlay('abcdef', 'zzzz', -2, -3), 'zzzzabcdef');
			assertEquals(StringUtils.overlay('abcdef', 'zzzz', 8, 10), 'abcdefzzzz');
		}
		
		public function testDeleteWhitespace():void {
			assertEquals(StringUtils.deleteWhitespace(null), null);
			assertEquals(StringUtils.deleteWhitespace(''), '');
			assertEquals(StringUtils.deleteWhitespace('abc'), 'abc');
			assertEquals(StringUtils.deleteWhitespace('   ab  c  '), 'abc');
		}
		
		public function testDeleteSpaces():void {
			assertEquals(StringUtils.deleteSpaces(null), null);
			assertEquals(StringUtils.deleteSpaces(''), '');
			assertEquals(StringUtils.deleteSpaces('abc'), 'abc');
			assertEquals(StringUtils.deleteSpaces(' \tabc \n '), ' abc  ');
			assertEquals(StringUtils.deleteSpaces('a\nb\tc  '), 'abc  ');
		}
		
		public function testRemove():void {
			assertNull(StringUtils.remove(null, 'm'));
			assertEquals("('', 'm')", '', StringUtils.remove('', 'm'));
			assertEquals("('m', null)", 'm', StringUtils.remove('m', null));
			assertEquals("('m', '')", 'm', StringUtils.remove('m', ''));
			assertEquals("('queued', 'ue')", 'qd', StringUtils.remove('queued', 'ue'));
			assertEquals("('queued', 'zz')", 'queued', StringUtils.remove('queued', 'zz'));
		}
		
		public function testRemoveEnd():void {
			assertNull(StringUtils.removeEnd(null, 'm'));
			assertEquals(StringUtils.removeEnd('', 'm'), '');
			assertEquals(StringUtils.removeEnd('m', null), 'm');
			assertEquals(StringUtils.removeEnd('www.domain.com', '.com'), 'www.domain');
			assertEquals(StringUtils.removeEnd('www.domain.com', 'domain'), 'www.domain.com');
			assertEquals(StringUtils.removeEnd('abc', ''), 'abc');
		}
		
		public function testRemoveStart():void {
			assertNull(StringUtils.removeStart(null, 'm'));
			assertEquals(StringUtils.removeStart('', 'm'), '');
			assertEquals(StringUtils.removeStart('m', null), 'm');
			assertEquals(StringUtils.removeStart('www.domain.com', 'www.'), 'domain.com');
			assertEquals(StringUtils.removeStart('domain.com', 'www.'), 'domain.com');
			assertEquals(StringUtils.removeStart('abc', ''), 'abc');
		}
		
		public function testEndsWith():void {
			assertFalse(StringUtils.endsWith(null, 'm'));
			assertFalse(StringUtils.endsWith(null, null));
			assertFalse(StringUtils.endsWith('m', null));
			assertTrue(StringUtils.endsWith('www.domain.com', 'com'));
		}
		
		public function testEndsWithIgnoreCase():void {
			assertFalse(StringUtils.endsWithIgnoreCase(null, 'm'));
			assertFalse(StringUtils.endsWithIgnoreCase(null, null));
			assertFalse(StringUtils.endsWithIgnoreCase('m', null));
			assertTrue(StringUtils.endsWithIgnoreCase('www.domain.com', 'Com'));
		}		
		
		public function testStartsWith():void {
			assertFalse(StringUtils.startsWith(null, 'm'));
			assertFalse(StringUtils.startsWith(null, null));
			assertFalse(StringUtils.startsWith('m', null));
			assertTrue(StringUtils.startsWith('www.domain.com', 'www.'));
		}

		public function testStartsWithIgnoreCase():void {
			assertFalse(StringUtils.startsWithIgnoreCase(null, 'm'));
			assertFalse(StringUtils.startsWithIgnoreCase(null, null));
			assertFalse(StringUtils.startsWithIgnoreCase('m', null));
			assertTrue(StringUtils.startsWithIgnoreCase('www.domain.com', 'wWw.'));
		}
		
		//=====================================================================
		// addAt(string:String, value:*, position:int):String
		//=====================================================================
		public function testAddAt():void {
			var s:String = "This is a test";
			var s2:String = StringUtils.addAt(s, "string ", 10);
			assertEquals("This is a string test", s2);
		}
		
		public function testAddAtWithIndexOutOfBounds():void {
			var s:String = "This is a test";
			var s2:String = StringUtils.addAt(s, " for index out of bounds", 10000);
			assertEquals("This is a test for index out of bounds", s2);
		}
		
		public function testAddAtWithNegativeIndex():void {
			var s:String = "This is a test";
			var s2:String = StringUtils.addAt(s, "Negative index. ", -1);
			assertEquals("Negative index. This is a test", s2);
		}
		
		//=====================================================================
		// replaceAt(string:String, value:*, beginIndex:int, endIndex:int):String
		//=====================================================================
		public function testReplaceAt():void {
			var s:String = "This is a test.";
			var s2:String = StringUtils.replaceAt(s, "was", 5, 7);
			assertEquals("This was a test.", s2);
		}
		
		public function testReplaceAtWithEndIndexOutOfBounds():void {
			var s:String = "This is a test.";
			var s2:String = StringUtils.replaceAt(s, "was", 5, 10000);
			assertEquals("This was", s2);
		}
		
		public function testReplaceAtWithNegativeBeginIndex():void {
			var s:String = "This is a test.";
			var s2:String = StringUtils.replaceAt(s, "That", -1, 4);
			assertEquals("That is a test.", s2);
		}
		
		//=====================================================================
		// tokenizeToArray(string:String, delimiters:String):Array
		//=====================================================================
		public function testTokenizeToArray():void {
			var tokens:Array = StringUtils.tokenizeToArray("This is a test", " ");
			assertNotNull(tokens);
			assertEquals(4, tokens.length);
			assertEquals("This", tokens[0]);
			assertEquals("is", tokens[1]);
			assertEquals("a", tokens[2]);
			assertEquals("test", tokens[3]);
		}
		
		public function testTokenizeToArray2():void {
			var tokens:Array = StringUtils.tokenizeToArray("a,b;c d", ",; ");
			assertNotNull(tokens);
			assertEquals(4, tokens.length);
			assertEquals("a", tokens[0]);
			assertEquals("b", tokens[1]);
			assertEquals("c", tokens[2]);
			assertEquals("d", tokens[3]);
		}

        //=====================================================================
        // isValidFileName(string:String):Boolean
        //=====================================================================
		public function testIsFileNameValid():void {
			assertTrue(StringUtils.isValidFileName("GoodFileName.csv"));
			assertFalse(StringUtils.isValidFileName(null));
			assertFalse(StringUtils.isValidFileName(""));
			assertFalse(StringUtils.isValidFileName("/.csv"));
			assertFalse(StringUtils.isValidFileName("\\.csv"));
			assertFalse(StringUtils.isValidFileName(":.csv"));
			assertFalse(StringUtils.isValidFileName("*.csv"));
			assertFalse(StringUtils.isValidFileName("?.csv"));
			assertFalse(StringUtils.isValidFileName("\".csv"));
			assertFalse(StringUtils.isValidFileName("<.csv"));
			assertFalse(StringUtils.isValidFileName(">.csv"));
			assertFalse(StringUtils.isValidFileName("|.csv"));
			assertFalse(StringUtils.isValidFileName("%.csv"));
		}

	}
}