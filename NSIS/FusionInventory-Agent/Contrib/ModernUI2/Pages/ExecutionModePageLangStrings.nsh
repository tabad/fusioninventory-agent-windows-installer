/*
   ------------------------------------------------------------------------
   FusionInventory Agent Installer for Microsoft Windows
   Copyright (C) 2010-2013 by the FusionInventory Development Team.

   http://www.fusioninventory.org/ http://forge.fusioninventory.org/
   ------------------------------------------------------------------------

   LICENSE

   This file is part of FusionInventory project.

   FusionInventory Agent Installer for Microsoft Windows is free software;
   you can redistribute it and/or modify it under the terms of the GNU
   General Public License as published by the Free Software Foundation;
   either version 2 of the License, or (at your option) any later version.


   FusionInventory Agent Installer for Microsoft Windows is distributed in
   the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
   PURPOSE. See the GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software Foundation,
   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA,
   or see <http://www.gnu.org/licenses/>.

   ------------------------------------------------------------------------

   @package   FusionInventory Agent Installer for Microsoft Windows
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\ExecutionModePageLangStrings.nsh
   @author    Manuel J. Garrido <manuel.garrido@gmail.com>
   @copyright Copyright (c) 2010-2013 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_EXECUTIONMODEPAGE_LANGSTRINGS_INCLUDE__
!define __FIAI_EXECUTIONMODEPAGE_LANGSTRINGS_INCLUDE__


;--------------------------------
; LangString Variables

; ExecutionModePage_Text
LangString ExecutionModePage_Text ${LANG_ENGLISH} "Choose an Execution Mode"
LangString ExecutionModePage_Text ${LANG_FRENCH} "fChoose an Execution Mode"
LangString ExecutionModePage_Text ${LANG_SPANISH} "Elija un modo de ejecución"

; ExecutionModePage_SubText
LangString ExecutionModePage_SubText ${LANG_ENGLISH} "Choose which way you want ${PRODUCT_NAME} to be executed."
LangString ExecutionModePage_SubText ${LANG_FRENCH} "fChoose which way you want ${PRODUCT_NAME} to be executed."
LangString ExecutionModePage_SubText ${LANG_SPANISH} "Elija de qué manera quiere que se ejecute ${PRODUCT_NAME}."

; ExecutionModePage_GroupBox1_Text
LangString ExecutionModePage_GroupBox1_Text ${LANG_ENGLISH} "Execution Mode"
LangString ExecutionModePage_GroupBox1_Text ${LANG_FRENCH} "fExecution Mode"
LangString ExecutionModePage_GroupBox1_Text ${LANG_SPANISH} "Modo de Ejecución"

; ExecutionModePage_RadioButton1_Text
LangString ExecutionModePage_RadioButton1_Text ${LANG_ENGLISH} "As a Windows Service"
LangString ExecutionModePage_RadioButton1_Text ${LANG_FRENCH} "fAs a Windows Service"
LangString ExecutionModePage_RadioButton1_Text ${LANG_SPANISH} "Como un Servicio de Windows"

; ExecutionModePage_RadioButton2_Text
LangString ExecutionModePage_RadioButton2_Text ${LANG_ENGLISH} "As a Windows Task"
LangString ExecutionModePage_RadioButton2_Text ${LANG_FRENCH} "fAs a Windows Task"
LangString ExecutionModePage_RadioButton2_Text ${LANG_SPANISH} "Como una Tarea de Windows"

; ExecutionModePage_RadioButton3_Text
LangString ExecutionModePage_RadioButton3_Text ${LANG_ENGLISH} "Manually"
LangString ExecutionModePage_RadioButton3_Text ${LANG_FRENCH} "fManually"
LangString ExecutionModePage_RadioButton3_Text ${LANG_SPANISH} "Manualmente"


!endif
