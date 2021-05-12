# -*- coding: utf-8 -*-
"""
Created on Tue May 11 22:26:22 2021

@author: admin
"""

#def get_res(txt):
#    return sum([1 for x in txt.lower() if x in 'aeiou'])


import unittest
from count_vowels import get_res

class TestVowels(unittest.TestCase):
      
  def test_count(self):
    self.assertEqual(get_res("WinPython Control Panel"), 6)
    
  def test_bad_input(self):
   self.assertEqual(get_res("WinPython Control Panel"), 6)
   with self.assertRaises(AttributeError):
      get_res(2)
      
      
   

  
if __name__ == "__main__":
  unittest.main()