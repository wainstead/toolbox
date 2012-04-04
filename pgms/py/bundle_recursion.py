import pyutils

def render(bundlelist):
	for idx, bundle in enumerate(bundlelist):
		print "%d: " % idx,
		for key in sorted(bundle.keys()):
			print key, bundle[key],
		print


class Foo:
	def _recursively_build_test_bundles(self, aspects, bundlelist=[]):
		"""
		Input: a list of DataAspect subclass instances, a list of Bundle types
		Output: a list of Bundle instances
		"""
		assert type(bundlelist) == type(list()), "Bundlelist must be of type 'list'"

		if not aspects: return bundlelist # supply exhausted

		if not bundlelist:
			# first time through, so initialize our bundlelist
			for t in aspects[0].get_testable_values():
				b = pyutils.Bundle()
				b[t[0]] = t[1]
				bundlelist.append(b)
   			return self._recursively_build_test_bundles(aspects[1:], bundlelist)

		# already through once, continuing
	   	bl = []
   		for t in aspects[0].get_testable_values():
			for bundle in bundlelist:
				b = bundle.copy()
				b[t[0]] = t[1]
				bl.append(b)
	   	return self._recursively_build_test_bundles(aspects[1:], bl)

class Aspect(object):
	""" Mock object to imitate DataAspect subclasses """
	def __init__(self, itslist):
		self.list = itslist
	def get_testable_values(self):
		return self.list

aspects = [
	Aspect(
		[('blee', 1), ('blar', 2), ('blaz', 3),]
		),
	Aspect(
		[('all  ', -1),('ah nwa ', 0),('an org ', 1),('another', 2)]
		),
	Aspect(
		[('startdate', '2/2/2012'), ]
		),
	Aspect(
		[('end  date', '3/3/2013'),]
		),
	Aspect(
		[('state_id', 34), ('state_id', 49)]
		),
]


f = Foo()
bundlelist = f._recursively_build_test_bundles(aspects)
render(bundlelist)

#bb = pyutils.Bundle({'org_id': 100})
bb = pyutils.Bundle()
bb['org_id'] = 100
bundlelist = f._recursively_build_test_bundles(aspects[0:2], [bb,])
render(bundlelist)

print "End of line."
