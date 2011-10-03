# -*- coding: utf-8 -*-
from ctypes import byref, CDLL, c_char_p, c_wchar_p, c_void_p, POINTER

class FST(object):
	def __init__(self, libpath, fstpath):
		self.__lib = CDLL(libpath)

		self.__lib.init.argtypes = [POINTER(c_char_p), c_char_p]
		self.__lib.init.restype = c_void_p

		self.__lib.terminate.argtypes = [c_void_p]
		self.__lib.terminate.restype = None

		self.__lib.analyse.argtypes = [c_void_p, c_wchar_p]
		self.__lib.analyse.restype = POINTER(c_wchar_p)

		self.__lib.free_analyses.argtypes = [POINTER(c_wchar_p)]
		self.__lib.free_analyses.restype = None

		error = c_char_p()
		self.__handle = self.__lib.init(byref(error), fstpath)
		if error.value != None:
			self.__handle = 0
			raise Exception(u"Initialization of fst failed: " + unicode(error.value, "UTF-8"))
	
	def __del__(self):
		if (self.__handle != 0):
			self.__handle = 0
			class DummyLib:
				def __getattr__(obj, name):
					raise Exception("Attempt to use library after terminate() was called")
			self.__lib = DummyLib()
		
	def analyse(self, word):
		if u"\0" in word:
			raise Exception("NUL in text, TODO")
		ana_p = self.__lib.analyse(self.__handle, word)
		if ana_p:
			analysis = ana_p.contents.value
		else:
			analysis = ""
		self.__lib.free_analyses(ana_p)
		return analysis
