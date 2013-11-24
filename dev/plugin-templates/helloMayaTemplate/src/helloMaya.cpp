//////////////////////////////////////////////////////////////////////////////
//
// This file is part of helloMayaTemplate.
// 
// 	Copyright 2013 Kari Brown
// 
//  helloMayaTemplate is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published
//  by the Free Software Foundation, either version 3 of the License, or (at
//  your option) any later version.
//
//  helloMayaTemplate is distributed in the hope that it will be useful, but
//  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
//  or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
//  License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with helloMayaTemplate.
//  If not, see <http://www.gnu.org/licenses/>.
//
//////////////////////////////////////////////////////////////////////////////


#include "config.h"

#include <maya/MGlobal.h>
#include <maya/MString.h>
#include <maya/MSimple.h>

DeclareSimpleCommand(helloMaya, PLUGIN_VENDOR, PACKAGE_VERSION);

MStatus helloMaya::doIt(const MArgList&)
{
	MString pkg(PACKAGE_STRING);
	MString info("Hello Maya World! This is " + pkg);
	MGlobal::displayInfo(info);

	return MS::kSuccess;
}
