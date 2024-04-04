class Solution(object):
    def sumOfTheDigitsOfHarshadNumber(self, x):
        """
        :type x: int
        :rtype: int
        """
        digit_sum = 0
        for digit in str(x):
            digit_sum += int(digit)
        if digit_sum != 0 and x % digit_sum == 0:
            return digit_sum
        return -1