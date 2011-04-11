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
	 * @author James Ghandour
	 */
	public class DateUtilsTest extends TestCase {

		private static const YEAR:int=2005;
		private static const MONTH:int=2;
		private static const DAY_OF_MONTH:int=4;
		private static const HOUR:int=5;
		private static const MINUTE:int=12;
		private static const SECOND:int=30;
		private static const MILLIS:int=500;
		private static const CONTROL_DATE:Date=new Date(YEAR, MONTH, DAY_OF_MONTH, HOUR, MINUTE, SECOND, MILLIS);

		public function DateUtilsTest(methodName:String=null) {
			super(methodName);
		}

		/*
		 *  Comparison Functions
		 */
		public function testIsSameDay():void {
			assertTrue(DateUtils.isSameDay(new Date(), new Date()));
			assertTrue(DateUtils.isSameDay(CONTROL_DATE, CONTROL_DATE));
			assertFalse(DateUtils.isSameDay(new Date(), CONTROL_DATE));

			var wrongMillisDate:Date=cloneDate(CONTROL_DATE);
			wrongMillisDate.setMilliseconds(MILLIS - 50);
			assertTrue(DateUtils.isSameDay(CONTROL_DATE, wrongMillisDate));

			var wrongSecsDate:Date=cloneDate(CONTROL_DATE);
			wrongSecsDate.setSeconds(SECOND + 1);
			assertTrue(DateUtils.isSameDay(CONTROL_DATE, wrongSecsDate));

			var wrongMinutesDate:Date=cloneDate(CONTROL_DATE);
			wrongMinutesDate.setMinutes(MINUTE + 1);
			assertTrue(DateUtils.isSameDay(CONTROL_DATE, wrongMinutesDate));

			var wrongHourDate:Date=cloneDate(CONTROL_DATE);
			wrongHourDate.setHours(HOUR + 1);
			assertTrue(DateUtils.isSameDay(CONTROL_DATE, wrongHourDate));

			var wrongDateDate:Date=cloneDate(CONTROL_DATE);
			wrongDateDate.setDate(DAY_OF_MONTH - 1);
			assertFalse(DateUtils.isSameDay(CONTROL_DATE, wrongDateDate));

			var wrongMonthDate:Date=cloneDate(CONTROL_DATE);
			wrongMonthDate.setDate(MONTH - 1);
			assertFalse(DateUtils.isSameDay(CONTROL_DATE, wrongMonthDate));

			var wrongYearDate:Date=cloneDate(CONTROL_DATE);
			wrongYearDate.setFullYear(YEAR + 1);
			assertFalse(DateUtils.isSameDay(CONTROL_DATE, wrongYearDate));

			try {
				DateUtils.isSameDay(new Date(), null);
				fail();
			} catch (iae:IllegalArgumentError) {
			}

			try {
				DateUtils.isSameDay(null, new Date());
				fail();
			} catch (iae:IllegalArgumentError) {
			}

			try {
				DateUtils.isSameDay(null, null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}

		}

		public function testIsSameInstant():void {
			var date:Date=new Date();
			assertTrue(DateUtils.isSameInstant(CONTROL_DATE, CONTROL_DATE));
			assertFalse(DateUtils.isSameInstant(CONTROL_DATE, new Date()));
			assertTrue(DateUtils.isSameInstant(date, cloneDate(date)));
			//removed this test because it is unreliable, it sometimes passes, sometimes fails
			//assertTrue(DateUtils.isSameInstant(date, new Date()));
		}


		/*
		 *  Add Functions
		 */
		public function testAddYears():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.setFullYear(expectedDate.fullYear + 1, expectedDate.month, expectedDate.date);
			var actualDate:Date=DateUtils.addYears(CONTROL_DATE, 1);
			assertSameDateInstant(expectedDate, actualDate);

			expectedDate=cloneDate(CONTROL_DATE);
			expectedDate.setFullYear(expectedDate.fullYear - 5, expectedDate.month, expectedDate.date);
			actualDate=DateUtils.addYears(CONTROL_DATE, -5);
			assertSameDateInstant(expectedDate, actualDate);

			// Leap Year Feb 29 + 1 year = Feb 28
			expectedDate=new Date(2001, 1, 28);
			actualDate=new Date(2000, 1, 29);
			actualDate=DateUtils.addYears(actualDate, 1);
			assertSameDateInstant(expectedDate, actualDate);

			// Leap Year Feb 29 + 4 years = Feb 29
			expectedDate=new Date(2004, 1, 29);
			actualDate=new Date(2000, 1, 29);
			actualDate=DateUtils.addYears(actualDate, 4);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.addYears(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testAddMonths():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.setMonth(expectedDate.month + 1, expectedDate.date);
			var actualDate:Date=DateUtils.addMonths(CONTROL_DATE, 1);
			assertSameDateInstant(expectedDate, actualDate);

			expectedDate=cloneDate(CONTROL_DATE);
			expectedDate.setMonth(expectedDate.month - 1, expectedDate.date);
			actualDate=DateUtils.addMonths(CONTROL_DATE, -1);
			assertSameDateInstant(expectedDate, actualDate);

			// Leap Year Feb 29 + 1 month = March 29
			expectedDate=new Date(2000, 2, 29);
			actualDate=new Date(2000, 1, 29);
			actualDate=DateUtils.addMonths(actualDate, 1);
			assertSameDateInstant(expectedDate, actualDate);

			// Leap Year Feb 29 + 4 years = Feb 29
			expectedDate=new Date(2004, 1, 29);
			actualDate=new Date(2000, 1, 29);
			actualDate=DateUtils.addMonths(actualDate, 4 * 12);
			assertSameDateInstant(expectedDate, actualDate);

			// Non Leap Year Dec 31 + 2 month = Feb 28
			expectedDate=new Date(2006, 1, 28);
			actualDate=new Date(2005, 9, 31);
			actualDate=DateUtils.addMonths(actualDate, 4);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.addMonths(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testAddWeeks():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.date+=7;
			var actualDate:Date=DateUtils.addWeeks(CONTROL_DATE, 1);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.addWeeks(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testAddDays():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.date++;
			var actualDate:Date=DateUtils.addDays(CONTROL_DATE, 1);
			assertSameDateInstant(expectedDate, actualDate);

			// Daily Savings Time
			expectedDate=cloneDate(CONTROL_DATE);
			expectedDate.setMonth(expectedDate.month + 1, expectedDate.date + 9);
            expectedDate = new Date(expectedDate.getTime() + DateUtils.MILLIS_PER_HOUR);
			actualDate=DateUtils.addDays(CONTROL_DATE, 40);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.addDays(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testAddHours():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.hours++;
			var actualDate:Date=DateUtils.addHours(CONTROL_DATE, 1);
			assertSameDateInstant(expectedDate, actualDate);

			expectedDate=cloneDate(CONTROL_DATE);
			expectedDate.hours+=1;
			expectedDate.date+=1;
			actualDate=DateUtils.addHours(CONTROL_DATE, 25);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.addHours(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testAddMinutes():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.minutes++;
			var actualDate:Date=DateUtils.addMinutes(CONTROL_DATE, 1);
			assertSameDateInstant(expectedDate, actualDate);

			expectedDate=cloneDate(CONTROL_DATE);
			expectedDate.minutes+=1;
			expectedDate.hours+=1;
			actualDate=DateUtils.addMinutes(CONTROL_DATE, 61);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.addMinutes(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testAddSeconds():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.seconds++;
			var actualDate:Date=DateUtils.addSeconds(CONTROL_DATE, 1);
			assertSameDateInstant(expectedDate, actualDate);

			expectedDate=cloneDate(CONTROL_DATE);
			expectedDate.seconds+=1;
			expectedDate.minutes+=1;
			actualDate=DateUtils.addSeconds(CONTROL_DATE, 61);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.addSeconds(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testAddMilliseconds():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.milliseconds++;
			var actualDate:Date=DateUtils.addMilliseconds(CONTROL_DATE, 1);
			assertSameDateInstant(expectedDate, actualDate);

			expectedDate=cloneDate(CONTROL_DATE);
			expectedDate.milliseconds+=1;
			expectedDate.seconds+=1;
			actualDate=DateUtils.addMilliseconds(CONTROL_DATE, 1001);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.addMilliseconds(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}



		/*
		 * Set Functions
		 */
		public function testSetYear():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.setFullYear(YEAR + 1, MONTH, DAY_OF_MONTH);
			var actualDate:Date=DateUtils.setYear(cloneDate(CONTROL_DATE), YEAR + 1);
			assertSameDateInstant(expectedDate, actualDate);

			// Leap Year Feb 29 + 1 month = March 29
			expectedDate=new Date(2000, 2, 29);
			actualDate=new Date(1996, 2, 29);
			actualDate=DateUtils.setYear(actualDate, 2000);
			assertSameDateInstant(expectedDate, actualDate);

			// Leap Year Feb 29 + 1 years = Feb 28
			expectedDate=new Date(2001, 1, 28);
			actualDate=new Date(2000, 1, 29);
			actualDate=DateUtils.setYear(actualDate, 2001);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.setYear(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testSetMonth():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.setMonth(MONTH + 1, DAY_OF_MONTH);
			var actualDate:Date=DateUtils.setMonth(cloneDate(CONTROL_DATE), MONTH + 1);
			assertSameDateInstant(expectedDate, actualDate);

			// Leap Year Feb 29 + 1 month = March 29
			expectedDate=new Date(2000, 2, 29);
			actualDate=new Date(2000, 1, 29);
			actualDate=DateUtils.setMonth(actualDate, actualDate.month + 1);
			assertSameDateInstant(expectedDate, actualDate);

			// Leap Year Feb 29 + 4 years = Feb 29
			expectedDate=new Date(2004, 1, 29);
			actualDate=new Date(2000, 1, 29);
			actualDate=DateUtils.setMonth(actualDate, actualDate.month + 4 * 12);
			assertSameDateInstant(expectedDate, actualDate);

			// Non Leap Year Dec 31 + 2 month = Feb 28
			expectedDate=new Date(2006, 1, 28);
			actualDate=new Date(2005, 9, 31);
			actualDate=DateUtils.setMonth(actualDate, actualDate.month + 4);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.setMonth(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testSetDay():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.setDate(DAY_OF_MONTH + 1);
			var actualDate:Date=DateUtils.setDay(cloneDate(CONTROL_DATE), DAY_OF_MONTH + 1);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.setDay(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testSetHour():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.setHours(HOUR + 1, MINUTE, SECOND);
			var actualDate:Date=DateUtils.setHours(cloneDate(CONTROL_DATE), HOUR + 1);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.setHours(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testSetMinute():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.setMinutes(MINUTE + 1, SECOND, MILLIS);
			var actualDate:Date=DateUtils.setMinutes(cloneDate(CONTROL_DATE), MINUTE + 1);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.setMinutes(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testSetSeconds():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.setSeconds(SECOND + 1, MILLIS);
			var actualDate:Date=DateUtils.setSeconds(cloneDate(CONTROL_DATE), SECOND + 1);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.setSeconds(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testSetMillseconds():void {
			var expectedDate:Date=cloneDate(CONTROL_DATE);
			expectedDate.setMilliseconds(MILLIS + 1);
			var actualDate:Date=DateUtils.setMilliseconds(cloneDate(CONTROL_DATE), MILLIS + 1);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.setMilliseconds(null, 2);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		/*
		 * Conversion Functions
		 */
		public function testGetUTCDate():void {
			var actualDate:Date=DateUtils.getUTCDate(CONTROL_DATE);
			var expectedDate:Date=new Date(CONTROL_DATE.fullYearUTC, CONTROL_DATE.monthUTC, CONTROL_DATE.dateUTC, CONTROL_DATE.hoursUTC, CONTROL_DATE.minutesUTC, CONTROL_DATE.secondsUTC, CONTROL_DATE.millisecondsUTC);
			assertSameDateInstant(expectedDate, actualDate);
		}

		/*
		 * Period Functions
		 */
		public function testGetStartOfYear():void {
			var expectedDate:Date=new Date(YEAR, 0, 1, 0, 0, 0, 0);
			var actualDate:Date=DateUtils.getStartOfYear(CONTROL_DATE);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.getStartOfYear(null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testGetStartOfMonth():void {
			var expectedDate:Date=new Date(YEAR, MONTH, 1, 0, 0, 0, 0);
			var actualDate:Date=DateUtils.getStartOfMonth(CONTROL_DATE);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.getStartOfMonth(null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testGetStartOfWeek():void {
			var expectedDate:Date=new Date(YEAR, MONTH, DAY_OF_MONTH - CONTROL_DATE.day, 0, 0, 0, 0);
			var actualDate:Date=DateUtils.getStartOfWeek(CONTROL_DATE);
			assertSameDateInstant(expectedDate, actualDate);
			assertTrue(actualDate.day == 0);

			try {
				DateUtils.getStartOfWeek(null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testGetStartOfDay():void {
			var expectedDate:Date=new Date(YEAR, MONTH, DAY_OF_MONTH, 0, 0, 0, 0);
			var actualDate:Date=DateUtils.getStartOfDay(CONTROL_DATE);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.getStartOfDay(null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}


		public function testGetEndOfYear():void {
			var expectedDate:Date=new Date(YEAR, 11, 31, 23, 59, 59, 999);
			var actualDate:Date=DateUtils.getEndOfYear(CONTROL_DATE);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.getEndOfYear(null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testGetEndOfMonth():void {
			var expectedDate:Date=new Date(YEAR, MONTH, 31, 23, 59, 59, 999);
			var actualDate:Date=DateUtils.getEndOfMonth(CONTROL_DATE);
			assertSameDateInstant(expectedDate, actualDate);

			// Leap Year - Feb 29 
			expectedDate=new Date(2000, 1, 29, 23, 59, 59, 999);
			actualDate=DateUtils.getEndOfMonth(new Date(2000, 1, 1));
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.getEndOfMonth(null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testGetEndOfWeek():void {
			var expectedDate:Date=new Date(YEAR, MONTH, 5, 23, 59, 59, 999);
			var actualDate:Date=DateUtils.getEndOfWeek(CONTROL_DATE);
			assertSameDateInstant(expectedDate, actualDate);
			assertEquals(actualDate.day, 6);

			try {
				DateUtils.getEndOfWeek(null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testGetEndOfDay():void {
			var expectedDate:Date=new Date(YEAR, MONTH, DAY_OF_MONTH, 23, 59, 59, 999);
			var actualDate:Date=DateUtils.getEndOfDay(CONTROL_DATE);
			assertSameDateInstant(expectedDate, actualDate);

			try {
				DateUtils.getEndOfDay(null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}


		/*
		 * Diff functions
		 */
		public function testGetDaysDiff():void {
			var endDate:Date=DateUtils.addDays(CONTROL_DATE, 1);
			assertEquals(1, DateUtils.getDaysDiff(CONTROL_DATE, endDate));

			endDate=DateUtils.addHours(CONTROL_DATE, 25);
			assertEquals(2, DateUtils.getDaysDiff(CONTROL_DATE, endDate));

			try {
				DateUtils.getDaysDiff(null, new Date());
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
			try {
				DateUtils.getDaysDiff(new Date(), null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
			try {
				DateUtils.getDaysDiff(null, null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
			
			// Issue 27
			var start:Date = new Date(2010, 10, 7);
			var end:Date = new Date(2010, 10, 8);
			assertEquals(1, DateUtils.getDaysDiff(start, end));			
			
		}

		public function testGetHoursDiff():void {
			var endDate:Date=DateUtils.addDays(CONTROL_DATE, 1);
			assertEquals(24, DateUtils.getHoursDiff(CONTROL_DATE, endDate));

			endDate=DateUtils.addHours(CONTROL_DATE, 25);
			assertEquals(25, DateUtils.getHoursDiff(CONTROL_DATE, endDate));

			endDate=DateUtils.addMinutes(CONTROL_DATE, DateUtils.MINUTES_PER_HOUR * 27 + 1);
			assertEquals(28, DateUtils.getHoursDiff(CONTROL_DATE, endDate));

			try {
				DateUtils.getHoursDiff(null, new Date());
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
			try {
				DateUtils.getHoursDiff(new Date(), null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
			try {
				DateUtils.getHoursDiff(null, null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testGetMinutesDiff():void {
			var endDate:Date=DateUtils.addDays(CONTROL_DATE, 1);
			assertEquals(24 * DateUtils.MINUTES_PER_HOUR, DateUtils.getMinutesDiff(CONTROL_DATE, endDate));

			endDate=DateUtils.addHours(CONTROL_DATE, 25);
			assertEquals(25 * DateUtils.MINUTES_PER_HOUR, DateUtils.getMinutesDiff(CONTROL_DATE, endDate));

			endDate=DateUtils.addMinutes(CONTROL_DATE, DateUtils.MINUTES_PER_HOUR * 27 + 1);
			assertEquals(27 * DateUtils.MINUTES_PER_HOUR + 1, DateUtils.getMinutesDiff(CONTROL_DATE, endDate));

			endDate=DateUtils.addSeconds(CONTROL_DATE, DateUtils.SECONDS_PER_MINUTE * 30 + 1);
			assertEquals(31, DateUtils.getMinutesDiff(CONTROL_DATE, endDate));

			endDate=DateUtils.addMilliseconds(CONTROL_DATE, 1);
			assertEquals(1, DateUtils.getMinutesDiff(CONTROL_DATE, endDate));

			try {
				DateUtils.getMinutesDiff(null, new Date());
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
			try {
				DateUtils.getMinutesDiff(new Date(), null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
			try {
				DateUtils.getMinutesDiff(null, null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}


		/*
		 * Misc Functions
		 */
		public function testIsLeapYear():void {
			assertTrue(DateUtils.isLeapYear(new Date(2004, 1, 1)));
			assertTrue(DateUtils.isLeapYear(new Date(2000, 1, 1)));
			assertFalse(DateUtils.isLeapYear(new Date(2006, 1, 1)));
			assertFalse(DateUtils.isLeapYear(new Date(1900, 1, 1)));
			assertFalse(DateUtils.isLeapYear(new Date(2003, 1, 1)));

			try {
				DateUtils.isLeapYear(null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function isWeekDay():void {
			assertTrue(DateUtils.isWeekDay(new Date(2010, 0, 1))); // Friday
			assertFalse(DateUtils.isWeekDay(new Date(2010, 0, 2)));
			assertFalse(DateUtils.isWeekDay(new Date(2010, 0, 3)));
			assertTrue(DateUtils.isWeekDay(new Date(2010, 0, 4)));
			assertTrue(DateUtils.isWeekDay(new Date(2010, 0, 5)));
			assertTrue(DateUtils.isWeekDay(new Date(2010, 0, 6)));
			assertTrue(DateUtils.isWeekDay(new Date(2010, 0, 7)));

			try {
				DateUtils.isWeekDay(null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}

		public function testIsWeekEnd():void {
			assertFalse(DateUtils.isWeekEnd(new Date(2010, 0, 1))); // Friday
			assertTrue(DateUtils.isWeekEnd(new Date(2010, 0, 2)));
			assertTrue(DateUtils.isWeekEnd(new Date(2010, 0, 3)));
			assertFalse(DateUtils.isWeekEnd(new Date(2010, 0, 4)));
			assertFalse(DateUtils.isWeekEnd(new Date(2010, 0, 5)));
			assertFalse(DateUtils.isWeekEnd(new Date(2010, 0, 6)));
			assertFalse(DateUtils.isWeekEnd(new Date(2010, 0, 7)));

			try {
				DateUtils.isWeekEnd(null);
				fail();
			} catch (iae:IllegalArgumentError) {
				assertTrue(true);
			}
		}


		/*
		 *  Test Helpers
		 */
		private function cloneDate(date:Date):Date {
			return ObjectUtils.clone(date);
		}

		private function assertSameDateInstant(date1:Date, date2:Date):void {
			assertTrue(DateUtils.isSameInstant(date1, date2));
		}
	}
}
