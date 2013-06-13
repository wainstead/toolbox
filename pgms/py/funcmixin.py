#!/usr/bin/env python

class SomeParentClass(object):
	"""
	Generic parent class.

	This class stands in for the parent class, which we're not
	interested in, in this example. We care about passing in a mixin
	class to extend this class.

	"""
	def hooha(self):
		print "I am a perfect picture of a perfect major-general."

class EmptyMixin(object):
	"""
	Interface definition.

	Many examples of this throughout SSC code. We'll create an empty
	WEEBLAM class field. Using 'None' had the adverse effect of
	printing out the word 'None.'

	"""
	WEEBLAM = ""

def make_class(x, y, MyMixinClass=EmptyMixin):
	"""
	Define a class and return it.

	Use variables passed in, in the construction of the class. Like a
	closure.

	"""

	class Foo(SomeParentClass, MyMixinClass):
		"""Example 'closure' class, so to speak."""
		SOMETHING = x
		SOMETHING_ELSE = y
		def __init__(self):
			pass
		def printsomething(self):
			print self.SOMETHING, self.SOMETHING_ELSE, self.WEEBLAM

	return Foo

class Mixin(EmptyMixin):
	WEEBLAM = 'need a date?'

MyFoo = make_class("hello", "sailor", MyMixinClass=Mixin)
foo = MyFoo()
foo.printsomething()

NextFoo = make_class("Sir Richard", "Humpaloaf")
nfoo = NextFoo()
nfoo.printsomething()
