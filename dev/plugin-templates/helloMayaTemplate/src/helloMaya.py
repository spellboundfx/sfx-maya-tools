import pymel.core as pm

def helloMayaPy():
	pm.loadPlugin('helloMaya.so')
	pm.language.evalEcho('helloMaya')
